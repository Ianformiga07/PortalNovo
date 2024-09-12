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
          <li class="current">Valores</li>
        </ol>
      </nav>
      <h1>Tabela Explicativa de Valores de Diárias</h1>
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
        <label for="search-input">Número do Documento:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-3">
        <label for="search-input">Ano do Documento:</label>
        <input type="date" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-6">
        <label for="search-category1">Situação:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Processo Seletivo Público</option>
          <option value="categoria1">Processo Seletivo Simplificado</option>
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
                <th>Matrícula</th>
                <th>Nome</th>
                <th>Saída</th>
                <th>Chegada</th>
                <th>Destino</th>
                <th>Valor Diária</th>
                <th>Código Liquidação</th>
                <th>Número Liquidação</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                  <td><P class="diario-content">73</p></td>
                  <td><P class="diario-content">BRUNA MICHELLE ALVES DOS SANTOS</p></td>
                  <td><P class="diario-content">22/08/2024</p></td>
                  <td><P class="diario-content">24/08/2024</p></td>
                  <td><P class="diario-content">PALMAS/TO</p></td>
                  <td><P class="diario-content">R$ 750,00</p></td>
                  <td><P class="diario-content">3116</p></td>
                  <td><P class="diario-content">20243116</p></td>
                  <td>
                    <a href="detalhe-doc.asp" class="btn-visualizar" title="Visualizar Documento" data-toggle="modal" data-target="#servidores">
                      <i class="fas fa-eye fa-1x "></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td><P class="diario-content">73</p></td>
                  <td><P class="diario-content">BRUNA MICHELLE ALVES DOS SANTOS</p></td>
                  <td><P class="diario-content">22/08/2024</p></td>
                  <td><P class="diario-content">24/08/2024</p></td>
                  <td><P class="diario-content">PALMAS/TO</p></td>
                  <td><P class="diario-content">R$ 750,00</p></td>
                  <td><P class="diario-content">3116</p></td>
                  <td><P class="diario-content">20243116</p></td>
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
        <h5 class="modal-title" id="servidoresLabel">Diárias</h5>
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
              <h2>Detalhamento de Diárias</h2>
            </div>

            <!-- Pregão Information -->
            <div class="pregao-info">
              <!-- Column 1 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Órgão:</strong> Câmara Municipal de Ananás</p>
                <p><strong class="title-black">Matrícula:</strong> 73</p>
                <p><strong class="title-black">Nome do Servidor:</strong> BRUNA MICHELLE ALVES DOS SANTOS</p>
                <p><strong class="title-black">Cargo:</strong> Contador</p>
                <p><strong class="title-black">Destino:</strong> PALMAS/TO</p>
                <p><strong class="title-black">Dias Afastados:</strong> 1.5</p>
                <p><strong class="title-black">Valor da Diária:</strong> R$ 750,00</p>
                <p><strong class="title-black">Processo:</strong> 75</p>
              </div>
              <!-- Column 2 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Empenho:</strong> 20243401</p>
                <p><strong class="title-black">Código da Liquidação:</strong> 3116</p>
                <p><strong class="title-black">Número da Liquidação:</strong> 20243116</p>
                <p><strong class="title-black">Portaria:</strong> 70/2024</p>
                <p><strong class="title-black">Saída:</strong> 22/08/2024</p>
                <p><strong class="title-black">Chegada:</strong> 24/08/2024</p>
                <p><strong class="title-black">Número de Diárias:</strong> 1,50</p>
              </div>
            </div>

            <!-- Pregão Object -->
            <div class="pregao-object">
              <h3 class="title-green">Motivo da Viagem</h3>
              <p>REFERENTE DESPESA COM 1 E 1/2 (UMA E MEIA) DIÁRIA PARA SERVIDORA JESSICA DOS S. B. BORGES, EMPREENDER VIAGEM A CIDADE DE PALMAS/TO, PARA PARTICIPAR DO CURSO DE RETENÇÕES TRIBUTARIAS PELA ADMINISTRAÇÃO PÚBLICA. REALIZADO NO AUDITORIO DO CRC/TO DIA 23/08.</p>
            </div>

            <!-- Pregão Object -->
            <div class="pregao-object">
              <h3 class="title-green">Ordens de Pagamento</h3>
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Número</th>
                            <th>Data</th>
                            <th>Valor</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>
                            <td><P class="diario-content">5793</p></td>
                            <td><P class="diario-content">1</p></td>
                            <td><P class="diario-content">22/08/2024</p></td>
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