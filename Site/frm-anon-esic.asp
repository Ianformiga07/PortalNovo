<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
<script>
function cadastrar(){

  var form = document.forms["frmEsicAnon"];
    form.Operacao.value = 2;
    form.enctype = "multipart/form-data";
    form.action = "crud-AnonEsic.asp";
    form.submit();
}

  function toggleEmailField() {
    var responseMethod = document.getElementById("formaRecebimento").value;
    var emailField = document.getElementById("email-field");

    if (responseMethod === "email") {
      emailField.style.display = "block";
    } else {
      emailField.style.display = "none";
    }
  }
</script>
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
          <form name="frmEsicAnon" method="post">
            <input type="hidden" name="Operacao">
            <fieldset>
              <legend>Informações do Solicitante</legend>
            <%
            call abreConexao
            sql = "SELECT id_tipoEsic, descTipo FROM cam_tipoEsic"
            set rs_tipoEsic = conn.execute(sql)
            %>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="tipoManifestacao">Tipo *</label>
                  <select id="tipoManifestacao" name="tipoManifestacao" class="form-select" required>
                  <option value="">-- Selecionar --</option>
            <%do while not rs_tipoEsic.eof%>
                  <option <%if  rtrim(tipoManifestacao) = rtrim(rs_tipoEsic("id_tipoEsic")) then response.write("selected") end if%> value="<%=rs_tipoEsic("id_tipoEsic")%>"><%=rs_tipoEsic("descTipo")%></option>
            <% rs_tipoEsic.movenext 
            loop 
            call fechaConexao
            %>
                  </select>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="formaRecebimento">Formas de Recebimento de Resposta *</label>
                  <select id="formaRecebimento" name="formaRecebimento" class="form-select" required onchange="toggleEmailField()">
                    <option value="">Selecionar...</option>
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
                  <label for="descricao">Descrição *</label>
                  <textarea id="descricao" name="descricao" class="form-control" rows="4" placeholder="Descrição do Pedido" required></textarea>                  
                </div>
              </div>

              <div class="form-group">
                <label for="upAnonEsic">Anexar arquivo</label>
                <input type="file" id="upAnonEsic" name="upAnonEsic" class="form-control-file" accept=".doc,.docx,.jpeg,.jpg,.png,.bmp,.mp4,.pdf,.rar,.zip">
                <small class="form-text text-muted">Tipos Aceitos: .DOC, .DOCX, .JPEG, .JPG, .PNG, .BMP, .MP4, .PDF, .RAR, .ZIP. | Tamanho máximo do arquivo: 3000KB</small>
              </div>

              <div class="form-group text-center">
                <button type="submit" onClick="return cadastrar()" class="submit-button">Enviar Solicitação</button>
              </div>
            </fieldset>
          </form>
        </div><!-- End e-SIC Form -->
      </div>
    </div>
  </section><!-- /e-SIC Form Section -->

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
