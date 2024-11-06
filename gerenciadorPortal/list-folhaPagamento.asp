<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header -->
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-line-chart text-blue"></i> Folha de Pagamentos
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <span class="font-w-600">Folha de Pagamentos</span>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- Display Alert if there is a last registration month -->
          <div class="box-header">
            <!-- Example: replace the month and year dynamically if needed -->
            <% 
              ' Exemplo de código ASP para obter o mês e ano do último cadastro
              Dim lastMonth, lastYear
              lastMonth = "Agosto" ' Aqui você deve substituir pela lógica que obtém o mês
              lastYear = "2024" ' Aqui você deve substituir pela lógica que obtém o ano
            %>
            <% If lastMonth <> "" And lastYear <> "" Then %>
              <div class="callout callout-info">
              <p><strong>Info:</strong> O último cadastro de folha de pagamentos foi realizado em <%= lastMonth %> de <%= lastYear %>.</p>
              </div>
            <% End If %>
            <a href="sel-folhaPagamento.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Pagamento</a>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
              <tr>
                <th>Mês/Ano</th>
                <th>Matrícula</th>
                <th>CPF</th>
                <th>Nome</th>
                <th>Cargo</th>
                <th>Departamento</th>
                <th>Status</th>
                <th>Total de Proventos</th>
                <th>Descontos</th>
                <th>Total Líquido</th>
                <th>Situação do Pagamento</th>
                <th>Ações</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>08/2024</td>
                <td>73</td>
                <td>xxx.263.301-xx</td>
                <td>THIAGO CARDOSO DE MORAIS</td>
                <td>Vereador</td>
                <td>Assessor de Gabinete</td>
                <td>Ativo</td>
                <td>R$ 5.500,00</td>
                <td>R$ 2.387,00</td>
                <td>R$ 3.112,00</td>
                <td><span class="label center bg-green">Pago</span></td>
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