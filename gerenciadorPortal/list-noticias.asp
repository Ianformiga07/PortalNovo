  <!--#include file="base.asp"-->
<%
call abreConexao

' Excluir registro se o ID for passado e a ação for exclusão
'If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("rs_noticia")) Then
    'Dim rs_noticia
    'rs_noticia = Request.Form("rs_noticia")
    'sql = "DELETE FROM cam_diarioOfi WHERE rs_noticia = " & rs_noticia
    'conn.Execute(sql)
    'response.Redirect "list-diario.asp?Resp=3"
'End If

sql = "SELECT * FROM cam_noticias ORDER BY id_noticia DESC"
set rs_noticia = conn.execute(sql)
%>

<script>
function admin(id_noticia) {
    var form = document.forms["frmNoticia"];
    form.id_noticia.value = id_noticia;
    form.action = "cad-noticias.asp";
    form.submit();
}

function confirmarExclusao(id_diario) {
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
            var form = document.forms["frmDiario"];
            form.id_diario.value = id_diario;
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
          <i class="fa fa-edit text-blue"></i> Postagens
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Postagens</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-noticias.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Nova Postagem</a>
              </div>
            <!-- /.box-header -->
            <form method="post" name="frmNoticia">
              <input type="hidden" name="id_noticia" id="id_noticia">
              <input type="hidden" name="acao" id="acao">
              <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                <%if rs_noticia.eof then%>
                    <div class="alert alert-danger alert-dismissible" style="background-color: rgba(220, 53, 69, 0.1);">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                        Não há diários cadastrados na base de dados.
                    </div>
                <%Else%>  
                  <thead>
                  <tr>
                    <th></th>
                    <th>Título</th>
                    <th>Data</th>
                    <th>Status</th>
                    <th>Ações</th>
                  </tr>
                  </thead>
                  <tbody>
                <%do while not rs_noticia.eof %>
                  <tr>
                    <td><div class="img-thumbnail" style="text-align: center;"><img src=".\<%= anexo_noticia %>" alt="" style="height: 40px; width: 70px;"></div></td>
                    <td><%=rs_noticia("titulo")%></td>
                    <td><%=rs_noticia("dataCad")%></td>
                    <td><%if rs_noticia("statusNoticia") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                    <td>
                    <a href="#" data-skin="skin-blue" class="btn btn-primary btn-xs"><i class="fa fa-star"></i></a>
                    <a href="#" onClick="admin('<%=rs_noticia("id_noticia")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                    <button type="button" onClick="confirmarExclusao('<%'=rs_diario("id_diario")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                    </td>
                  </tr>
                <% rs_noticia.movenext 
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
        title: 'Notícia Cadastrado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "2") {
      Swal.fire({
        icon: 'success',
        title: 'Notícia Alterado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "3") {
      Swal.fire({
        icon: 'success',
        title: 'Notícia Excluído com sucesso!',
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