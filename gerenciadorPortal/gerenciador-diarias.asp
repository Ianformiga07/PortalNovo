<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header -->
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-plane text-blue"></i> Gerenciador de Diárias
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <li><a href="gerenciador-diarias.asp">Gerenciador de Diárias</a></li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <!-- Filter Buttons -->
      <div class="col-xs-12">
        <div class="box box-primary">
          <div class="box-header">
            <h3 class="box-title">Filtrar Diárias</h3>
            <div class="btn-group">
              <button type="button" class="btn btn-default" onclick="filterTable('pendente')">Novas</button>
              <button type="button" class="btn btn-info" onclick="filterTable('corrigida')">Corrigidas</button>
              <button type="button" class="btn btn-danger" onclick="filterTable('cancelada')">Canceladas</button>
              <button type="button" class="btn btn-default" onclick="filterTable('todos')">Todos</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Diárias Novas -->
      <div class="col-xs-12">
        <div class="box box-primary">
          <div class="box-header">
            <h3 class="box-title">Diárias Novas</h3>
          </div>
          <div class="box-body table-responsive">
            <table class="table table-bordered table-striped" id="diariasTable">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Servidor</th>
                  <th>CPF</th>
                  <th>Destino</th>
                  <th>Valor</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <!-- Exemplo de linha com dados -->
                <tr data-status="pendente">
                  <td>1</td>
                  <td>João da Silva</td>
                  <td>123.456.789-00</td>
                  <td>Brasília</td>
                  <td>R$ 150,00</td>
                  <td><span class="label label-warning">Pendente</span></td>
                  <td>
                    <a href="aprovar_diaria.asp?id=1" class="btn btn-success btn-xs">Aprovar</a>
                    <a href="corrigir_diaria.asp?id=1" class="btn btn-warning btn-xs">Corrigir</a>
                    <a href="cancelar_diaria.asp?id=1" class="btn btn-danger btn-xs">Cancelar</a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Diárias Corrigidas -->
      <div class="col-xs-12">
        <div class="box box-info">
          <div class="box-header">
            <h3 class="box-title">Diárias Corrigidas</h3>
          </div>
          <div class="box-body table-responsive">
            <table class="table table-bordered table-striped" id="diariasTable">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Servidor</th>
                  <th>CPF</th>
                  <th>Destino</th>
                  <th>Valor</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <!-- Exemplo de linha com dados corrigidos -->
                <tr data-status="corrigida">
                  <td>2</td>
                  <td>Maria dos Santos</td>
                  <td>987.654.321-00</td>
                  <td>Rio de Janeiro</td>
                  <td>R$ 200,00</td>
                  <td><span class="label label-info">Corrigida</span></td>
                  <td>
                    <a href="aprovar_diaria.asp?id=2" class="btn btn-success btn-xs">Aprovar</a>
                    <a href="cancelar_diaria.asp?id=2" class="btn btn-danger btn-xs">Cancelar</a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Diárias Canceladas -->
      <div class="col-xs-12">
        <div class="box box-danger">
          <div class="box-header">
            <h3 class="box-title">Diárias Canceladas</h3>
          </div>
          <div class="box-body table-responsive">
            <table class="table table-bordered table-striped" id="diariasTable">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Servidor</th>
                  <th>CPF</th>
                  <th>Destino</th>
                  <th>Valor</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <!-- Exemplo de linha com dados cancelados -->
                <tr data-status="cancelada">
                  <td>3</td>
                  <td>Carlos Pereira</td>
                  <td>111.222.333-44</td>
                  <td>Salvador</td>
                  <td>R$ 180,00</td>
                  <td><span class="label label-danger">Cancelada</span></td>
                  <td>
                    <a href="restaurar_diaria.asp?id=3" class="btn btn-primary btn-xs">Restaurar</a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->

<script>
  function filterTable(status) {
    var rows = document.querySelectorAll('#diariasTable tbody tr');
    rows.forEach(function(row) {
      if (status === 'todos' || row.getAttribute('data-status') === status) {
        row.style.display = '';
      } else {
        row.style.display = 'none';
      }
    });
  }
</script>