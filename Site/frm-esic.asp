<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
<script>
function cadastrar(){

  var form = document.forms["frmEsic"];
    form.Operacao.value = 2;
    form.enctype = "multipart/form-data";
    form.action = "crud-esic.asp";
    form.submit();
}


// Função para liberar o campo de e-mail
function toggleEmailField() {
    var formaRecebimento = document.getElementById("formaRecebimento").value;
    var emailField = document.getElementById("emailContainer");

    if (formaRecebimento === "email") {
        emailField.style.display = "block"; // Mostra o campo de e-mail
        document.getElementById("email").required = true; // Torna o campo obrigatório
    } else {
        emailField.style.display = "none"; // Esconde o campo de e-mail
        document.getElementById("email").required = false; // Remove a obrigatoriedade
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
        <h4>Solicitação com Identificação</h4>
      </div>
      <div class="info-container">
        <div class="col-lg-12">
          <form name="frmEsic" method="post">
            <input type="hidden" name="Operacao">
            <fieldset>
              <legend>Informações do Solicitante</legend>
            <%
            call abreConexao
            sql = "SELECT id_tipoEsic, descTipo FROM cam_tipoEsic"
            set rs_tipoEsic = conn.execute(sql)
            %>
              <div class="form-group row">
                <div class="col-md-6">
                  <label for="tipoManifestacao">Tipo *</label>
                  <select id="tipoManifestacao" name="tipoManifestacao" class="form-select" required>
                  <option value="">-- Selecionar --</option>
                  <option value="" disabled></option>
            <%do while not rs_tipoEsic.eof%>
                  <option <%if  rtrim(tipoManifestacao) = rtrim(rs_tipoEsic("id_tipoEsic")) then response.write("selected") end if%> value="<%=rs_tipoEsic("id_tipoEsic")%>"><%=rs_tipoEsic("descTipo")%></option>
            <% rs_tipoEsic.movenext 
            loop 
            call fechaConexao
            %>
                  </select>
                </div>
                <div class="col-md-6">
                  <label for="nome">Nome *</label>
                  <input type="text" id="nome" name="nome" class="form-control" placeholder="Seu Nome" required>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="cpf">CPF *</label>
                  <input type="text" id="cpf" name="cpf" class="form-control" placeholder="Seu CPF" required>
                </div>
                <div class="col-md-6">
                  <label for="dataNasc">Data de Nascimento</label>
                  <input type="date" id="dataNasc" name="dataNasc" class="form-control">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="sexo">Sexo</label>
                  <select id="sexo" name="sexo" class="form-select">
                    <option value="">Selecione...</option>
                    <option value="M">Masculino</option>
                    <option value="F">Feminino</option>
                    <option value="O">Outro</option>
                  </select>
                </div>
                <%
                call abreConexao 
                sql = "SELECT * FROM cam_escolaridade ORDER BY id_escolaridade"
                set rs2 = conn.execute(sql) 
                %> 
                <div class="col-md-6">
                  <label for="Escolaridade">Escolaridade</label>
                  <select id="Escolaridade" name="Escolaridade" class="form-select">
                    <option value="">Selecione...</option>
                <%do while not rs2.eof%>
                    <option <%if  rtrim(Escolaridade) = rtrim(rs2("id_escolaridade")) then response.write("selected") end if%> value="<%=rs2("id_escolaridade")%>"><%=rs2("desc_escolaridade")%></option>
                <% rs2.movenext 
                loop 
                call fechaConexao
                %>
                  </select>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="telefone">Telefone/Celular</label>
                  <input type="tel" id="telefone" name="telefone" class="form-control" placeholder="Seu Telefone">
                </div>
                <div class="col-md-6">
                  <label for="formaRecebimento">Formas de Recebimento de Resposta *</label>
                  <select id="formaRecebimento" name="formaRecebimento" class="form-select" required onchange="toggleEmailField()">
                    <option value="">Selecione...</option>
                    <option value="email">Email</option>
                    <option value="postal">Pessoalmente</option>
                  </select>

                </div>
              </div>
              <!-- Campo de e-mail escondido por padrão -->
              <div class="form-group row" id="emailContainer" style="display: none;">
                <div class="col-md-12">
                  <label for="email">E-mail *</label>
                  <input type="email" id="email" name="email" class="form-control" placeholder="Seu E-mail">
                </div>
              </div>

              <div class="form-group">
                <label for="descricao">Descrição *</label>
                <textarea id="descricao" name="descricao" class="form-control" rows="4" placeholder="Descrição do Pedido" required></textarea>
              </div>

              <div class="form-group">
                <label for="upEsic">Anexar arquivo</label>
                <input type="file" id="upEsic" name="upEsic" class="form-control-file" accept=".doc,.docx,.jpeg,.jpg,.png,.bmp,.mp4,.pdf,.rar,.zip">
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