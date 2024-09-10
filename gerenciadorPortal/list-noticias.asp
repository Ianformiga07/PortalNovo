  <!--#include file="base.asp"-->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Postagens
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
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
                <tr>
                  <td><div class="img-thumbnail" style="text-align: center;"><img src="https://ananas.to.leg.br/storage/noticias/2317272024042066247737adb89.jpeg" alt="" style="height: 40px; width: 70px;"></div></td>
                  <td>13ª Sessão Ordinária da Câmara Municipal de Ananás/TO Destaca Discussões e Decisões Importantes</td>
                  <td>14/07/2024</td>
                  <td>Ativo</td>
                  <td>
                  <a href="#" data-skin="skin-blue" class="btn btn-primary btn-xs"><i class="fa fa-star"></i></a>
                  <a href="dashboard.php?control=users/create&amp;id=183" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
                <tr>
                  <td><div class="img-thumbnail" style="text-align: center;"><img src="https://ananas.to.leg.br/storage/noticias/2317272024042066247737adb89.jpeg" alt="" style="height: 40px; width: 70px;"></div></td>
                  <td>13ª Sessão Ordinária da Câmara Municipal de Ananás/TO Destaca Discussões e Decisões Importantes</td>
                  <td>14/07/2024</td>
                  <td>Ativo</td>
                  <td>
                  <a href="#" data-skin="skin-blue" class="btn btn-primary btn-xs"><i class="fa fa-star"></i></a>
                  <a href="dashboard.php?control=users/create&amp;id=183" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
                <tr>
                  <td><div class="img-thumbnail" style="text-align: center;"><img src="https://ananas.to.leg.br/storage/noticias/2317272024042066247737adb89.jpeg" alt="" style="height: 40px; width: 70px;"></div></td>
                  <td>13ª Sessão Ordinária da Câmara Municipal de Ananás/TO Destaca Discussões e Decisões Importantes</td>
                  <td>14/07/2024</td>
                  <td>Ativo</td>
                  <td>
                  <a href="#" data-skin="skin-blue" class="btn btn-primary btn-xs"><i class="fa fa-star"></i></a>
                  <a href="dashboard.php?control=users/create&amp;id=183" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
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