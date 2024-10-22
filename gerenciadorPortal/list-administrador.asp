<!--#include file="base.asp"-->
<%
call abreConexao
  sql = "SELECT id_servidor, CPF, NomeCompleto, DataNascimento, Sexo, EstadoCivil, Matricula, RG, OrgaoExpedidor, id_Escolaridade, CEP, Endereco, Numero, Bairro, Complemento, Cidade, UF, Celular, Email, nivelAcesso, senha, id_permissao, statusServidor, FotoPerfil FROM cam_servidores WHERE nivelAcesso = 1 OR nivelAcesso = 2 OR nivelAcesso = 3"
  set rs_admin = conn.execute(sql)

%>

<script>
function admin(idServidor)
{

    var form = document.forms["frm_BuscaServ"];
    form.idServidor.value = idServidor;
    form.action = "cad-administrador.asp";
    form.submit();
    
}
</script>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Administradores
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Administradores</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="sel-admin.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Cadastro</a>
              </div>
              <form action="sel-admin.asp" method="post" name="frm_BuscaServ">
                <input type="hidden" name="idServidor" id="idServidor">
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
            <%if rs_admin.eof then%>
              <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                Não há administradores cadastrados na base de dados.
              </div>
            <%Else%>
                <thead>
                <tr>
                  <th>#</th>
                  <th>CPF</th>
                  <th>Nome</th>
                  <th>Perfil</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
            <%do while not rs_admin.eof %>
                <tr>
                  <%if FotoPerfil <> "" then%>
                  <td>
                  <img src=".\<%= FotoPerfil %>" alt="User Image" style="height: 40px; width: 40px;">
                  </td>
                  <%else%>
                  <td>
                  <img src="images/avatar.jpg" alt="User Image" style="height: 40px; width: 40px;">
                  </td>
                  <%end if%>
                  <td><%=rs_admin("CPF")%></td>
                  <td><%=rs_admin("NomeCompleto")%></td>
                  <td><%if rs_admin("nivelAcesso") = 1 then%>Administrador Geral<%elseif rs_admin("nivelAcesso") = 2 then%>Administrador<%else%>Editor<%end if%></td>
                  <td><%if rs_admin("statusServidor") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                  <%if rs_admin("CPF") = "04426330173" then%>
                  <td>
                  </td>
                  <%else%>
                  <td>
                  <a href="#" onClick="admin('<%=rs_admin("id_servidor")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                  <%end if%>
                </tr>
            <% rs_admin.movenext 
              loop 
              %>  
                </tbody>
            <%end if%>
            <%call fechaConexao%>
              </table>
            </div>
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