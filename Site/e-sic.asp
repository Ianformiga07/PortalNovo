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

<%
call abreConexao
cons_protocolo = Request.Form("cons_protocolo")
If cons_protocolo <> "" Then
    ' Consulta SQL para buscar o protocolo no banco de dados
    sql = "SELECT * FROM cam_esic inner join cam_tipoEsic on cam_tipoEsic.id_tipoEsic = cam_esic.id_tipoEsic WHERE protocolo = '" & Replace(cons_protocolo, "'", "''") & "'"
    Set rs_resposta = conn.Execute(sql)

    If Not rs_resposta.EOF Then
        cons_protocolo = rs_resposta("protocolo")
        anonimo = rs_resposta("anonimo")
        resposta = rs_resposta("resposta")
        respondida = rs_resposta("respondida")
        descManifestacao = rs_resposta("descricaoEsic")
        dataResposta = rs_resposta("dataResposta")
        dataEnvio = rs_resposta("dataCad")
    Else
        cons_protocolo = "Nao encontrado"
        Existe = 0
    End If
End If
%>
        <!-- Consultar Manifestação -->
        <div class="esic-consulta" style="margin-top: 20px; padding-top: 10px; border-top: 1px solid #ddd;">
          <h3 class="title-green"><i class="fas fa-search"></i> Consultar Manifestação</h3>
          <p>Para consultar o status da sua manifestação, por favor, insira o número do protocolo no campo abaixo:</p>
          <form method="post">
            <div class="consulta-form" style="display: flex; align-items: center; gap: 10px;">
              <input type="text" id="cons_protocolo" name="cons_protocolo" placeholder="Número do Protocolo" style="padding: 10px; border-radius: 4px; border: 1px solid #ccc; width: 70%;">
              <button type="submit" class="consulta-button" style="padding: 10px 20px; background-color: #004c20; color: white; border: none; border-radius: 4px; cursor: pointer; transition: background-color 0.3s ease;">
                Consultar
              </button>
            </div>
          </form>
        </div><!-- /Consultar Manifestação -->

<% If cons_protocolo <> "" Then %>
    <!-- Modal Personalizada para Exibir as Informações -->
    <div class="modal-nova">
        <div class="modal-overlay-nova" onclick="fecharModal()"></div>
        <div class="modal-conteudo-novo">
            <div class="modal-cabecalho">
                <h5 class="modal-titulo-novo">Detalhes da Manifestação</h5>
                <!-- Botão de Fechar -->
                <button type="button" class="fechar-btn" onclick="fecharModal()">×</button>
            </div>
            <div class="modal-corpo">
                <div class="modal-item-novo">
                    <p><strong>Número do Protocolo:</strong> <%= cons_protocolo %></p>
                </div>
                <div class="modal-item-novo">
                    <p><strong>Descrição da Manifestação:</strong> <%= descManifestacao %></p>
                </div>
                <div class="modal-item-novo">
                    <p><strong>Data de Envio:</strong> <%= dataEnvio %></p>
                </div>
                <div class="modal-item-novo">
                    <p><strong>Status (Respondida):</strong> <% If respondida = True Then Response.Write("Respondida") Else Response.Write("Não respondida") End If %> </p>
                </div>

                <% If respondida = True Then %>
                    <% If anonimo = 1 Then %>
                        <!-- Caso seja anônimo, exibe apenas o protocolo, data de envio e o status de respondida -->
                        <div class="modal-item-novo">
                            <p><strong>Resposta:</strong><% If respondida = 1 Then Response.Write(resposta) Else Response.Write("Não respondida") End If %> </p>
                        </div>
                    <% Else %>
                        <!-- Caso não seja anônimo, exibe todos os dados preenchidos -->
                        <div class="modal-item-novo">
                            <p><strong>Resposta:</strong> <%= resposta %></p>
                        </div>

                        <div class="modal-item-novo">
                            <p><strong>Data da Resposta:</strong> <%= dataResposta %></p>
                        </div>
                    <% End If %>
                <% End If %>
            </div>
            <div class="modal-rodape">
                <!-- Botão de Fechar -->
                <button type="button" class="btn-fechar-modal" onclick="fecharModal()">Fechar</button>
            </div>
        </div>
    </div>

<% End If %>
<!-- Scripts para Fechar Modal -->
<script>
    function fecharModal() {
        var modal = document.querySelector('.modal-nova');
        modal.style.visibility = 'hidden';
    }
</script>

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