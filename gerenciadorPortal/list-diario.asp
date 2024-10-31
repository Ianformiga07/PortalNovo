  <!--#include file="base.asp"-->
  <%
  call abreConexao
  sql = "SELECT id_diario, titulo, anexo_diario, status_diario, dataCad, idUsu_Cad, idUsu_Alt, dataAlt FROM cam_diarioOfi order by id_diario DESC"
  set rs_diario = conn.execute(sql)
  %>

  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Diario Oficial
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Diario Oficial</span>
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
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
              <%if rs_diario.eof then%>
                  <div class="alert alert-danger alert-dismissible" style="background-color: rgba(220, 53, 69, 0.1);">
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                      Não há servidores cadastrados na base de dados.
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
                  <a href="#" data-skin="skin-blue" class="btn btn-primary btn-xs"><i class="fa fa-star"></i></a>
                  <a href="dashboard.php?control=users/create&amp;id=183" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
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