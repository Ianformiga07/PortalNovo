  <!--#include file="base.asp"-->
  <%
call abreConexao

sql = "SELECT cam_servidores.id_servidor, cam_servidores.CPF, cam_servidores.NomeCompleto, statusServidor, cam_servidores.DataNascimento, cam_servidores.Celular " &_
      "FROM cam_servidores WHERE (id_Cargo = '15')"
set rs_Vereador = conn.execute(sql)

%>

<script>
function admin(id_servidor, nomeVereador) {
    var form = document.forms["frmCadVereador"];
    form.id_servidor.value = id_servidor;
    form.nomeVereador.value = nomeVereador;
    form.action = "mandatosLeg.asp";
    form.submit();
}

</script>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Vereadores
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Vereadores</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary"><i class="fa fa-reply"></i> Voltar</a>
              </div>
            <!-- /.box-header -->
            <form method="post" name="frmCadVereador">
              <input type="hidden" name="id_servidor" id="id_servidor">
              <input type="hidden" name="nomeVereador" id="nomeVereador">
              <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th></th>
                    <th>Nome</th>
                    <th>Fone</th>
                    <th>Data Nascimento</th>
                    <th>Status</th>
                    <th>Ações</th>
                  </tr>
                  </thead>
                  <tbody>
                  <%do while not rs_Vereador.eof %>
                  <tr>
                    <td><div class="img-thumbnail"><%'if rs_Vereador("fotoVereador") <> "" then%><img src="<%'=rs_Vereador("fotoVereador")%>" alt="" style="height: 45px; width: 45px;"><%'else%><img src="images/avatar.jpg" alt="" style="height: 45px; width: 45px;"><%'end if%></div></td>
                    <td><%=rs_Vereador("NomeCompleto")%></td>
                    <td><%=rs_Vereador("Celular")%></td>
                    <td><%=rs_Vereador("DataNascimento")%></td>
                    <td><%if rs_Vereador("statusServidor") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                    <td>
                    <a href="#" onClick="admin('<%=rs_Vereador("id_servidor")%>', '<%=rtrim(rs_Vereador("NomeCompleto"))%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                    <button type="button" onClick="confirmarExclusao('<%=rs_Vereador("id_servidor")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                    </td>
                  </tr>
                <% rs_Vereador.movenext 
                  loop %>  
                  </tbody>

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