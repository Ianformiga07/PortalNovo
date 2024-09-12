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
          <li class="current">Servidores</li>
        </ol>
      </nav>
      <h1>Servidores</h1>
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
        <label for="search-category1">Mês:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Janeiro</option>
          <option value="categoria1">Fevereiro</option>
          <option value="categoria1">Março</option>
          <option value="categoria1">Abril</option>
          <option value="categoria1">Maio</option>
          <option value="categoria1">Junho</option>
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
        <label for="search-category1">Cargo:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Assessor de Gabinete</option>
          <option value="categoria2">Contador</option>
          <option value="categoria2">Vereador</option>
          <option value="categoria2">Vereador - Presidente</option>
          <option value="categoria2">Motorista</option>
        </select>
      </div>
    </div>

    <div class="row search-field1">
      <div class="col-12 col-md-3">
        <label for="search-input">Departamento:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-2">
        <label for="search-category1">Matrícula:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">CPF:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
      <div class="col-12 col-md-4">
        <label for="search-category1">Nome Servidor:</label>
        <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
      </div>
    </div>

    <div class="row search-field1">
      <div class="col-12 col-md-3">
        <label for="search-category1">Situação:</label>
        <select id="search-category1" class="search-category1">
          <option value="">Selecione...</option>
          <option value="categoria1">Ativo</option>
          <option value="categoria1">inativo</option>
        </select>
      </div>
      <div class="col-12 col-md-3">
        <label for="search-category1">Tipo de Admissão:</label>
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
                <th>Matrícula</th>
                <th>CPF</th>
                <th>Nome</th>
                <th>Cargo</th>
                <th>Departamento</th>
                <th>Status</th>
                <th>Data Admissão</th>
                <th>Total de Proventos</th>
                <th>Total de Descontos</th>
                <th>Total Líquido</th>
                <th>Situação Pagamento</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                  <td><P class="diario-content">73</p></td>
                  <td><P class="diario-content">xxx.263.xxx-xx</p></td>
                  <td><P class="diario-content">BRUNA MICHELLE ALVES DOS SANTOS</p></td>
                  <td><P class="diario-content">Assessor de Gabinete</p></td>
                  <td><P class="diario-content">CAMARA MUNICIPAL - SERVIDORES</p></td>
                  <td><P class="diario-content">Ativo</p></td>
                  <td><P class="diario-content">01/02/2024</p></td>
                  <td><P class="diario-content">R$ 2.432,00</p></td>
                  <td><P class="diario-content">R$ 177,90</p></td>
                  <td><P class="diario-content">R$ 2.254,10</p></td>
                  <td><P class="diario-content">Pago</p></td>
                  <td>
                    <a href="detalhe-doc.asp" class="btn-visualizar" title="Visualizar Documento" data-toggle="modal" data-target="#servidores">
                      <i class="fas fa-eye fa-1x "></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td><P class="diario-content">73</p></td>
                  <td><P class="diario-content">xxx.263.xxx-xx</p></td>
                  <td><P class="diario-content">BRUNA MICHELLE ALVES DOS SANTOS</p></td>
                  <td><P class="diario-content">Assessor de Gabinete</p></td>
                  <td><P class="diario-content">CAMARA MUNICIPAL - SERVIDORES</p></td>
                  <td><P class="diario-content">Ativo</p></td>
                  <td><P class="diario-content">01/02/2024</p></td>
                  <td><P class="diario-content">R$ 2.432,00</p></td>
                  <td><P class="diario-content">R$ 177,90</p></td>
                  <td><P class="diario-content">R$ 2.254,10</p></td>
                  <td><P class="diario-content">Pago</p></td>
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
        <h5 class="modal-title" id="servidoresLabel">Servidores</h5>
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
                <p><strong class="title-black">Mês/Ano:</strong> 08/2024</p>
                <p><strong class="title-black">Matrícula:</strong> 73</p>
                <p><strong class="title-black">CPF:</strong> xxx.261.801-xx</p>
                <p><strong class="title-black">Nome do Servidor:</strong> BRUNA MICHELLE ALVES DOS SANTOS</p>
                <p><strong class="title-black">Departamento:</strong> CAMARA MUNICIPAL - SERVIDORES</p>
                <p><strong class="title-black">Situação:</strong> Ativo</p>
                <p><strong class="title-black">Órgão:</strong> Câmara Municipal de Ananás</p>
                <p><strong class="title-black">Decreto:</strong> 005/2024</p>
              </div>
              <!-- Column 2 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Tipo de Admissão:</strong> Comissionado</p>
                <p><strong class="title-black">Data Decreto:</strong> 01/02/2024</p>
                <p><strong class="title-black">Nível:</strong> I</p>
                <p><strong class="title-black">Carga Horária/Mês:</strong> 150</p>
                <p><strong class="title-black">Data de Admissão:</strong> 01/02/2024</p>
                <p><strong class="title-black">Cargo:</strong> ASSESSOR DE GABINETE</p>
                <p><strong class="title-black">Cargo Recebimento:</strong> ASSESSOR DE GABINETE</p>
                <p><strong class="title-black">Categorias de Trabalhadores:</strong> Servidor Público Ocupante de Cargo exclusivo em comissão</p>
              </div>
            </div>

            <!-- Pregão Object -->
            <div class="pregao-object">
              <h3 class="title-green">Vencimentos</h3>
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>Evento</th>
                            <th>Proventos</th>
                            <th>Descontos</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>
                            <td><P class="diario-content">SALARIO BASE</p></td>
                            <td><P class="diario-content">R$ 1.412,00</p></td>
                            <td><P class="diario-content">R$ 0,00</p></td>
                            </tr>
                            <tr>
                            <td><P class="diario-content">AUXÍLIO ALIMENTAÇÃO</p></td>
                            <td><P class="diario-content">R$ 220,00</p></td>
                            <td><P class="diario-content">R$ 0,00</p></td>
                            </tr>
                            <tr>
                            <td><P class="diario-content">INSS</p></td>
                            <td><P class="diario-content">R$ 0,00</p></td>
                            <td><P class="diario-content">R$ 177,90</p></td>
                            </tr>
                            <td><P class="diario-content">Outras Remunerações</p></td>
                            <td><P class="diario-content">R$ 800,00</p></td>
                            <td><P class="diario-content">R$ 0,00</p></td>
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