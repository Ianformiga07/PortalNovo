  <!--#include file="base.asp"-->
    <%
call abreConexao
' Excluir registro se o ID for passado e a ação for exclusão
If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("id_licitantes")) Then
    Dim id_licitantes
    id_licitantes = Request.Form("id_licitantes")
    sql = "DELETE FROM cam_licitantes WHERE id_licitantes = " & id_licitantes
    conn.Execute(sql)
    response.Redirect "list-licitantes.asp?Resp=3"
End If


sql = "SELECT * FROM cam_licitantes"
set rs_Licitantes = conn.execute(sql)

%>

<script>
function admin(cnpjCpfLicitante, id_licitantes) {
    //alert(cnpjCpfLicitante+'-'+id_licitantes)
    var form = document.forms["frmlicitantes"];
    form.Operacao.value = 1;
    form.id_licitantes.value = id_licitantes;
    form.cnpjCpfLicitante.value = cnpjCpfLicitante;
    form.action = "cad-licitantes.asp";
    form.submit();
}


function confirmarExclusao(id_licitantes) {
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
            var form = document.forms["frmlicitantes"];
            form.id_licitantes.value = id_licitantes;
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
          <i class="fa fa-edit text-blue"></i> Licitantes
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Licitantes</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-licitantes.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Licitante</a>
              </div>
            <!-- /.box-header -->
          <form method="post" name="frmlicitantes">
            <input type="hidden" name="id_licitantes" id="id_licitantes">
            <input type="hidden" name="cnpjCpfLicitante" id="cnpjCpfLicitante" value="<%=cnpjCpfLicitante%>">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="acao" id="acao">
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Fornecedor</th>
                  <th>CPF/CNPJ</th>
                  <th>Habilitado</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
              <%do while not rs_Licitantes.eof %>
                <tr>
                  <td><%=rs_Licitantes("nomeFantasia")%></td>
                  <td><%=rs_Licitantes("cnpjCpfLicitante")%></td>
                  <td><%if rs_Licitantes("statusLicitante") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                  <td>
                  <a href="#" onClick="admin('<%=rs_Licitantes("cnpjCpfLicitante")%>', '<%=rs_Licitantes("id_licitantes")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button type="button" onClick="confirmarExclusao('<%=rs_Licitantes("id_licitantes")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
              <% rs_Licitantes.movenext 
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