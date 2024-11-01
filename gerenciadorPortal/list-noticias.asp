  <!--#include file="base.asp"-->
<%
call abreConexao

' Excluir registro se o ID for passado e a ação for exclusão
'If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("rs_noticia")) Then
    'Dim rs_noticia
    'rs_noticia = Request.Form("rs_noticia")
    'sql = "DELETE FROM cam_diarioOfi WHERE rs_noticia = " & rs_noticia
    'conn.Execute(sql)
    'response.Redirect "list-diario.asp?Resp=3"
'End If

sql = "SELECT * FROM cam_noticias ORDER BY id_noticia DESC"
set rs_noticia = conn.execute(sql)
%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Postagens
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Postagens</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-noticias.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Nova Postagem</a>
              </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
              <%if rs_noticia.eof then%>
                  <div class="alert alert-danger alert-dismissible" style="background-color: rgba(220, 53, 69, 0.1);">
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                      Não há diários cadastrados na base de dados.
                  </div>
              <%Else%>  
                <thead>
                <tr>
                  <th></th>
                  <th>Título</th>
                  <th>Data</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
              <%do while not rs_diario.eof %>
                <tr>
                  <td><div class="img-thumbnail" style="text-align: center;"><img src="upNoticias/<%'= anexo_diario %>" alt="" style="height: 40px; width: 70px;"></div></td>
                  <td><%=rs_noticia("")%></td>
                  <td><%=rs_noticia("")%></td>
                  <td><%if rs_noticia("") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                  <td>
                  <a href="#" data-skin="skin-blue" class="btn btn-primary btn-xs"><i class="fa fa-star"></i></a>
                  <a href="#" onClick="admin('<%=rs_noticia("")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button type="button" onClick="confirmarExclusao('<%'=rs_diario("id_diario")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
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
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>

  </div>

<!--#include file="footer.asp"-->