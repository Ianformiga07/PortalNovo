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
          <li class="current">Despesas Fixadas</li>
        </ol>
      </nav>
      <h1>Despesas Fixadas</h1>
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
      <div class="col-12 col-md-3">
        <label for="search-category1">Exercício/Ano:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">2025</option>
          <option value="categoria2">2024</option>
          <option value="categoria2">2023</option>
          <option value="categoria2">2022</option>
          <option value="categoria2">2021</option>
        </select>
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Unidade Gestora/Órgão:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Câmara Mul. de Ananás</option>
        </select>
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Rubrica Despesa:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Auxilio Alimentação</option>
          <option value="categoria2">Contribuições</option>
          <option value="categoria2">Vencimentos e Vantagens Fixas</option>
          <option value="categoria2">Serviços de Consultoria</option>
          <option value="categoria2">Materiais de Consumo</option>
        </select>
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Fonte:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Recursos Próprios</option>
        </select>
      </div>
    </div>

    <div class="row search-field1">
      <div class="col-12 col-md-3">
        <label for="search-input">Ação:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Programa:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Ação Legislativa</option>
        </select>
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Função:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Legislativa</option>
        </select>
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Subfunção:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Legislativa</option>
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
                <th>Órgão</th>
                <th>Exercício/Ano</th>
                <th>Rubrica Despesa</th>
                <th>Fonte</th>
                <th>Ação</th>
                <th>Programa</th>
                <th>Função</th>
                <th>SubFunção</th>
                <th>Dotação Inicial</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                  <td>Câmara Municipal de Ananás</td>
                  <td>2019</td>
                  <td>VENCIMENTOS E VANTAGENS FIXAS - PESSOAL</td>
                  <td>Recursos Próprios</td>
                  <td>2.001</td>
                  <td>Ação Legislativa</td>
                  <td>Legislativa</td>
                  <td>Legislativa</td>
                  <td>R$ 407.000,00</td>
                  <td>
                    <a href="detalhe-doc.asp" class="btn-visualizar" title="Visualizar Documento" data-toggle="modal" data-target="#projeto-lei">
                      <i class="fas fa-eye fa-1x "></i>
                    </a>
                    <a href="#" class="btn-visualizar" title="Baixar Documento">
                      <i class="fas fa-download fa-1x"></i>
                    </a>
                  </td>
                </tr>
        </tbody>
    </table>
<!-- Modal for Denúncia -->
<div class="modal fade" id="contrato" tabindex="-1" role="dialog" aria-labelledby="contratoLabel" aria-hidden="true">
  <div class="modal-dialog custom-modal-dialog" role="document"> <!-- Classe personalizada adicionada aqui -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="contratoLabel">Despesas Fixadas</h5>
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
              <h2>Detalhamento de Receitas</h2>
            </div>

            <!-- Pregão Information -->
            <div class="pregao-info">
              <!-- Column 1 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Unidade Gestora/Órgão:</strong> Câmara Municipal de Ananás</p>
                <p><strong class="title-black">Exercício/Ano:</strong> 2019</p>
                <p><strong class="title-black">Rubrica Despesa:</strong> VENCIMENTOS E VANTAGENS FIXAS - PESSOAL</p>
                <p><strong class="title-black">Fonte:</strong> Recursos Próprios</p>
                <p><strong class="title-black">Ação:</strong> 2.001</p>
              </div>
              <!-- Column 2 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Função:</strong> 1</p>
                <p><strong class="title-black">SubFunção:</strong> 31</p>
                <p><strong class="title-black">Dotação Inicial:</strong> R$ 407.000,00</p>
              </div>
            </div>

            <div class="document-actions">
                <a href="caminho/do/arquivo/Projeto_de_Lei_16_2024.pdf" download class="download-button">
                <i class="fas fa-download"></i> Baixar Documento
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