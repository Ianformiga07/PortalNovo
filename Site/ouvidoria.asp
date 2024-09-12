<!-- Inclua o Bootstrap primeiro -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

<!--#include file="base.asp"-->
<main class="main">
  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.html">Inicio</a></li>
          <li class="current">Ouvidoria</li>
        </ol>
      </nav>
      <h1>Ouvidoria</h1>
    </div>
  </div><!-- End Page Title -->

  <!-- Ouvidoria Section Wrapper -->
  <div class="news">
    <section id="ouvidoria" class="ouvidoria section">
      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <!-- Quadrados -->
        <div class="ouvidoria-grid">
        <a href="#" class="ouvidoria-item" data-toggle="modal" data-target="#denunciaModal">
            <i class="fa fa-exclamation-circle"></i>
            <h3>Denúncia</h3>
        </a>
        <a href="#" class="ouvidoria-item" data-toggle="modal" data-target="#duvidaModal">
            <i class="fa fa-question-circle"></i>
            <h3>Dúvida</h3>
        </a>
        <a href="#" class="ouvidoria-item" data-toggle="modal" data-target="#elogioModal">
            <i class="fa fa-thumbs-up"></i>
            <h3>Elogio</h3>
        </a>
        <a href="#" class="ouvidoria-item" data-toggle="modal" data-target="#reclamacaoModal">
            <i class="fa fa-frown"></i>
            <h3>Reclamação</h3>
        </a>
        <a href="#" class="ouvidoria-item" data-toggle="modal" data-target="#sugestaoModal">
            <i class="fa fa-lightbulb"></i>
            <h3>Sugestão</h3>
        </a>
        </div>
<!-- Script de Validação e Manipulação de Campos -->
<script>
  // Função para alternar a visibilidade dos campos
  function toggleFields(modalId) {
    var anonimoSelect = document.getElementById('anonimo' + modalId);
    var emailField = document.getElementById('email' + modalId);
    var cpfField = document.getElementById('cpf' + modalId);
    var nomeField = document.getElementById('nome' + modalId);
    var telefoneField = document.getElementById('telefone' + modalId);
    var recebimentoField = document.getElementById('recebimento' + modalId);

    if (anonimoSelect.value === "Sim") {
      emailField.disabled = true;
      cpfField.disabled = true;
      nomeField.disabled = true;
      telefoneField.disabled = true;
      recebimentoField.disabled = true;
    } else {
      emailField.disabled = false;
      cpfField.disabled = false;
      nomeField.disabled = false;
      telefoneField.disabled = false;
      recebimentoField.disabled = false;
    }
  }

  // Inicializa o estado dos campos com base na seleção inicial
  document.addEventListener('DOMContentLoaded', function() {
    toggleFields('Denuncia');
    toggleFields('Duvida');
    toggleFields('Elogio');
    toggleFields('Reclamacao');
    toggleFields('Sugestao');
  });
</script>

