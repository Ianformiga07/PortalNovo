  <!--#include file="base.asp"-->
    <%
call abreConexao

' Excluir registro se o ID for passado e a ação for exclusão
If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("id_legislacao")) Then
    Dim id_legislacao
    id_legislacao = Request.Form("id_legislacao")
    sql = "DELETE FROM cam_legislacao WHERE id_legislacao = " & id_legislacao
    conn.Execute(sql)
    response.Redirect "list-legislacao.asp?Resp=3"
End If

sql = "SELECT id_servidor, CPF, NomeCompleto, DataNascimento, id_TipoAdmissao, id_Cargo, FotoPerfil, statusServidor FROM cam_servidores"
set rs_Ver = conn.execute(sql)
%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Vereadores
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
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
                <tr>
                  <td><div class="img-thumbnail"><img src="<%=rs_Ver("")%>" alt="" style="height: 35px; width: 40px;"></div></td>
                  <td><%=rs_Ver("")%></td>
                  <td><%=rs_Ver("")%></td>
                  <td><%=rs_Ver("")%></td>
                  <td><%if rs_Ver("status_Leg") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                  <td>
                  <a href="cad-vereador.asp" class="btn btn-primary btn-xs"><i class="fa fa-plus fa-2x"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash fa-2x"></i></button>
                  </td>
                </tr>
                </tbody>
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