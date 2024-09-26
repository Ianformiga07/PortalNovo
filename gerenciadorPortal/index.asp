<!--#include file="base.asp"-->
<%
response.write Session("IdUsu")
%>
<div class="content-wrapper">
  <!-- Content Header -->
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-check-square-o text-blue"></i> Index
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Index</a></li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <!-- Estatísticas rápidas -->
      <div class="col-lg-3 col-xs-6">
        <!-- Total de Reclamações Ouvidoria -->
        <div class="small-box bg-aqua">
          <div class="inner">
            <h3>150</h3>
            <p>Total de Reclamações (Ouvidoria)</p>
          </div>
          <div class="icon">
            <i class="fa fa-comment"></i>
          </div>
          <a href="ouvidoria_reclamacoes.asp" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>

      <div class="col-lg-3 col-xs-6">
        <!-- Total de Sugestões Ouvidoria -->
        <div class="small-box bg-green">
          <div class="inner">
            <h3>75</h3>
            <p>Total de Sugestões (Ouvidoria)</p>
          </div>
          <div class="icon">
            <i class="fa fa-lightbulb-o"></i>
          </div>
          <a href="ouvidoria_sugestoes.asp" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>

      <div class="col-lg-3 col-xs-6">
        <!-- Pedidos de Informação e-SIC -->
        <div class="small-box bg-yellow">
          <div class="inner">
            <h3>45</h3>
            <p>Pedidos de Informação (e-SIC)</p>
          </div>
          <div class="icon">
            <i class="fa fa-envelope"></i>
          </div>
          <a href="esic_pedidos.asp" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>

      <div class="col-lg-3 col-xs-6">
        <!-- Pendências de Processos -->
        <div class="small-box bg-red">
          <div class="inner">
            <h3>20</h3>
            <p>Pendências de Processos</p>
          </div>
          <div class="icon">
            <i class="fa fa-exclamation-circle"></i>
          </div>
          <a href="processos_pendentes.asp" class="small-box-footer">Mais informações <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
    </div>

    <!-- Detalhamento e gráficos -->
    <div class="row">
      <div class="col-md-6">
        <!-- Gráfico de Reclamações e Sugestões -->
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Reclamações e Sugestões (Últimos 6 meses)</h3>
            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse">
                <i class="fa fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="box-body">
            <canvas id="graficoOuvidoria" style="height: 250px;"></canvas>
          </div>
        </div>
      </div>

      <div class="col-md-6">
        <!-- Tabela de Pedidos e-SIC Recentes -->
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Pedidos de Informação Recentes (e-SIC)</h3>
            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse">
                <i class="fa fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="box-body">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Solicitante</th>
                  <th>Status</th>
                  <th>Data</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1234</td>
                  <td>Maria Silva</td>
                  <td><span class="label label-success">Respondido</span></td>
                  <td>2024-09-01</td>
                </tr>
                <!-- Outras linhas -->
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Informações adicionais -->
    <div class="row">
      <div class="col-md-6">
        <!-- Painel de Processos Recentes -->
        <div class="box box-warning">
          <div class="box-header with-border">
            <h3 class="box-title">Processos Recentes</h3>
            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse">
                <i class="fa fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="box-body">
            <ul class="list-group">
              <li class="list-group-item">Processo nº 2024/001 - Em andamento</li>
              <li class="list-group-item">Processo nº 2024/002 - Finalizado</li>
              <li class="list-group-item">Processo nº 2024/003 - Pendente</li>
              <!-- Mais processos -->
            </ul>
          </div>
        </div>
      </div>

      <div class="col-md-6">
        <!-- Informações Úteis -->
        <div class="box box-danger">
          <div class="box-header with-border">
            <h3 class="box-title">Informações Úteis</h3>
            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse">
                <i class="fa fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="box-body">
            <ul class="list-group">
              <li class="list-group-item">Total de Vereadores: 9</li>
              <li class="list-group-item">Sessões marcadas: 3</li>
              <li class="list-group-item">Audiências públicas: 2</li>
              <!-- Outras informações -->
            </ul>
          </div>
        </div>
      </div>
    </div>

  </section>
</div>

<!--#include file="footer.asp"-->

<script>
  // Exemplo de gráfico para reclamações e sugestões
  const ctx = document.getElementById('graficoOuvidoria').getContext('2d');
  const graficoOuvidoria = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: ['Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set'],
          datasets: [{
              label: 'Reclamações',
              backgroundColor: '#f56954',
              data: [12, 19, 3, 5, 2, 3]
          }, {
              label: 'Sugestões',
              backgroundColor: '#00a65a',
              data: [10, 15, 7, 4, 6, 9]
          }]
      },
      options: {
          responsive: true,
          maintainAspectRatio: false
      }
  });
</script>