<!-- Modal for Denúncia -->
<div class="modal fade" id="denunciaModal" tabindex="-1" role="dialog" aria-labelledby="denunciaModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="denunciaModalLabel">Denúncia</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="anonimoDenuncia">Anônimo</label>
              <select class="form-select" id="anonimoDenuncia" onchange="toggleFields('Denuncia')">
                <option value="default">Selecionar...</option>
                <option value="Sim">Sim</option>
                <option value="Não">Não</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="recebimentoDenuncia">Forma de Recebimento</label>
              <select class="form-select" id="recebimentoDenuncia">
                <option value="default">Selecionar...</option>
                <option value="email">E-mail</option>
                <option value="pessoalmente">Pessoalmente</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="emailDenuncia">E-mail</label>
              <input type="email" class="form-control" id="emailDenuncia" placeholder="Digite seu e-mail">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="cpfDenuncia">CPF</label>
              <input type="text" class="form-control" id="cpfDenuncia" placeholder="Digite seu CPF">
            </div>
            <div class="form-group col-md-4">
              <label for="nomeDenuncia">Nome</label>
              <input type="text" class="form-control" id="nomeDenuncia" placeholder="Digite seu nome">
            </div>
            <div class="form-group col-md-4">
              <label for="telefoneDenuncia">Telefone</label>
              <input type="text" class="form-control" id="telefoneDenuncia" placeholder="Digite seu telefone">
            </div>
          </div>
          <div class="form-group">
            <label for="anexoDenuncia">Anexo</label>
            <input type="file" class="form-control-file" id="anexoDenuncia">
          </div>
          <div class="form-group">
            <label for="manifestacaoDenuncia">Descreva sua manifestação</label>
            <textarea class="form-control" id="manifestacaoDenuncia" rows="4" placeholder="Digite sua manifestação"></textarea>
          </div>
          <button type="submit" class="btn btn-custom">
            <i class="fa fa-paper-plane"></i> Enviar
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal for Dúvida -->
<div class="modal fade" id="duvidaModal" tabindex="-1" role="dialog" aria-labelledby="duvidaModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="duvidaModalLabel">Dúvida</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="anonimoDuvida">Anônimo</label>
              <select class="form-select" id="anonimoDuvida" onchange="toggleFields('Duvida')">
                <option value="default">Selecionar...</option>
                <option value="Sim">Sim</option>
                <option value="Não">Não</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="recebimentoDuvida">Forma de Recebimento</label>
              <select class="form-select" id="recebimentoDuvida">
                <option value="default">Selecionar...</option>
                <option value="email">E-mail</option>
                <option value="pessoalmente">Pessoalmente</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="emailDuvida">E-mail</label>
              <input type="email" class="form-control" id="emailDuvida" placeholder="Digite seu e-mail">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="cpfDuvida">CPF</label>
              <input type="text" class="form-control" id="cpfDuvida" placeholder="Digite seu CPF">
            </div>
            <div class="form-group col-md-4">
              <label for="nomeDuvida">Nome</label>
              <input type="text" class="form-control" id="nomeDuvida" placeholder="Digite seu nome">
            </div>
            <div class="form-group col-md-4">
              <label for="telefoneDuvida">Telefone</label>
              <input type="text" class="form-control" id="telefoneDuvida" placeholder="Digite seu telefone">
            </div>
          </div>
          <div class="form-group">
            <label for="anexoDuvida">Anexo</label>
            <input type="file" class="form-control-file" id="anexoDuvida">
          </div>
          <div class="form-group">
            <label for="manifestacaoDuvida">Descreva sua manifestação</label>
            <textarea class="form-control" id="manifestacaoDuvida" rows="4" placeholder="Digite sua manifestação"></textarea>
          </div>
          <button type="submit" class="btn btn-custom">
            <i class="fa fa-paper-plane"></i> Enviar
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal for Elogio -->
<div class="modal fade" id="elogioModal" tabindex="-1" role="dialog" aria-labelledby="elogioModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="elogioModalLabel">Elogio</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="anonimoElogio">Anônimo</label>
              <select class="form-select" id="anonimoElogio" onchange="toggleFields('Elogio')">
                <option value="default">Selecionar...</option>
                <option value="Sim">Sim</option>
                <option value="Não">Não</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="recebimentoElogio">Forma de Recebimento</label>
              <select class="form-select" id="recebimentoElogio">
                <option value="default">Selecionar...</option>
                <option value="email">E-mail</option>
                <option value="pessoalmente">Pessoalmente</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="emailElogio">E-mail</label>
              <input type="email" class="form-control" id="emailElogio" placeholder="Digite seu e-mail">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="cpfElogio">CPF</label>
              <input type="text" class="form-control" id="cpfElogio" placeholder="Digite seu CPF">
            </div>
            <div class="form-group col-md-4">
              <label for="nomeElogio">Nome</label>
              <input type="text" class="form-control" id="nomeElogio" placeholder="Digite seu nome">
            </div>
            <div class="form-group col-md-4">
              <label for="telefoneElogio">Telefone</label>
              <input type="text" class="form-control" id="telefoneElogio" placeholder="Digite seu telefone">
            </div>
          </div>
          <div class="form-group">
            <label for="anexoElogio">Anexo</label>
            <input type="file" class="form-control-file" id="anexoElogio">
          </div>
          <div class="form-group">
            <label for="manifestacaoElogio">Descreva sua manifestação</label>
            <textarea class="form-control" id="manifestacaoElogio" rows="4" placeholder="Digite sua manifestação"></textarea>
          </div>
          <button type="submit" class="btn btn-custom">
            <i class="fa fa-paper-plane"></i> Enviar
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal for Reclamação -->
<div class="modal fade" id="reclamacaoModal" tabindex="-1" role="dialog" aria-labelledby="reclamacaoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reclamacaoModalLabel">Reclamação</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="anonimoReclamacao">Anônimo</label>
              <select class="form-select" id="anonimoReclamacao" onchange="toggleFields('Reclamacao')">
                <option value="default">Selecionar...</option>
                <option value="Sim">Sim</option>
                <option value="Não">Não</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="recebimentoReclamacao">Forma de Recebimento</label>
              <select class="form-select" id="recebimentoReclamacao">
                <option value="default">Selecionar...</option>
                <option value="email">E-mail</option>
                <option value="pessoalmente">Pessoalmente</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="emailReclamacao">E-mail</label>
              <input type="email" class="form-control" id="emailReclamacao" placeholder="Digite seu e-mail">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="cpfReclamacao">CPF</label>
              <input type="text" class="form-control" id="cpfReclamacao" placeholder="Digite seu CPF">
            </div>
            <div class="form-group col-md-4">
              <label for="nomeReclamacao">Nome</label>
              <input type="text" class="form-control" id="nomeReclamacao" placeholder="Digite seu nome">
            </div>
            <div class="form-group col-md-4">
              <label for="telefoneReclamacao">Telefone</label>
              <input type="text" class="form-control" id="telefoneReclamacao" placeholder="Digite seu telefone">
            </div>
          </div>
          <div class="form-group">
            <label for="anexoReclamacao">Anexo</label>
            <input type="file" class="form-control-file" id="anexoReclamacao">
          </div>
          <div class="form-group">
            <label for="manifestacaoReclamacao">Descreva sua manifestação</label>
            <textarea class="form-control" id="manifestacaoReclamacao" rows="4" placeholder="Digite sua manifestação"></textarea>
          </div>
          <button type="submit" class="btn btn-custom">
            <i class="fa fa-paper-plane"></i> Enviar
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal for Sugestão -->
<div class="modal fade" id="sugestaoModal" tabindex="-1" role="dialog" aria-labelledby="sugestaoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="sugestaoModalLabel">Sugestão</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="anonimoSugestao">Anônimo</label>
              <select class="form-select" id="anonimoSugestao" onchange="toggleFields('Sugestao')">
                <option value="default">Selecionar...</option>
                <option value="Sim">Sim</option>
                <option value="Não">Não</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="recebimentoSugestao">Forma de Recebimento</label>
              <select class="form-select" id="recebimentoSugestao">
                <option value="default">Selecionar...</option>
                <option value="email">E-mail</option>
                <option value="pessoalmente">Pessoalmente</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label for="emailSugestao">E-mail</label>
              <input type="email" class="form-control" id="emailSugestao" placeholder="Digite seu e-mail">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="cpfSugestao">CPF</label>
              <input type="text" class="form-control" id="cpfSugestao" placeholder="Digite seu CPF">
            </div>
            <div class="form-group col-md-4">
              <label for="nomeSugestao">Nome</label>
              <input type="text" class="form-control" id="nomeSugestao" placeholder="Digite seu nome">
            </div>
            <div class="form-group col-md-4">
              <label for="telefoneSugestao">Telefone</label>
              <input type="text" class="form-control" id="telefoneSugestao" placeholder="Digite seu telefone">
            </div>
          </div>
          <div class="form-group">
            <label for="anexoSugestao">Anexo</label>
            <input type="file" class="form-control-file" id="anexoSugestao">
          </div>
          <div class="form-group">
            <label for="manifestacaoSugestao">Descreva sua manifestação</label>
            <textarea class="form-control" id="manifestacaoSugestao" rows="4" placeholder="Digite sua manifestação"></textarea>
          </div>
          <button type="submit" class="btn btn-custom">
            <i class="fa fa-paper-plane"></i> Enviar
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

        <!-- Informações da Ouvidoria e Consultar Manifestação -->
        <div class="ouvidoria-details">
          <!-- Informações da Ouvidoria -->
          <div class="info-section">
            <h2>Informações da Ouvidoria</h2>
            <div class="info-item">
              <i class="fa fa-user"></i>
              <p><strong>Responsável:</strong> IAN LEANDRO CARDOSO FORMIGA</p>
            </div>
            <div class="info-item">
              <i class="fa fa-map-marker"></i>
              <p><strong>Endereço:</strong> Av. Brasil, 242 - centro, Ananás - TO, 77890-000</p>
            </div>
            <div class="info-item">
              <i class="fa fa-envelope"></i>
              <p><strong>Email:</strong> <a href="mailto:ouvidoria@riachinho.to.leg.br">ouvidoria@ananas.to.leg.br</a></p>
            </div>
            <div class="info-item">
              <i class="fa fa-phone"></i>
              <p><strong>Telefone:</strong> (63)3443-1147</p>
            </div>
            <div class="info-item">
              <i class="fa fa-clock"></i>
              <p><strong>Horário de Atendimento:</strong> de Segunda a Sexta 07:00 às 13:00 horas.</p>
            </div>
          </div>

          <!-- Consultar Manifestação -->
          <div class="consultar-manifestacao">
            <h2>Consultar Manifestação</h2>
            <p>Insira o número do protocolo e consulte o andamento da sua manifestação</p>
            <form>
              <label for="protocolo">Número de Protocolo</label>
              <input type="text" id="protocolo" name="protocolo" placeholder="Digite o número do protocolo">
              <button type="submit">Consultar</button>
            </form>
          </div>
        </div>

        <!-- Prazos e Orientações -->
        <div class="ouvidoria-details">
          <div class="info-section">
            <h2>Prazos</h2>
            <div class="content">
              <p><strong>Quais são os prazos definidos por lei para que a solicitação de informação seja respondida?</strong></p>
              <p>O Decreto nº 7.724/2012, que regulamenta a Lei de Acesso à Informação no âmbito do Poder Executivo Federal, determina os prazos seguidos pelo e-SIC. O prazo para recebimento de resposta é de 20 dias. O órgão ou entidade pode prorrogá-lo por mais 10 dias, caso haja justificativa.</p>
            </div>
          </div>
          <div class="info-section">
            <h2>Orientações</h2>
            <div class="content">
              <p><strong>O que devo fazer se o órgão não disponibilizar a resposta da solicitação no prazo limite?</strong></p>
              <p>Caso o órgão não responda ao pedido de informação dentro do prazo, o solicitante tem a possibilidade de registrar uma reclamação dirigida à autoridade de monitoramento da implementação da LAI (Lei de Acesso à Informação) no âmbito do órgão ou da entidade.</p>
            </div>
          </div>
        </div>

        <!-- Gráfico de Manifestações por Tipo -->
        <section id="grafico-manifestacoes" class="grafico-manifestacoes">
          <div class="chart-header">
            <h2>Manifestações por Tipo</h2>
          </div>
          <div class="card card-success">
            <div class="card-body">
              <div class="chart-container" style="position: relative; height: 350px; width: 100%;">
                <canvas id="manifestacoesChart"></canvas>
              </div>
            </div>
          </div>
        </section>


      </div>
    </section><!-- End Ouvidoria Section -->
  </div><!-- End Ouvidoria Wrapper -->

