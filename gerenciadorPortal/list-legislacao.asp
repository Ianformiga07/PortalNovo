  <!--#include file="base.asp"-->
  <%
call abreConexao

' Excluir registro se o ID for passado e a ação for exclusão
If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("id_legislacao")) Then
    Dim id_legislacao
    id_legislacao = Request.Form("id_legislacao")
    sql = "DELETE FROM cam_legislacao WHERE id_legislacao = " & id_legislacao
    conn.Execute(sql)
    response.Redirect "list-legislacao.asp?Resp=3"
End If

sql = "SELECT cam_legislacao.id_legislacao, cam_legislacao.id_categoriaLeg, cam_legislacao.descricao, cam_legislacao.id_AutorVer, cam_legislacao.status_Leg, cam_legislacao.dataCad, cam_legislacao.numeroDoc,  cam_categoriaLeg.descricao AS Categoria FROM cam_legislacao INNER JOIN cam_categoriaLeg ON cam_categoriaLeg.id_categoriaLeg = cam_legislacao.id_categoriaLeg"
set rs_leg = conn.execute(sql)
%>

<script>
function admin(id_legislacao) {
    var form = document.forms["frmCadLeg"];
    form.id_legislacao.value = id_legislacao;
    form.action = "cad-legislacao.asp";
    form.submit();
}

function confirmarExclusao(id_legislacao) {
    Swal.fire({
        title: 'Tem certeza?',
        text: "Essa ação não poderá ser desfeita!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Sim, excluir!',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            var form = document.forms["frmCadLeg"];
            form.id_legislacao.value = id_legislacao;
            form.acao.value = "excluir";
            form.submit();
        }
    });
}
</script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Legislacao
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Legislacao</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-legislacao.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Documento</a>
              </div>
            <!-- Box Header -->
            <form method="post" name="frmCadLeg">
              <input type="hidden" name="id_legislacao" id="id_legislacao">
              <input type="hidden" name="acao" id="acao">
              <!-- /.box-header -->
              <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                <%if rs_leg.eof then%>
                    <div class="alert alert-danger alert-dismissible" style="background-color: rgba(220, 53, 69, 0.1);">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                        Não há diários cadastrados na base de dados.
                    </div>
                <%Else%>   
                  <thead>
                  <tr>
                    <th>Categoria</th>
                    <th>Numero Documento</th>
                    <th>Descrição</th>
                    <th>Data</th>
                    <th>Status</th>
                    <th>Ações</th>
                  </tr>
                  </thead>
                  <tbody>
                <%do while not rs_leg.eof %>
                  <tr>
                    <td><%=rs_leg("Categoria")%></td>
                    <td><%=rs_leg("numeroDoc")%></td>
                    <td><%=rs_leg("descricao")%></td>
                    <td><%=rs_leg("dataCad")%></td>
                    <td><%if rs_leg("status_Leg") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                    <td>
                    <a href="#" onClick="admin('<%=rs_leg("id_legislacao")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                    <button type="button" onClick="confirmarExclusao('<%=rs_leg("id_legislacao")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                    </td>
                  </tr>
                    <% rs_leg.movenext 
                    loop %>  
                  </tbody>
                <%end if%>
                <%call fechaConexao%>
                </table>
              </div>
            </form>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>

  </div>
<!-- Campo hidden para o valor de Resp -->
<input type="hidden" id="hiddenResp" value="<%= Request("Resp") %>">

<!-- SweetAlert e script para limpar URL -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  window.onload = function() {
    var resp = document.getElementById('hiddenResp').value;

    if (resp == "1") {
      Swal.fire({
        icon: 'success',
        title: 'Dados Cadastrado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "3") {
      Swal.fire({
        icon: 'success',
        title: 'Dados Excluído com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    }

    // Limpar a URL removendo o parâmetro 'Resp'
    if (resp) {
      const url = new URL(window.location);
      url.searchParams.delete('Resp');

      // Verificar se ainda há parâmetros na URL após a remoção de 'Resp'
      if (url.searchParams.toString() === '') {
        // Se não houver mais parâmetros, substitua a URL apenas pelo pathname
        window.history.replaceState(null, null, url.pathname);
      } else {
        // Caso contrário, substitua a URL com os parâmetros restantes
        window.history.replaceState(null, null, url);
      }
    }
  };
</script>
<!--#include file="footer.asp"-->