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

<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>Número</th>
                <th>Data</th>
                <th>CPF/CNPJ</th>
                <th>Fornecedor</th>
                <th>Unidade</th>
                <th>Empenho</th>
                <th>Programa</th>
                <th>Elemento</th>
                <th>Valor</th>
                <th>Fase</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                  <td><P class="diario-content">202455414473</p></td>
                  <td><P class="diario-content">22/08/2024</p></td>
                  <td><P class="diario-content">0254455122454</p></td>
                  <td><P class="diario-content">JESSICA DOS SANTOS BRITO BORGES</p></td>
                  <td><P class="diario-content">1</p></td>
                  <td><P class="diario-content">202455414473</p></td>
                  <td><P class="diario-content">1</p></td>
                  <td><P class="diario-content">396582</p></td>
                  <td><P class="diario-content">R$ 750,00</p></td>
                  <td><P class="diario-content">Emissão</p></td>
                  <td>
                    <a href="detalhe-doc.asp" class="btn-visualizar" title="Visualizar Documento" data-toggle="modal" data-target="#servidores">
                      <i class="fas fa-eye fa-1x "></i>
                    </a>
                  </td>
                </tr>
        </tbody>
    </table>
<!-- Modal for Denúncia -->
<div class="modal fade" id="servidores" tabindex="-1" role="dialog" aria-labelledby="servidoresLabel" aria-hidden="true">
  <div class="modal-dialog custom-modal-dialog" role="document"> <!-- Classe personalizada adicionada aqui -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="servidoresLabel">Liquidações</h5>
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
              <h2>Detalhamento da Liquidação</h2>
            </div>

            <!-- Pregão Information -->
            <div class="pregao-info">
              <!-- Column 1 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Data:</strong> 22/08/2024</p>
                <p><strong class="title-black">Liquidação:</strong> 3120</p>
                <p><strong class="title-black">Programa:</strong> 1</p>
                <p><strong class="title-black">Código/Fonte:</strong> Impostos não vinculados</p>
              </div>
              <!-- Column 2 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Código/Elemento:</strong> MATERIAL DE CONSUMO</p>
                <p><strong class="title-black">Dotação Orçamentária:</strong> 11.01.01.031.0001.2.001.339030</p>
                <p><strong class="title-black">Valor:</strong> R$ 940,00</p>
              </div>
            </div>
            <!-- Pregão Object -->
            <div class="pregao-object">
              <h3 class="title-green">Histórico:</h3>
              <p>REFERENTE AO FORNECIMENTO DE SALGADOS EM GERAL PARA AS SESSÕES ORDINARIAS, EXTRAORDINARIAS E SOLENES, REALIZADAS PELA CÂMARA MUNICIPAL DE ANANÁS/TO NO MÊS DE AGOSTO.</p>
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