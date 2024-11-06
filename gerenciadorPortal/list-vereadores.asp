  <!--#include file="base.asp"-->
  <%
call abreConexao

' Excluir registro se o ID for passado e a ação for exclusão
If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("id_noticia")) Then
    Dim id_noticia
    id_noticia = Request.Form("id_noticia")
    sql = "DELETE FROM cam_noticias WHERE id_noticia = " & id_noticia
    conn.Execute(sql)
    response.Redirect "list-noticias.asp?Resp=3"
End If

sql = "SELECT  * FROM cam_servidores WHERE (id_Cargo = '15')"
set rs_Vereador = conn.execute(sql)

%>
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
                <a href="cad-vereador.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Cadastro</a>
              </div>
            <!-- /.box-header -->
            <form method="post" name="frmNoticia">
              <input type="hidden" name="id_noticia" id="id_noticia">
              <input type="hidden" name="acao" id="acao">
              <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                  <%if rs_Vereador.eof then%>
                      <div class="alert alert-danger alert-dismissible" style="background-color: rgba(220, 53, 69, 0.1);">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                          <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                          Não há diários cadastrados na base de dados.
                      </div>
                  <%Else%> 
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
                    <td><div class="img-thumbnail"><%if rs_Vereador("FotoPerfil") <> "" then%><img src="<%=rs_Vereador("FotoPerfil")%>" alt="" style="height: 45px; width: 45px;"><%else%><img src="images/avatar.jpg" alt="" style="height: 45px; width: 45px;"><%end if%></div></td>
                    <td><%=rs_Vereador("NomeCompleto")%></td>
                    <td><%=rs_Vereador("Celular")%></td>
                    <td><%=rs_Vereador("DataNascimento")%></td>
                    <td><%if rs_Vereador("statusServidor") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                    <td>
                    <a href="#" onClick="admin('<%=rs_Vereador("id_servidor")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                    <button type="button" onClick="confirmarExclusao('<%=rs_Vereador("id_servidor")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                    </td>
                  </tr>
                <% rs_Vereador.movenext 
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