  <!--#include file="base.asp"-->
      <%
call abreConexao
' Excluir registro se o ID for passado e a ação for exclusão
If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("id_licitacao")) Then
    Dim id_licitacao
    id_licitacao = Request.Form("id_licitacao")
    sql = "DELETE FROM cam_licitacao WHERE id_licitacao = " & id_licitacao
    conn.Execute(sql)
    response.Redirect "list-licitacao.asp?Resp=3"
End If


sql = "SELECT cam_ataPreco.id_ataPreco, cam_categoriaLeg.descricao as DescCategoria, cam_ataPreco.numDocumento, cam_ataPreco.descricao, cam_ataPreco.dataPublicacao, statusAtaPreco FROM cam_ataPreco inner join cam_categoriaLeg on cam_ataPreco.id_categoriaLeg = cam_categoriaLeg.id_categoriaLeg"
set rs_ataPreco = conn.execute(sql)

%>

<script>
function admin(id_ataPreco) {
    var form = document.forms["frmAtaPreco"];
    form.id_ataPreco.value = id_ataPreco;
    form.action = "cad-ataPreco.asp";
    form.submit();
}


function confirmarExclusao(id_ataPreco) {
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
            var form = document.forms["frmAtaPreco"];
            form.id_ataPreco.value = id_ataPreco;
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
          <i class="fa fa-edit text-blue"></i> Atas de Registro de Preços
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Atas de Registro de Preços</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-ataPreco.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Documento</a>
              </div>
            <!-- /.box-header -->
          <form method="post" name="frmAtaPreco">
            <input type="hidden" name="id_ataPreco" id="id_ataPreco">
            <input type="hidden" name="acao" id="acao">
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Categoria</th>
                  <th>Numero Documento</th>
                  <th>Descrição</th>
                  <th>Data Publicação</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
              <%do while not rs_ataPreco.eof %>
                <tr>
                  <td><%=rs_ataPreco("DescCategoria")%></td>
                  <td><%=rs_ataPreco("numDocumento")%></td>
                  <td><%=rs_ataPreco("descricao")%></td>
                  <td><%=rs_ataPreco("dataPublicacao")%></td>
                  <td><%if rs_ataPreco("statusAtaPreco") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                  <td>
                  <a href="#" onClick="admin('<%=rs_ataPreco("id_ataPreco")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button type="button" onClick="confirmarExclusao('<%=rs_ataPreco("id_ataPreco")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
              <% rs_ataPreco.movenext 
                loop %>  
                </tbody>
              <%call fechaConexao%>
              </table>
            </div>
            <!-- /.box-body -->
          </form>
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
        title: 'Licitação Cadastrada com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "3") {
      Swal.fire({
        icon: 'success',
        title: 'Licitação Excluída com sucesso!',
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

      if (url.searchParams.toString() === '') {
        window.history.replaceState(null, null, url.pathname);
      } else {
        window.history.replaceState(null, null, url);
      }
    }
  };
</script>
<!--#include file="footer.asp"-->