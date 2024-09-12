<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.datatables.net/2.1.5/css/dataTables.bootstrap4.css" rel="stylesheet">

<!--#include file="base.asp"-->

<main class="main">

  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.html">Inicio</a></li>
          <li class="current">Despesa e Empenho</li>
        </ol>
      </nav>
      <h1>Despesa e Empenho</h1>
    </div>
  </div><!-- End Page Title -->

  <!-- Search and Table Section -->
  <section id="search-table" class="search-table1 section">
    <div class="container">

<!-- Search Section -->
<div class="search-container">
  <div class="search-header">
    <h2>Filtro</h2>
  </div>
  
  <div class="search-wrapper1">
    <div class="row search-field1">
      <div class="col-12 col-md-6">
        <label for="search-category1">Unidade Gestora/Órgão:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Câmara Mul. de Ananás</option>
        </select>
      </div>
      <div class="col-12 col-md-3">
        <label for="search-input">Data Inicial:</label>
        <input type="date" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-3">
        <label for="search-input">Data Final:</label>
        <input type="date" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
    </div>

    <div class="row search-field1">
      <div class="col-12 col-md-3">
        <label for="search-input">Licitação:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-6">
        <label for="search-category1">Fornecedor:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">CPF/CNPJ:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
    </div>

    <div class="row search-field1">
      <div class="col-12 col-md-3">
        <label for="search-category1">Categoria Econômica:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Ativo</option>
          <option value="categoria1">inativo</option>
        </select>
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Fonte:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Concursado</option>
          <option value="categoria1">Comissionado</option>
          <option value="categoria1">Vereador</option>
        </select>
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Elemento De Despesa:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Modalidade:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Concursado</option>
          <option value="categoria1">Comissionado</option>
          <option value="categoria1">Vereador</option>
        </select>
      </div>
    </div>

    <div class="row">
      <div class="col-12 text-center">
        <button class="search-button"><i class="fas fa-search"></i> Buscar</button>
      </div>
    </div>
  </div>
</div><!-- /Search Section -->

      <!-- Linha de Separação -->
      <hr class="separator">
  <div class="table-responsive">
    <table id="example" class="table table-striped table-bordered" style="width:100%">
            <thead>
                <tr>
                    <th>Número</th>
                    <th>Data</th>
                    <th>Fornecedor</th>
                    <th>Classificação Orçamentária</th>
                    <th>Valor Empenho</th>
                    <th>Valor Anulação</th>
                    <th>Valor Liquidação</th>
                    <th>Valor Anulação Liquidação</th>
                    <th>Valor Pagamento</th>
                    <th>Valor Anulação Pagamento</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                    <tr>
                      <td><P class="diario-content">73</p></td>
                      <td><P class="diario-content">22/08/2024</p></td>
                      <td><P class="diario-content">JESSICA DOS SANTOS BRITO BORGES</p></td>
                      <td><P class="diario-content">339014.14.1.500</p></td>
                      <td><P class="diario-content">R$ 750,00</p></td>
                      <td><P class="diario-content">R$ 0,00</p></td>
                      <td><P class="diario-content">R$ 750,00</p></td>
                      <td><P class="diario-content">R$ 0,00</p></td>
                      <td><P class="diario-content">R$ 750,00</p></td>
                      <td><P class="diario-content">R$ 0,00</p></td>
                      <td>
                        <a href="detalhe-doc.asp" class="btn-visualizar" title="Visualizar Documento" data-toggle="modal" data-target="#servidores">
                          <i class="fas fa-eye fa-1x "></i>
                        </a>
                      </td>
                    </tr>
            </tbody>
        </table>
  </div>
