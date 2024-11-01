  <!--#include file="base.asp"-->
  <%
  call abreConexao
  sql = "SELECT id_diario, titulo, anexo_diario, status_diario, dataCad, idUsu_Cad, idUsu_Alt, dataAlt FROM cam_diarioOfi order by id_diario DESC"
  set rs_diario = conn.execute(sql)
  %>

<script>
function admin(id_diario)
{
    var form = document.forms["frmDiario"];
    form.id_diario.value = id_diario;
    form.action = "cad-diario.asp";
    form.submit();
    
}
</script>

  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Diario Oficial
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Diario Oficial</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-diario.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Nova Postagem</a>
              </div>
            <!-- /.box-header -->
            <form method="post" name="frmDiario">
              <input type="hidden" name="id_diario" id="id_diario">
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
              <%if rs_diario.eof then%>
                  <div class="alert alert-danger alert-dismissible" style="background-color: rgba(220, 53, 69, 0.1);">
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                      Não há servidores cadastrados na base de dados.
                  </div>
              <%Else%>                
                <thead>
                <tr>
                  <th>Título</th>
                  <th>Data</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
              <%do while not rs_diario.eof %>
                <tr>
                  <td><%=rs_diario("titulo")%></td>
                  <td><%=rs_diario("dataCad")%></td>
                  <td><%if rs_diario("status_diario") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                  <td>
                  <a href="#" onClick="admin('<%=rs_diario("id_diario")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
                  <% rs_diario.movenext 
                  loop %>  
                </tbody>
              <%end if%>
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
        title: 'Diário Cadastrado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "2") {
      Swal.fire({
        icon: 'success',
        title: 'Diário Alterado com sucesso!',
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