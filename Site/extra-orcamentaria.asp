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
          <li class="current">Extra Orçamentária</li>
        </ol>
      </nav>
      <h1>Extra Orçamentária</h1>
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
      <div class="col-12 col-md-4">
        <label for="search-category1">Orgão:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Câmara Mul. de Ananás</option>
        </select>
      </div>
      <div class="col-12 col-md-2">
        <label for="search-category1">Ano:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">2024</option>
        </select>
      </div>
      <div class="col-12 col-md-2">
        <label for="search-category1">Mês:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Janeiro</option>
        </select>
      </div>
      <div class="col-12 col-md-4">
        <label for="search-category1">Tipo Extra:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Ativo Realizável</option>
        </select>
      </div>
    </div>

    <div class="row search-field1">
      <div class="col-12 col-md-12">
        <label for="search-category1">Título:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
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
                <th>Órgão</th>
                <th>Título</th>
                <th>Tipo Extra</th>
                <th>Valor Movimento (Mês)</th>
                <th>Valor Anulação (Mês)</th>
                <th>Valor Acumulado</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                  <td><P class="diario-content">Câmara Municipal de Ananás</p></td>
                  <td><P class="diario-content">DESPESA EM RESPONSABILIDADE</p></td>
                  <td><P class="diario-content">Despesas a Regularizar</p></td>
                  <td><P class="diario-content">R$ 19.371,24</p></td>
                  <td><P class="diario-content">R$ 0,00</p></td>
                  <td><P class="diario-content">R$ 19.371,24</p></td>
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
        <h5 class="modal-title" id="servidoresLabel">Extra Orçamentária</h5>
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
              <h2>Detalhamento Extra Orçamentária</h2>
            </div>

            <!-- Pregão Information -->
            <div class="pregao-info">
              <!-- Column 1 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Órgão:</strong> Câmara Municipal de Ananás</p>
                <p><strong class="title-black">Título:</strong> DESPESA EM RESPONSABILIDADE</p>
                <p><strong class="title-black">Tipo Extra:</strong> Despesas a Regularizar</p>
                <p><strong class="title-black">Valor Movimento (Mês):</strong> R$ 19.371,24</p>
              </div>
              <!-- Column 2 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Valor Anulação (Mês):</strong> R$ 0,00</p>
                <p><strong class="title-black">Valor Acumulado:</strong> R$ 19.371,24</p>
              </div>
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