  <!--#include file="base.asp"-->
        <%
call abreConexao
' Excluir registro se o ID for passado e a ação for exclusão
If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("id_pca")) Then
    Dim id_pca
    id_pca = Request.Form("id_pca")
    sql = "DELETE FROM cam_pca WHERE id_pca = " & id_pca
    conn.Execute(sql)
    response.Redirect "list-pca.asp?Resp=3"
End If


sql = "SELECT cam_pca.id_pca, cam_categoriaLeg.descricao as DescCategoria, cam_pca.numDocumento, cam_pca.descricaoPCA, cam_pca.dataPublicacao, statusPCA FROM cam_pca inner join cam_categoriaLeg on cam_pca.id_categoriaLeg = cam_categoriaLeg.id_categoriaLeg"
set rs_pca = conn.execute(sql)

%>

<script>
function admin(id_pca) {
    var form = document.forms["frmpca"];
    form.id_pca.value = id_pca;
    form.action = "cad-pca.asp";
    form.submit();
}


function confirmarExclusao(id_pca) {
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
            var form = document.forms["frmpca"];
            form.id_pca.value = id_pca;
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
          <i class="fa fa-edit text-blue"></i> PCA - Plano de Contratação Anual
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">PCA - Plano de Contratação Anual</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-pca.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Documento</a>
              </div>
            <!-- /.box-header -->
          <form method="post" name="frmpca">
            <input type="hidden" name="id_pca" id="id_pca">
            <input type="hidden" name="acao" id="acao">
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
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
              <%do while not rs_pca.eof %>    
                <tr>
                  <td><%=rs_pca("DescCategoria")%></td>
                  <td><%=rs_pca("numDocumento")%></td>
                  <td><%=rs_pca("descricaoPCA")%></td>
                  <td><%=rs_pca("dataPublicacao")%></td>
                  <td><%if rs_pca("statusPCA") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                  <td>
                  <a href="#" onClick="admin('<%=rs_pca("id_pca")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button type="button" onClick="confirmarExclusao('<%=rs_pca("id_pca")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
              <% rs_pca.movenext 
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

<!--#include file="footer.asp"-->