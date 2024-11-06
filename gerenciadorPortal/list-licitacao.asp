  <!--#include file="base.asp"-->
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
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Nº Processo</th>
                  <th>Nº Instrumento</th>
                  <th>Modalidade</th>
                  <th>Tipo</th>
                  <th>Objeto</th>
                  <th>Data Abertura</th>
                  <th>Acessórios</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>004/2024</td>
                  <td>002/2024</td>
                  <td>Dispensavel</td>
                  <td>Menor Preco</td>
                  <td>Contratação de empresa para prestação de serviços de hospedagem rom page do site da Câmara Municipal de Carolina e portal da transparência.</td>
                  <td>17/01/2024</td>
                  <td><a href="cad-liciAnexo.asp" class="btn btn-default btn-xs"><i class="fa fa-paperclip"></i></a></td>
                  <td>Finalizado</td>
                  <td>
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