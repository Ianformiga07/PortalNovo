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


sql = "SELECT cam_contratos.id_contrato, cam_licitacao.NumProceso, cam_contratos.numContrato, cam_contratos.descricao, cam_contratos.id_fornecedor " & _
      "FROM cam_contratos " & _
      "LEFT JOIN cam_licitacao ON cam_contratos.id_licitacao = cam_licitacao.id_licitacao"
'response.write sql
'response.end
set rs_contrato = conn.execute(sql)

%>

<script>
function admin(id_contrato) {
    var form = document.forms["frmContrato"];
    form.id_contrato.value = id_contrato;
    form.action = "cad-contratos.asp";
    form.submit();
}


function confirmarExclusao(id_contrato) {
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
            var form = document.forms["frmContrato"];
            form.id_contrato.value = id_contrato;
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
          <i class="fa fa-edit text-blue"></i> Contratos
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Contratos</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-contratos.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Contrato</a>
              </div>
            <!-- /.box-header -->
          <form method="post" name="frmContrato">
            <input type="hidden" name="id_contrato" id="id_contrato">
            <input type="hidden" name="acao" id="acao">
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Nº Instrumento</th>
                  <th>Nº Contrato</th>
                  <th>Objeto</th>
                  <th>Fornecedor</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
              <%do while not rs_contrato.eof %>
                <tr>
                  <td><%=rs_contrato("NumProceso")%></td>
                  <td><%=rs_contrato("numContrato")%></td>
                  <td><%=rs_contrato("descricao")%></td>
                  <td><% if rs_contrato("id_fornecedor") = 1 then%>NORRIS INFORCELL<%end if%></td>
                  <td>
                  <a href="#" onClick="admin('<%=rs_contrato("id_contrato")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button type="button" onClick="confirmarExclusao('<%=rs_contrato("id_contrato")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
              <% rs_contrato.movenext 
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
        title: 'Contrato Cadastrado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "3") {
      Swal.fire({
        icon: 'success',
        title: 'Contrato Excluído com sucesso!',
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