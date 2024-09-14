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
          <li class="current">Licitações</li>
        </ol>
      </nav>
      <h1>Licitações</h1>
    </div>
  </div><!-- End Page Title -->

  <!-- Search and Table Section -->
  <section id="search-table" class="search-table section">
    <div class="container">
      <!-- Search Section -->
      <div class="search-wrapper">
        <div class="search-field">
          <label for="search-category">Modalidade:</label>
          <select id="search-category" class="search-category">
            <option value="">Selecione...</option>
            <option value="categoria1">Dispensa de Licitação</option>
            <option value="categoria2">Inexigibilidades</option>
            <option value="categoria2">Pregão Eletrônico</option>
            <option value="categoria2">Pregão Presencial</option>
          </select>
        </div>
        <div class="search-field">
          <label for="search-input">Buscar por Descrição:</label>
          <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
        </div>
        <div class="search-field">
          <label for="search-date">Data:</label>
          <input type="date" id="search-date" class="search-date">
        </div>
        <div class="search-field">
          <label for="search-category">Unid. Gestora:</label>
          <select id="search-category" class="search-category">
            <option value="">Selecione...</option>
            <option value="categoria1">Zelú</option>
            <option value="categoria2">Ronaldão</option>
          </select>
        </div>
        <button class="search-button"><i class="fas fa-search"></i> Buscar</button>
      </div><!-- /Search Section -->

      <!-- Linha de Separação -->
      <hr class="separator">

      <!-- Team Section -->
      <div class="team">
        <table id="example" class="table table-striped table-bordered" style="width:100%">
          <thead>
            <tr>
              <th>#</th>
              <th>Número</th>
              <th>Modalidades</th>
              <th>Tipo</th>
              <th>Objeto</th>
              <th>Data</th>
              <th>Ações</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>001/2024</td>
              <td>Pregão Eletrônico</td>
              <td>Menor Preço</td>
              <td class="description">Aquisição futura e eventual de combustível do tipo gasolina comum, com fornecimento continuo e fracionado, conforme demanda, para atender a Câmara Municipal de Wanderlândia/TO.</td>
              <td>06/12/1997</td>
              <td>
                <a href="detalhe-licitacao.asp" class="btn-visualizar" title="Visualizar Documento">
                  <i class="fas fa-eye fa-1x "></i>
                </a>
                <a href="#" class="btn-visualizar" title="Baixar Documento">
                  <i class="fas fa-download fa-1x"></i>
                </a>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td>003/2024</td>
              <td>Dispensa de Licitação</td>
              <td>Menor Preço</td>
              <td class="description">Contratação por Dispensa Eletrônica de pessoa física ou jurídica especializada na prestação, de forma contínua, de serviços de locação de veículos do tipo "automóvel", sem motorista, sem franquia de quilometragem, destinado a atender as necessidades da Câmara.</td>
              <td>10/11/2024</td>
              <td>
                <a href="detalhe-licitacao.asp" class="btn-visualizar" title="Visualizar Documento">
                  <i class="fas fa-eye fa-1x"></i>
                </a>
                <a href="#" class="btn-visualizar" title="Baixar Documento">
                  <i class="fas fa-download fa-1x"></i>
                </a>
              </td>
            </tr>
            <tr>
              <td>3</td>
              <td>011/2023</td>
              <td>Dispensa de Licitação</td>
              <td>Menor Preço</td>
              <td class="description">Contratação de empresa para prestação de serviços mecânicos e aquisição de peças destinadas aos veículos pertencentes Câmara Municipal de Wanderlândia/TO.</td>
              <td>10/02/2023</td>
              <td>
                <a href="detalhe-licitacao.asp" class="btn-visualizar" title="Visualizar Documento">
                  <i class="fas fa-eye fa-1x"></i>
                </a>
                <a href="#" class="btn-visualizar" title="Baixar Documento">
                  <i class="fas fa-download fa-1x"></i>
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </div><!-- /Team Section -->
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