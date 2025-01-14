<!--#include file="base.asp"-->

<main class="main">

  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.asp">Inicio</a></li>
          <li class="current">e-SIC</li>
        </ol>
      </nav>
      <h1>e-SIC - Serviço de Informações ao Cidadão</h1>
      <a href="index.asp" class="icon-voltar">
        <i class="fa fa-reply-all"></i> Voltar
      </a>
    </div>
  </div><!-- End Page Title -->

  <!-- e-SIC Information Section -->
  <section id="esic-info" class="section" style="margin-top: 20px;">
    <div class="container">
      <div class="esic-card" style="border: 1px solid #ddd; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
        <!-- e-SIC Introduction -->
        <div class="esic-intro" style="border-bottom: 2px solid #006400; padding-bottom: 10px; margin-bottom: 15px;">
          <h2 class="title-green"><i class="fas fa-info-circle"></i> Sobre o e-SIC</h2>
          <p>O e-SIC (Serviço de Informações ao Cidadão Eletrônico) permite que qualquer pessoa, física ou jurídica, encaminhe pedidos de acesso à informação para órgãos e entidades do poder público.</p>
        </div>

        <!-- e-SIC Request Options -->
        <div class="esic-options">
          <h3 class="title-green"><i class="fas fa-hand-point-right"></i> Como você deseja solicitar informações?</h3>
          <div class="esic-buttons">
            <!-- Botão para Identificação -->
            <a href="frm-esic.asp" class="esic-button">
              <i class="fas fa-user"></i> Solicitação com Identificação
            </a>
            <!-- Botão para Solicitação Anônima -->
            <a href="frm-anon-esic.asp" class="esic-button">
              <i class="fas fa-user-secret"></i> Solicitação Anônima
            </a>
            <!-- Botão para Solicitação Presencial -->
            <a href="frm-esicPresencial.asp" class="esic-button">
              <i class="fas fa-map-marker-alt"></i> Solicitação Presencial
            </a>
            <!-- Botão para Solicitação por Email -->
            <a href="frm-esicCorrespondecia.asp" class="esic-button">
              <i class="fas fa-envelope"></i> Solicitação por Correspondencia
            </a>
          </div>
        </div>

        <!-- e-SIC Prazo e Orientações -->
        <div class="esic-guidelines" style="margin-top: 20px; padding-top: 10px; border-top: 1px solid #ddd;">
          <h3 class="title-green"><i class="fas fa-clock"></i> Prazos e Orientações</h3>
          <p>Os pedidos de informação devem ser respondidos em até 20 dias, contados a partir da data do protocolo. Em casos específicos, este prazo pode ser prorrogado por mais 10 dias, mediante justificativa expressa ao solicitante.</p>
          <ul class="guidelines-list" style="list-style: none; padding: 0;">
            <li><i class="fas fa-check-circle"></i> Certifique-se de que todas as informações fornecidas sejam claras e completas.</li>
            <li><i class="fas fa-check-circle"></i> Utilize uma linguagem objetiva e específica ao descrever o que você deseja saber.</li>
            <li><i class="fas fa-check-circle"></i> Verifique se seu e-mail e telefone estão corretos para garantir o recebimento da resposta.</li>
          </ul>
        </div><!-- /e-SIC Prazo e Orientações -->

        <!-- Consultar Manifestação -->
        <div class="esic-consulta" style="margin-top: 20px; padding-top: 10px; border-top: 1px solid #ddd;">
          <h3 class="title-green"><i class="fas fa-search"></i> Consultar Manifestação</h3>
          <p>Para consultar o status da sua manifestação, por favor, insira o número do protocolo no campo abaixo:</p>
          <div class="consulta-form" style="display: flex; align-items: center; gap: 10px;">
            <input type="text" placeholder="Número do Protocolo" style="padding: 10px; border-radius: 4px; border: 1px solid #ccc; width: 70%;">
            <button class="consulta-button" style="padding: 10px 20px; background-color: #004c20; color: white; border: none; border-radius: 4px; cursor: pointer; transition: background-color 0.3s ease;">
              Consultar
            </button>
          </div>
        </div><!-- /Consultar Manifestação -->

      </div><!-- /e-SIC Card -->
    </div>
  </section><!-- /e-SIC Information Section -->

</main>
<!-- Campo hidden para o valor de Resp -->
<input type="hidden" id="hiddenResp" value="<%= Request("Resp") %>">
<input type="hidden" id="protocolo" name="protocolo" value="<%= Request("protocolo") %>">

<!-- SweetAlert e script para limpar URL -->
 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  window.onload = function () {
    var resp = document.getElementById('hiddenResp').value;
    var protocolo = document.getElementById('protocolo').value;

    if (resp == "1") {
      Swal.fire({
        icon: "success",
        title: "Mensagem enviada com sucesso!",
        html: `
          <p>Seu protocolo de envio é:</p>
          <h3 style="color: #218838; font-weight: bold;">${protocolo}</h3>
          <p>Guarde este número para consultas futuras.</p>
        `,
        footer: '<a href="#">Clique aqui para saber mais sobre consultas</a>'
      }).then(() => {
        // Recarrega a página sem cache
        window.location.reload(true);
      });
    }

    // Limpar a URL removendo os parâmetros 'Resp' e 'protocolo'
    const url = new URL(window.location);

    // Remove 'Resp' se existir
    if (url.searchParams.has('Resp')) {
      url.searchParams.delete('Resp');
    }

    // Remove 'protocolo' se existir
    if (url.searchParams.has('protocolo')) {
      url.searchParams.delete('protocolo');
    }

    // Atualiza a URL sem os parâmetros removidos
    if (url.searchParams.toString() === '') {
      window.history.replaceState(null, null, url.pathname);
    } else {
      window.history.replaceState(null, null, url); 
    }
  };
</script>
<!--#include file="footer.asp"-->