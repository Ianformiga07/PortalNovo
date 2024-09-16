<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-line-chart text-blue"></i> Receitas
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Receitas</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
            <div class="box-footer">
              <a href="cad-receitas.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Patrimônio</a>
            </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
              <tr>
                <th>Receita</th>
                <th>Natureza da Receita</th>
                <th>Origem do Recurso</th>
                <th>Valor Orçado (Previsão)</th>
                <th>Valor Arrecadado (Mês)</th>
                <th>Valor Acumulado</th>
                <th>Ações</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>30/08/2024</td>
                <td>5090</td>
                <td>THIAGO CARDOSO DE MORAIS</td>
                <td>339039.17.1.500.0000.000000</td>
                <td>R$ 2.670,00</td>
                <td>R$ 0,00</td>
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