</main>
<script>
  const ctx = document.getElementById('manifestacoesChart').getContext('2d');
  const manifestacoesChart = new Chart(ctx, {
    type: 'bar', // Tipo do gráfico
    data: {
      labels: ['Denúncia', 'Dúvida', 'Elogio', 'Reclamação', 'Sugestão'], // Tipos de manifestação
      datasets: [{
        label: 'Número de Manifestações',
        data: [12, 19, 3, 5, 2], // Dados de exemplo
        backgroundColor: [
          'rgba(34, 193, 195, 0.8)', // Verde claro
          'rgba(45, 158, 70, 0.8)', // Verde médio
          'rgba(56, 204, 112, 0.8)', // Verde mais claro
          'rgba(74, 207, 159, 0.8)', // Verde água
          'rgba(103, 219, 166, 0.8)'  // Verde menta
        ],
        borderColor: [
          'rgba(34, 193, 195, 1)', // Verde claro
          'rgba(45, 158, 70, 1)', // Verde médio
          'rgba(56, 204, 112, 1)', // Verde mais claro
          'rgba(74, 207, 159, 1)', // Verde água
          'rgba(103, 219, 166, 1)'  // Verde menta
        ],
        borderWidth: 2, // Largura da borda das barras
        barThickness: 30 // Espessura das barras
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'top',
          labels: {
            color: '#333' // Cor do texto da legenda
          }
        },
        tooltip: {
          callbacks: {
            label: function(tooltipItem) {
              return `${tooltipItem.label}: ${tooltipItem.raw}`;
            }
          }
        }
      },
      scales: {
        x: {
          beginAtZero: true,
          ticks: {
            color: '#333', // Cor dos ticks do eixo x
            padding: 10 // Espaçamento dos ticks
          },
          grid: {
            display: false // Remove linhas de grade do eixo x
          }
        },
        y: {
          beginAtZero: true,
          ticks: {
            color: '#333', // Cor dos ticks do eixo y
            padding: 10 // Espaçamento dos ticks
          },
          grid: {
            color: '#e5e5e5', // Cor das linhas de grade
            borderColor: '#c2c2c2' // Cor da borda do eixo y
          }
        }
      }
    }
  });
</script>

<!--#include file="footer.asp"-->