<!-- Modal for Denúncia -->
<div class="modal fade" id="servidores" tabindex="-1" role="dialog" aria-labelledby="servidoresLabel" aria-hidden="true">
  <div class="modal-dialog custom-modal-dialog" role="document"> <!-- Classe personalizada adicionada aqui -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="servidoresLabel">Despesa e Empenho</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!-- Tab Content -->
      <div class="tab-content" id="pregaoTabContent">
        <!-- Detalhes da Licitação -->
        <div class="tab-pane fade show active" id="details" role="tabpanel" aria-labelledby="details-tab">
          <!-- Pregão Details Card -->
          <div class="pregao-card">
            <!-- Pregão Header -->
            <div class="pregao-header">
              <h2>Detalhamento de Empenho</h2>
            </div>

            <!-- Pregão Information -->
            <div class="pregao-info">
              <!-- Column 1 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Data:</strong> 22/08/2024</p>
                <p><strong class="title-black">Fonte:</strong> 1.500.0000.000000 - Impostos não vinculados</p>
                <p><strong class="title-black">Fornecedor:</strong> JESSICA DOS SANTOS BRITO BORGES</p>
                <p><strong class="title-black">Órgão/Unidade Gestora:</strong> Câmara Municipal de Ananás</p>
                <p><strong class="title-black">Função:</strong> Legislativa</p>
                <p><strong class="title-black">Ação:</strong> Manutenção do Poder Legislativo em Geral</p>
                <p><strong class="title-black">Dotação Orçamentária:</strong> 339014.14.1.500.0000.000000</p>
                <p><strong class="title-black">Natureza de Despesa:</strong> 339014 - DIARIAS - PESSOAL CIVIL</p>
                <p><strong class="title-black">Tipo do Empenho:</strong> Ordinário</p>
              </div>
              <!-- Column 2 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Valor Empenhado:</strong> R$ 750,00</p>
                <p><strong class="title-black">Valor Anulação do Empenho:</strong> R$ 0,00</p>
                <p><strong class="title-black">Valor Total do Empenho:</strong> R$ 750,00</p>
                <p><strong class="title-black">Valor da Liquidacao:</strong> R$ 750,00</p>
                <p><strong class="title-black">Valor da Anulação da Liquidacao:</strong> R$ 0,00</p>
                <p><strong class="title-black">Valor Total da Liquidação:</strong> R$ 750,00</p>
                <p><strong class="title-black">Valor Total do Pagamento:</strong> R$ 750,00</p>
                <p><strong class="title-black">Modalidade:</strong> NÃO SE APLICA LICITAÇÃO</p>
              </div>
            </div>

            <!-- Pregão Object -->
            <div class="pregao-object">
              <h3 class="title-green">Bem Fornecido ou Serviço Prestado:</h3>
              <p>REFERENTE DESPESA COM 1 E 1/2 (UMA E MEIA) DIÁRIA PARA SERVIDORA JESSICA DOS S. B. BORGES, EMPREENDER VIAGEM A CIDADE DE PALMAS/TO, PARA PARTICIPAR DO CURSO DE RETENÇÕES TRIBUTARIAS PELA ADMINISTRAÇÃO PÚBLICA. REALIZADO NO AUDITORIO DO CRC/TO DIA 23/08.</p>
            </div>

            <!-- Pregão Object -->
            <div class="pregao-object">
              <h3 class="title-green">Detalhamento das Liquidações</h3>
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>Data</th>
                            <th>Valor</th>
                            <th>Motivo</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>
                            <td><P class="diario-content">22/08/2024</p></td>
                            <td>R$ 750,00</td>
                            <td>REFERENTE DESPESA COM 1 E 1/2 (UMA E MEIA) DIÁRIA PARA SERVIDORA JESSICA DOS S. B. BORGES, EMPREENDER VIAGEM A CIDADE DE PALMAS/TO, PARA PARTICIPAR DO CURSO DE RETENÇÕES TRIBUTARIAS PELA ADMINISTRAÇÃO PÚBLICA. REALIZADO NO AUDITORIO DO CRC/TO DIA 23/08.</td>
                            </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pregão Object -->
            <div class="pregao-object">
              <h3 class="title-green">Detalhamento Itens do Empenho</h3>
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>CÓDIGO</th>
                            <th>NOME</th>
                            <th>QUANTIDADE</th>
                            <th>VALOR UNITÁRIO</th>
                            <th>DESCONTO</th>
                            <th>VALOR TOTAL</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>
                            <td><P class="diario-content">84</p></td>
                            <td><P class="diario-content">CONCESSÃO DE DIÁRIA</p></td>
                            <td><P class="diario-content">R$ 1,50</p></td>
                            <td><P class="diario-content">R$ 500,00</p></td>
                            <td><P class="diario-content">R$ 0,00</p></td>
                            <td><P class="diario-content">R$ 750,00</p></td>
                            </tr>
                    </tbody>
                </table>
            </div>
            <div class="document-actions">
                <a href="caminho/do/arquivo/Projeto_de_Lei_16_2024.pdf" download class="download-button">
                <i class="fas fa-download"></i> Baixar Detalhamento
                </a>
            </div>
          </div><!-- /Pregão Details Card -->
        </div><!-- /Tab Pane -->
    </div>
  </div>
</div>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.datatables.net/2.1.5/js/dataTables.js"></script>
  <script src="https://cdn.datatables.net/2.1.5/js/dataTables.bootstrap4.js"></script>

  <script>
  $(document).ready(function(){
      $('#example').DataTable({
        	"language": {
                "lengthMenu": "Mostrando _MENU_ registros por página",
                "zeroRecords": "Nada encontrado",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro disponível",
                "infoFiltered": "(filtrado de _MAX_ registros no total)"
            }
        });
  });
  </script>

    </div>
  </section><!-- /Search and Table Section -->

</main>

<!--#include file="footer.asp"-->