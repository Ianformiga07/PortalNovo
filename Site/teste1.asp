<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/2.1.5/css/dataTables.dataTables.css" rel="stylesheet">


<!--#include file="base.asp"-->

<main class="main">

  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.asp">Inicio</a></li>
          <li class="current">Ofícios</li>
        </ol>
      </nav>
      <h1>Ofícios</h1>
    <!-- Ícone de Voltar -->
    <a href="transparencia.asp" class="icon-voltar">
      <i class="fa fa-reply-all"></i> Voltar
    </a>
    </div>
  </div><!-- End Page Title -->

  <!-- Search and Table Section -->
  <section id="search-table" class="search-table section">
    <div class="container">

      <!-- Search Section -->
      <div class="search-wrapper">
        <div class="search-field">
          <label for="search-input">Buscar por Descrição:</label>
          <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
        </div>
        <div class="search-field">
          <label for="search-date">Data:</label>
          <input type="date" id="search-date" class="search-date">
        </div>
        <div class="search-field">
          <label for="search-category">Autor:</label>
          <select id="search-category" class="search-category">
            <option value="">Selecione...</option>
            <option value="categoria1">Categoria 1</option>
            <option value="categoria2">Categoria 2</option>
          </select>
        </div>
        <button class="search-button"><i class="fas fa-search"></i> Buscar</button>
      </div><!-- /Search Section -->

      <!-- Linha de Separação -->
      <hr class="separator">

  <table id="minhaTabela" class="table table-striped">
    <thead>
      <tr>
        <th>Categoria</th>
        <th>Número</th>
        <th>Descrição</th>
        <th>Data</th>
        <th>Ações</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Projeto de Lei</td>
        <td>06/2024</td>
        <td><P class="diario-content">Autoriza o Executivo Municipal a instalar semáforos de trânsito em cruzamentos e placas de identificação de órgãos públicos, no âmbito do município de Ananás e dá outras providências.</P></td>
        <td>06/12/1997</td>
        <td>
          <a href="detalhe-doc.asp" class="btn-visualizar" title="Visualizar Documento" data-toggle="modal" data-target="#projeto-lei">
            <i class="fas fa-eye fa-1x "></i>
          </a>
          <a href="#" class="btn-visualizar" title="Baixar Documento">
            <i class="fas fa-download fa-1x"></i>
          </a>
        </td>
      </tr>
      <tr>
        <td>Projeto de Lei</td>
        <td>06/2024</td>
        <td><P class="diario-content">Autoriza o Executivo Municipal a instalar semáforos de trânsito em cruzamentos e placas de identificação de órgãos públicos, no âmbito do município de Ananás e dá outras providências.</P></td>
        <td>06/12/1997</td>
        <td>
          <a href="detalhe-doc.asp" class="btn-visualizar" title="Visualizar Documento" data-toggle="modal" data-target="#projeto-lei">
            <i class="fas fa-eye fa-1x "></i>
          </a>
          <a href="#" class="btn-visualizar" title="Baixar Documento">
            <i class="fas fa-download fa-1x"></i>
          </a>
        </td>
      </tr>
      <tr>
        <td>Projeto de Lei</td>
        <td>06/2024</td>
        <td><P class="diario-content">Autoriza o Executivo Municipal a instalar semáforos de trânsito em cruzamentos e placas de identificação de órgãos públicos, no âmbito do município de Ananás e dá outras providências.</P></td>
        <td>06/12/1997</td>
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
  
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://cdn.datatables.net/2.1.5/js/dataTables.js"></script>


  <script>
  $(document).ready(function(){
      $('#minhaTabela').DataTable({
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


<!--#include file="footer.asp"-->