<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Convênios e Instrumentos Congêneres
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Convênios e Instrumentos Congêneres</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-footer">
              <a href="cad-convenioCongeneres.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Convênio</a>
            </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
              <tr>
                <th>Número do Convênio</th>
                <th>Descrição</th>
                <th>Valor</th>
                <th>Data de Assinatura</th>
                <th>Vigência</th>
                <th>Status</th>
                <th>Ações</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>12345</td>
                <td>Convênio de Cooperação Técnica para Infraestrutura Urbana</td>
                <td>R$ 1.200.000,00</td>
                <td>15/08/2024</td>
                <td>15/08/2025</td>
                <td>Ativo</td>
                <td>
                  <a href="#" data-skin="skin-blue" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i></a>
                  <a href="edit-convenio.asp?id=12345" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="convenios" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_12345"><i class="fa fa-trash"></i></button>
                </td>
              </tr>
              <!-- Repetir o bloco <tr> para cada convênio cadastrado -->
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