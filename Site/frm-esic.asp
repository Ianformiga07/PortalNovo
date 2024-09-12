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
        <h4>Solicitação com Identificação</h4>
      </div>
      <div class="info-container">
        <div class="col-lg-12">
          <form action="forms/esic-request.php" method="post">
            <fieldset>
              <legend>Informações do Solicitante</legend>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="request-type">Tipo *</label>
                  <select id="request-type" name="request-type" class="form-select" required>
                  <option value="">Selecione...</option>
                    <option value="informacao">Demanda</option>
                    <option value="informacao">Manifestação - Elogio</option>
                    <option value="informacao">Manifestação - Crítica</option>
                    <option value="informacao">Manifestação - Sugestão</option>
                    <option value="informacao">Manifestação - Reclamação</option>
                    <option value="informacao">Solicitação acesso a Informação</option>
                    <option value="informacao">Denúncia</option>
                    <option value="informacao">Representação</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <label for="name">Nome *</label>
                  <input type="text" id="name" name="name" class="form-control" placeholder="Seu Nome" required>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="cpf">CPF *</label>
                  <input type="text" id="cpf" name="cpf" class="form-control" placeholder="Seu CPF" required>
                </div>
                <div class="col-md-6">
                  <label for="dob">Data de Nascimento</label>
                  <input type="date" id="dob" name="dob" class="form-control">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="gender">Sexo</label>
                  <select id="gender" name="gender" class="form-select">
                    <option value="">Selecione...</option>
                    <option value="male">Masculino</option>
                    <option value="female">Feminino</option>
                    <option value="other">Outro</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <label for="education">Escolaridade</label>
                  <select id="education" name="education" class="form-select">
                    <option value="">Selecione...</option>
                    <option value="fundamental">Fundamental</option>
                    <option value="medio">Médio</option>
                    <option value="superior">Superior</option>
                    <option value="pos-graduacao">Pós-Graduação</option>
                  </select>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="phone">Telefone/Celular</label>
                  <input type="tel" id="phone" name="phone" class="form-control" placeholder="Seu Telefone">
                </div>
                <div class="col-md-6">
                  <label for="response-method">Formas de Recebimento de Resposta *</label>
                  <select id="response-method" name="response-method" class="form-select" required>
                    <option value="email">Selecione...</option>
                    <option value="email">Email</option>
                    <option value="postal">Pessoalmente</option>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="description">Descrição *</label>
                <textarea id="description" name="description" class="form-control" rows="4" placeholder="Descrição do Pedido" required></textarea>
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