<!--#include file="base.asp"-->
<%
call abreConexao

' Excluir registro se o ID for passado e a ação for exclusão
If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("id_diario")) Then
    Dim id_diario
    id_diario = Request.Form("id_diario")
    sql = "DELETE FROM cam_diarioOfi WHERE id_diario = " & id_diario
    conn.Execute(sql)
    response.Redirect "list-diario.asp?Resp=3"
End If

sql = "SELECT id_diario, titulo, anexo_diario, status_diario, dataCad, idUsu_Cad, idUsu_Alt, dataAlt FROM cam_diarioOfi ORDER BY id_diario DESC"
set rs_diario = conn.execute(sql)
%>

<script>
function admin(id_diario) {
    var form = document.forms["frmDiario"];
    form.id_diario.value = id_diario;
    form.action = "cad-diario.asp";
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

<div class="content-wrapper">
  <!-- Content Header -->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Diário Oficial
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Diário Oficial</span>
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
            <!-- Box Header -->
            <form method="post" name="frmDiario">
              <input type="hidden" name="id_diario" id="id_diario">
              <input type="hidden" name="acao" id="acao">
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
              <%if rs_diario.eof then%>
                  <div class="alert alert-danger alert-dismissible" style="background-color: rgba(220, 53, 69, 0.1);">
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                      Não há diários cadastrados na base de dados.
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
                    <button type="button" onClick="confirmarExclusao('<%=rs_diario("id_diario")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
                  <% rs_diario.movenext 
                  loop %>  
                </tbody>
              <%end if%>
              <%call fechaConexao%>
              </table>
            </div>
            <!-- Box Body -->
            </form>
          </div>
          <!-- Box -->
        </div>
        <!-- Col -->
      </div>
      <!-- Row -->
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
    } else if (resp == "3") {
      Swal.fire({
        icon: 'success',
        title: 'Diário Excluído com sucesso!',
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