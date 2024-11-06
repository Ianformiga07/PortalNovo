<!--#include file="base.asp"-->
<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-search text-blue"></i> Buscar Servidor
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <li><a href="diarias.asp">Folha de Pagamentos</a></li> /
      <span class="font-w-600">Buscar Servidor</span>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- Form para buscar servidor -->
          <form id="searchForm" role="form" action="buscar_servidor.asp" method="post">
            <div class="box-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="searchCPF">Buscar por CPF</label>
                    <input type="text" class="form-control" id="searchCPF" name="searchCPF" placeholder="Digite CPF" maxlength="11">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="searchNome">Buscar por Nome</label>
                    <input type="text" class="form-control" id="searchNome" name="searchNome" placeholder="Digite o nome do servidor">
                  </div>
                </div>
              </div>
              <button type="button" class="btn btn-primary" onclick="buscarServidor()">Buscar</button>
            </div>
          </form>
        </div>

        <!-- Resultado da busca -->
        <div class="box box-primary" id="resultBox" style="display:none;">
          <div class="box-header">
            <h3 class="box-title">Resultados da Busca</h3>
          </div>
          <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>CPF</th>
                  <th>Nome</th>
                  <th>Cargo</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody id="resultTable">
                <!-- Conteúdo será preenchido via JavaScript -->
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
  function buscarServidor() {
    // Simulação de busca (trocar pela lógica real de busca em ASP ou Ajax)
    const cpf = document.getElementById('searchCPF').value;
    const nome = document.getElementById('searchNome').value;

    // Simulação de resultado da busca
    const resultado = [
      { cpf: '12345678901', nome: 'João da Silva', cargo: 'Analista' },
      { cpf: '98765432101', nome: 'Maria Oliveira', cargo: 'Técnico' }
    ];

    // Limpar a tabela de resultados anterior
    const resultTable = document.getElementById('resultTable');
    resultTable.innerHTML = '';

    // Verificar se há resultados (essa simulação assume que sempre terá, mas pode ajustar com a lógica real)
    if (resultado.length > 0) {
      document.getElementById('resultBox').style.display = 'block';
      resultado.forEach(function(servidor) {
        const row = document.createElement('tr');
        row.innerHTML = `
          <td>${servidor.cpf}</td>
          <td>${servidor.nome}</td>
          <td>${servidor.cargo}</td>
          <td>
            <a href="cad-folhaPagamento.asp" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
            <button data-toggle="modal" data-target=".modal-delete" mdl-name="patrimonios" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_2024001"><i class="fa fa-trash"></i></button>
          </td>
        `;
        resultTable.appendChild(row);
      });
    }
  }

  function solicitarDiaria(cpf) {
    // Redirecionar para a página de solicitação de diária passando o CPF do servidor selecionado
    window.location.href = `solicitar_diaria.asp?cpf=${cpf}`;
  }
</script>