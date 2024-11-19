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


sql = "SELECT cam_licitacao.id_licitacao, cam_licitacao.id_Autoridade, cam_licitacao.id_modalidade, cam_licitacao.id_RegimeSituacao, cam_licitacao.id_Situacao, cam_licitacao.NumProceso, cam_licitacao.dataAbertura, cam_licitacao.valorDespesa, cam_licitacao.objeto,   cam_liciModalidade.descModalidade, cam_liciTipoLicitacao.decTipoLici, cam_liciSituacao.descSituacao FROM cam_licitacao INNER JOIN cam_liciModalidade ON cam_licitacao.id_modalidade = cam_liciModalidade.id_Modalidade INNER JOIN  cam_liciTipoLicitacao ON cam_licitacao.id_TipoLicitacao = cam_liciTipoLicitacao.id_TipoLici inner join cam_liciSituacao ON cam_licitacao.id_Situacao = cam_liciSituacao.id_Situacao"
set rs_Licitacao = conn.execute(sql)

%>

<script>
function admin(id_licitacao) {
    var form = document.forms["frmlicitacao"];
    form.id_licitacao.value = id_licitacao;
    form.action = "cad-licitacao.asp";
    form.submit();
}


function confirmarExclusao(id_licitacao) {
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
            var form = document.forms["frmlicitacao"];
            form.id_licitacao.value = id_licitacao;
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
          <i class="fa fa-edit text-blue"></i> Licitações
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Licitações</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-licitacao.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Nova Licitacao</a>
              </div>
            <!-- /.box-header -->
          <form method="post" name="frmlicitacao">
            <input type="hidden" name="id_licitacao" id="id_licitacao">
            <input type="hidden" name="acao" id="acao">
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Nº Processo</th>
                  <th>Modalidade</th>
                  <th>Tipo</th>
                  <th>Objeto</th>
                  <th>Data Abertura</th>
                  <th>Acessórios</th>
                  <th>Situação</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
              <%do while not rs_Licitacao.eof %>
                <tr>
                  <td><%=rs_Licitacao("NumProceso")%></td>
                  <td><%=rs_Licitacao("descModalidade")%></td>
                  <td><%=rs_Licitacao("decTipoLici")%></td>
                  <td><%=rs_Licitacao("objeto")%></td>
                  <td><%=rs_Licitacao("dataAbertura")%></td>
                  <td><a href="cad-liciAnexo.asp?id=<%=rs_Licitacao("id_licitacao")%>" class="btn btn-default btn-xs"><i class="fa fa-paperclip"></i></a></td>
                  <td><%=rs_Licitacao("descSituacao")%></td>
                  <td>
                  <a href="#" onClick="admin('<%=rs_Licitacao("id_licitacao")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button type="button" onClick="confirmarExclusao('<%=rs_Licitacao("id_licitacao")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
              <% rs_Licitacao.movenext 
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