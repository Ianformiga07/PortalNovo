  <!--#include file="base.asp"-->
  <%
  id_servidor = Request.form("id_servidor")
  nomeVereador = Request.form("nomeVereador")
call abreConexao
sql = "SELECT   cam_vereador.Id_Vereador, partido, Mandato FROM  cam_vereador INNER JOIN cam_vereadorMandato ON  cam_vereador.IdMandato = cam_vereadorMandato.IdMandato where id_servidor = '"&id_servidor&"'"
set rs_Mandatos = conn.execute(sql)
%>

<script>
function NovoMandato() {
    var form = document.forms["frmCadVereador"];
    form.action = "cad-mandatovereador.asp";
    form.submit();
}
function admin(IdVereador) {
    var form = document.forms["frmCadVereador"];
    form.IdVereador.value = IdVereador;
    form.action = "cad-vereador.asp";
    form.submit();
}
</script>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Mandatos Vereador(a)  <%=UCASE(nomeVereador)%>
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Mandatos</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="#" onclick="NovoMandato()" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Cadastro</a>
              </div>
            <!-- /.box-header -->
            <form method="post" name="frmCadVereador">
              <input type="hidden" name="id_servidor" id="id_servidor" value="<%=id_servidor%>">
              <input type="hidden" name="IdVereador" id="IdVereador" value="<%=IdVereador%>">
              <input type="hidden" name="nomeVereador" id="nomeVereador" value="<%=nomeVereador%>">
              <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                  <%if rs_Mandatos.eof then%>
                      <div class="alert alert-danger alert-dismissible" style="background-color: rgba(220, 53, 69, 0.1);">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                          <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                          Não há diários cadastrados na base de dados.
                      </div>
                  <%Else%> 
                  <thead>
                  <tr>
                    <th>id</th>
                    <th>Partido</th>
                    <th>Madatos Vereador</th>
                    <th>Ações</th>
                  </tr>
                  </thead>
                  <tbody>
                  <%do while not rs_Mandatos.eof %>
                  <tr>
                    <td><%=rs_Mandatos("Id_Vereador")%></td>
                    <td><%=rs_Mandatos("partido")%></td>
                    <td><%=rs_Mandatos("Mandato")%></td>
                    <td>
                    <a href="#" onClick="admin('<%=rs_Mandatos("Id_Vereador")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                    <button type="button" onClick="confirmarExclusao('<%=rs_Mandatos("Id_Vereador")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                    </td>
                  </tr>
                <% rs_Mandatos.movenext 
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

<!--#include file="footer.asp"-->