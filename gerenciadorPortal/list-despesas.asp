<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-archive text-blue"></i> Patrimônios da Câmara Municipal
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Patrimônios</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-footer">
              <a href="cad-patrimonios.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Patrimônio</a>
            </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
              <tr>
                <th>Número do Patrimônio</th>
                <th>Descrição</th>
                <th>Valor</th>
                <th>Data de Aquisição</th>
                <th>Estado de Conservação</th>
                <th>Status</th>
                <th>Ações</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>2024/001</td>
                <td>Mobiliário Administrativo</td>
                <td>R$ 50.000,00</td>
                <td>01/06/2024</td>
                <td>Bom</td>
                <td>Ativo</td>
                <td>
                  <a href="detalhes-patrimonio.asp?id=2024001" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i></a>
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