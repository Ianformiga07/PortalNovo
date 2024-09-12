<!--#include file="base.asp"-->

<main class="main">

  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.html">Inicio</a></li>
          <li><a href="e-sic.asp">e-SIC</a></li>
          <li class="current">Solicitar Informação</li>
        </ol>
      </nav>
      <h1>Solicitar Informação</h1>
    <!-- Ícone de Voltar -->
    <a href="e-sic.asp" class="icon-voltar">
      <i class="fa fa-reply-all"></i> Voltar
    </a>
    </div>
  </div><!-- End Page Title -->

  <!-- e-SIC Form Section -->
  <section id="esic-form" class="esic-form section">
    <div class="container" data-aos="fade-up" data-aos-delay="100">
      <div class="title-wrapper">
        <h4>Solicitação Sem Identificação</h4>
      </div>
      <div class="info-container ">
        <div class="col-lg-12">
          <form action="forms/esic-request.php" method="post">
            <fieldset>
              <legend>Informações do Solicitante</legend>

              <div class="form-group row">
                <div class="col-md-12">
                  <label for="request-type">Tipo *</label>
                  <select id="request-type" name="request-type" class="form-select" required>
                    <option value="demanda">Selecionar...</option>
                    <option value="demanda">Demanda</option>
                    <option value="manifestacao-elogio">Manifestação - Elogio</option>
                    <option value="manifestacao-critica">Manifestação - Crítica</option>
                    <option value="manifestacao-sugestao">Manifestação - Sugestão</option>
                    <option value="manifestacao-reclamacao">Manifestação - Reclamação</option>
                    <option value="solicitacao-acesso">Solicitação acesso a Informação</option>
                    <option value="denuncia">Denúncia</option>
                    <option value="representacao">Representação</option>
                  </select>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="response-method">Formas de Recebimento de Resposta *</label>
                  <select id="response-method" name="response-method" class="form-select" required onchange="toggleEmailField()">
                    <option value="email">Selecionar...</option>
                    <option value="email">Email</option>
                    <option value="postal">Buscar/Consultar Pessoalmente</option>
                  </select>
                </div>

                <!-- Campo de Email (oculto por padrão) -->
                <div class="col-md-6" id="email-field" style="display: none;">
                  <label for="email">Email *</label>
                  <input type="email" id="email" name="email" class="form-control" placeholder="Seu Email">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <label for="description">Descrição *</label>
                  <textarea id="description" name="description" class="form-control" rows="4" placeholder="Descrição do Pedido" required></textarea>                  
                </div>
              </div>

              <div class="form-group">
                <label for="file-upload">Anexar arquivo</label>
                <input type="file" id="file-upload" name="file-upload" class="form-control-file" accept=".doc,.docx,.jpeg,.jpg,.png,.bmp,.mp4,.pdf,.rar,.zip">
                <small class="form-text text-muted">Tipos Aceitos: .DOC, .DOCX, .JPEG, .JPG, .PNG, .BMP, .MP4, .PDF, .RAR, .ZIP. | Tamanho máximo do arquivo: 3000KB</small>
              </div>

              <div class="form-group text-center">
                <button type="submit" class="submit-button">Enviar Solicitação</button>
              </div>
            </fieldset>
          </form>
        </div><!-- End e-SIC Form -->
      </div>
    </div>
  </section><!-- /e-SIC Form Section -->

</main>

<!--#include file="footer.asp"-->

<script>
  function toggleEmailField() {
    var responseMethod = document.getElementById("response-method").value;
    var emailField = document.getElementById("email-field");

    if (responseMethod === "email") {
      emailField.style.display = "block";
    } else {
      emailField.style.display = "none";
    }
  }
</script>