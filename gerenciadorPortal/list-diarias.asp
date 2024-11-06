<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-line-chart text-blue"></i> Diárias
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Diárias</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-footer">
              <a href="sel-diarias.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Patrimônio</a>
            </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
              <tr>
                <th>Matrícula</th>
                <th>Nome do Funcionário</th>
                <th>Saída</th>
                <th>Chegada</th>
                <th>Destino</th>
                <th>Valor da Diária</th>
                <th>Ações</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>22</td>
                <td>THIAGO CARDOSO DE MORAIS</td>
                <td>05/06/2024</td>
                <td>07/06/2024</td>
                <td>Palmas</td>
                <td>R$ 400,00</td>
                <td>
                  <a href="edit-patrimonio.asp?id=2024001" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="patrimonios" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_2024001"><i class="fa fa-trash"></i></button>
                </td>
              </tr>
              <!-- Repetir o bloco <tr> para cada patrimônio cadastrado -->
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