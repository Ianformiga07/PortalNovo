<!--#include file="base.asp"-->

<main class="main">

  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.asp">Inicio</a></li>
          <li><a href="diario-ofi.asp">Diário Oficial</a></li>
          <li class="current">Todos os Diários</li>
        </ol>
      </nav>
      <h1>Todos os Diários</h1>
    <!-- Ícone de Voltar -->
    <a href="diario-ofi.asp" class="icon-voltar">
      <i class="fa fa-reply-all"></i> Voltar
    </a>
    </div>
  </div><!-- End Page Title -->

  <!-- Diário Oficial Section -->
  <section id="diario-oficial" class="diario-oficial section">
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

      <!-- Team Section -->
      <div class="team">
        <table id="example" class="table table-striped table-bordered" style="width:100%">
          <thead>
            <tr>
                <th colspan="4"><i class="fas fa-search icones" style="font-size:20px; align-items: right;"></i>Todos os Diários</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td colspan="3"><strong><i class="fas fa-newspaper"></i> Edição nº 0007 de 29 de dezembro de 2023</strong></td>
              <td class="btn-group">
                <div class="views-info"><strong><i class="fas fa-eye fa-1x"></i> Visualizações: 17</strong></div>
                <a href="#" class="btn-view" title="Visualizar Documento"><i class="fas fa-eye fa-1x"></i> Visualizar</a>
                <a href="#" class="btn-download" title="Baixar Documento"><i class="fas fa-download fa-1x"></i> Baixar</a>
              </td>
            </tr>
            <tr>
              <td colspan="3"><strong><i class="fas fa-newspaper"></i> Edição nº 0007 de 29 de dezembro de 2023</strong></td>
              <td class="btn-group">
                <div class="views-info"><strong><i class="fas fa-eye fa-1x"></i> Visualizações: 17</strong></div>
                <a href="#" class="btn-view" title="Visualizar Documento"><i class="fas fa-eye fa-1x"></i> Visualizar</a>
                <a href="#" class="btn-download" title="Baixar Documento"><i class="fas fa-download fa-1x"></i> Baixar</a>
              </td>
            </tr>
            <tr>
              <td colspan="3"><strong><i class="fas fa-newspaper"></i> Edição nº 0007 de 29 de dezembro de 2023</strong></td>
              <td class="btn-group">
                <div class="views-info"><strong><i class="fas fa-eye fa-1x"></i> Visualizações: 17</strong></div>
                <a href="#" class="btn-view" title="Visualizar Documento"><i class="fas fa-eye fa-1x"></i> Visualizar</a>
                <a href="#" class="btn-download" title="Baixar Documento"><i class="fas fa-download fa-1x"></i> Baixar</a>
              </td>
            </tr>


          </tbody>
        </table>
        <!-- Paginação -->
        <nav aria-label="Page navigation">
          <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Anterior</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Próximo</a></li>
          </ul>
        </nav>
      </div><!-- /Team Section -->

 
    </div>
  </section><!-- /Diário Oficial Section -->
</main>

<!--#include file="footer.asp"-->