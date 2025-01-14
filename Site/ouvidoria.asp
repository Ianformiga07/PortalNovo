<!-- Inclua o Bootstrap primeiro -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
  <style>

</style>
<main class="main">
  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.html">Inicio</a></li>
          <li class="current">Ouvidoria</li>
        </ol>
      </nav>
      <h1>Ouvidoria</h1>
    </div>
  </div><!-- End Page Title -->

  <!-- Ouvidoria Section Wrapper -->
  <div class="news">
    <section id="ouvidoria" class="ouvidoria section">
      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <!-- Quadrados -->
<%
call abreConexao
    sql = "SELECT id_tipoManifestacao, descManifestacao, icone FROM cam_tipoManifestacao"
    Set rs = conn.Execute(sql)
%>


<div class="ouvidoria-grid">
<% 
    Do While Not rs.EOF
%>
    <a href="#" class="ouvidoria-item" data-toggle="modal" data-target="#<%= rs("id_tipoManifestacao") & "ModalManifestacao" %>">
        <i class="fa <%= rs("icone") %>"></i>
        <h3><%= rs("descManifestacao") %></h3>
    </a>
<%
        rs.MoveNext
    Loop
%>
</div>


<!-- Script de Validação e Manipulação de Campos -->
<script>
function toggleFields(modalId) {
    const fields = ['email', 'cpf', 'nome', 'telefone', 'recebimento'];
    const isDisabled = document.getElementById('anonimo' + modalId).value === "1";

    fields.forEach(field => {
        const element = document.getElementById(field + modalId);
        if (element) element.disabled = isDisabled;
    });
}

document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('[id="anonimo"]').forEach(select => {
        const modalId = select.id.replace('anonimo', '');
        toggleFields(modalId);
        select.addEventListener('change', () => toggleFields(modalId));
    });
});
</script>
<script>
function cadastrar(){

  var form = document.forms["frmModalOuvidoria"];
    form.Operacao.value = 2;
    form.enctype = "multipart/form-data";
    form.action = "crud-ouvidoria.asp";
    form.submit();
}

</script>

<%
    rs.MoveFirst
    Do While Not rs.EOF
%>

    <div class="modal fade" id="<%= rs("id_tipoManifestacao") & "ModalManifestacao" %>" tabindex="-1" role="dialog" aria-labelledby="<%= rs("descManifestacao") & "ModalLabel" %>" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="<%= rs("id_tipoManifestacao") & "ModalManifestacao" %>"><%= rs("descManifestacao") %></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form name="frmModalOuvidoria" method="post">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="id_tipoManifestacao" id="id_tipoManifestacao" value="<%=rs("id_tipoManifestacao")%>"> 
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="anonimo">Anônimo</label>
                  <select class="form-select" id="anonimo<%= rs("descManifestacao") %>" name="anonimo" onchange="toggleFields('<%= rs("descManifestacao") %>')">
                    <option value="default">Selecionar...</option>
                    <option value="1">Sim</option>
                    <option value="0">Não</option>
                  </select>
                </div>
                <div class="form-group col-md-4">
                  <label for="recebimento<%= rs("descManifestacao") %>">Forma de Recebimento</label>
                  <select class="form-select" id="recebimento<%= rs("descManifestacao") %>" name="recebimento">
                    <option value="default">Selecionar...</option>
                    <option value="email">E-mail</option>
                    <option value="pessoalmente">Pessoalmente</option>
                  </select>
                </div>
                <div class="form-group col-md-4">
                  <label for="email<%= rs("descManifestacao") %>">E-mail</label>
                  <input type="email" class="form-control" id="email<%= rs("descManifestacao") %>" name="email" placeholder="Digite seu e-mail">
                </div>
              </div>
              <div class="form-row">
                <div class="form-group col-md-4">
                  <label for="cpf<%= rs("descManifestacao") %>">CPF</label>
                  <input type="text" class="form-control" id="cpf<%= rs("descManifestacao") %>" name="cpf" placeholder="Digite seu CPF">
                </div>
                <div class="form-group col-md-4">
                  <label for="nome<%= rs("descManifestacao") %>">Nome</label>
                  <input type="text" class="form-control" id="nome<%= rs("descManifestacao") %>" name="nome" placeholder="Digite seu nome">
                </div>
                <div class="form-group col-md-4">
                  <label for="telefone<%= rs("descManifestacao") %>">Telefone</label>
                  <input type="text" class="form-control" id="telefone<%= rs("descManifestacao") %>" name="telefone" placeholder="Digite seu telefone">
                </div>
              </div>
              <div class="form-group">
                <label for="anexo<%= rs("descManifestacao") %>">Anexo</label>
                <input type="file" class="form-control-file" id="anexo<%= rs("descManifestacao") %>" name="anexo">
              </div>
              <div class="form-group">
                <label for="manifestacao<%= rs("descManifestacao") %>">Descreva sua manifestação</label>
                <textarea class="form-control" id="manifestacao<%= rs("descManifestacao") %>" name="manifestacao" rows="4" placeholder="Digite sua manifestação"></textarea>
              </div>
              <button type="submit" class="form-btn btn btn-custom pull-right" onClick="return cadastrar()"><i class="fa fa-paper-plane"></i> Enviar</button>
            </form>
          </div>
        </div>
      </div>
    </div>
<%
    rs.MoveNext
    Loop
%>
<%
call fechaConexao
%>
        <!-- Informações da Ouvidoria e Consultar Manifestação -->
        <div class="ouvidoria-details">
          <!-- Informações da Ouvidoria -->
          <div class="info-section">
            <h2>Informações da Ouvidoria</h2>
            <div class="info-item">
              <i class="fa fa-user"></i>
              <p><strong>Responsável:</strong> IAN LEANDRO CARDOSO FORMIGA</p>
            </div>
            <div class="info-item">
              <i class="fa fa-map-marker"></i>
              <p><strong>Endereço:</strong> Av. Brasil, 242 - centro, Ananás - TO, 77890-000</p>
            </div>
            <div class="info-item">
              <i class="fa fa-envelope"></i>
              <p><strong>Email:</strong> <a href="mailto:ouvidoria@riachinho.to.leg.br">ouvidoria@ananas.to.leg.br</a></p>
            </div>
            <div class="info-item">
              <i class="fa fa-phone"></i>
              <p><strong>Telefone:</strong> (63)3443-1147</p>
            </div>
            <div class="info-item">
              <i class="fa fa-clock"></i>
              <p><strong>Horário de Atendimento:</strong> de Segunda a Sexta 07:00 às 13:00 horas.</p>
            </div>
          </div>

<%
call abreConexao
cons_protocolo = Request.Form("cons_protocolo")
If cons_protocolo <> "" Then
    ' Consulta SQL para buscar o protocolo no banco de dados
    sql = "SELECT * FROM cam_manifestacao inner join cam_tipoManifestacao on cam_tipoManifestacao.id_tipoManifestacao = cam_manifestacao.id_tipoManifestacao WHERE protocolo = '" & Replace(cons_protocolo, "'", "''") & "'"
    Set rs_resposta = conn.Execute(sql)

    If Not rs_resposta.EOF Then
        cons_protocolo = rs_resposta("protocolo")
        anonimo = rs_resposta("anonimo")
        resposta = rs_resposta("resposta")
        respondida = rs_resposta("respondida")
        descManifestacao = rs_resposta("descManifestacao")
        dataResposta = rs_resposta("dataResposta")
        dataEnvio = rs_resposta("dataCad")
    Else
        cons_protocolo = "Não encontrado"
    End If
End If
%>

<!-- Consultar Manifestação -->
    <div class="consultar-manifestacao">
        <h2>Consultar Manifestação</h2>
        <p>Insira o número do protocolo e consulte o andamento da sua manifestação</p>
        <form method="post">
            <label for="cons_protocolo">Número de Protocolo</label>
            <input type="text" id="cons_protocolo" name="cons_protocolo" class="form-control" placeholder="Digite o número do protocolo">
            <button type="submit" class="btn btn-primary mt-3">Consultar</button>
        </form>
    </div>
        </div>

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
        <!-- Prazos e Orientações -->
        <div class="ouvidoria-details">
          <div class="info-section">
            <h2>Prazos</h2>
            <div class="content">
              <p><strong>Quais são os prazos definidos por lei para que a solicitação de informação seja respondida?</strong></p>
              <p>O Decreto nº 7.724/2012, que regulamenta a Lei de Acesso à Informação no âmbito do Poder Executivo Federal, determina os prazos seguidos pelo e-SIC. O prazo para recebimento de resposta é de 20 dias. O órgão ou entidade pode prorrogá-lo por mais 10 dias, caso haja justificativa.</p>
            </div>
          </div>
          <div class="info-section">
            <h2>Orientações</h2>
            <div class="content">
              <p><strong>O que devo fazer se o órgão não disponibilizar a resposta da solicitação no prazo limite?</strong></p>
              <p>Caso o órgão não responda ao pedido de informação dentro do prazo, o solicitante tem a possibilidade de registrar uma reclamação dirigida à autoridade de monitoramento da implementação da LAI (Lei de Acesso à Informação) no âmbito do órgão ou da entidade.</p>
            </div>
          </div>
        </div>

        <!-- Gráfico de Manifestações por Tipo -->
        <section id="grafico-manifestacoes" class="grafico-manifestacoes">
          <div class="chart-header">
            <h2>Manifestações por Tipo</h2>
          </div>
          <div class="card card-success">
            <div class="card-body">
              <div class="chart-container" style="position: relative; height: 350px; width: 100%;">
                <canvas id="manifestacoesChart"></canvas>
              </div>
            </div>
          </div>
        </section>


      </div>
    </section><!-- End Ouvidoria Section -->
  </div><!-- End Ouvidoria Wrapper -->

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
<script>
  const ctx = document.getElementById('manifestacoesChart').getContext('2d');
  const manifestacoesChart = new Chart(ctx, {
    type: 'bar', // Tipo do gráfico
    data: {
      labels: ['Denúncia', 'Dúvida', 'Elogio', 'Reclamação', 'Sugestão'], // Tipos de manifestação
      datasets: [{
        label: 'Número de Manifestações',
        data: [12, 19, 3, 5, 2], // Dados de exemplo
        backgroundColor: [
          'rgba(34, 193, 195, 0.8)', // Verde claro
          'rgba(45, 158, 70, 0.8)', // Verde médio
          'rgba(56, 204, 112, 0.8)', // Verde mais claro
          'rgba(74, 207, 159, 0.8)', // Verde água
          'rgba(103, 219, 166, 0.8)'  // Verde menta
        ],
        borderColor: [
          'rgba(34, 193, 195, 1)', // Verde claro
          'rgba(45, 158, 70, 1)', // Verde médio
          'rgba(56, 204, 112, 1)', // Verde mais claro
          'rgba(74, 207, 159, 1)', // Verde água
          'rgba(103, 219, 166, 1)'  // Verde menta
        ],
        borderWidth: 2, // Largura da borda das barras
        barThickness: 30 // Espessura das barras
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'top',
          labels: {
            color: '#333' // Cor do texto da legenda
          }
        },
        tooltip: {
          callbacks: {
            label: function(tooltipItem) {
              return `${tooltipItem.label}: ${tooltipItem.raw}`;
            }
          }
        }
      },
      scales: {
        x: {
          beginAtZero: true,
          ticks: {
            color: '#333', // Cor dos ticks do eixo x
            padding: 10 // Espaçamento dos ticks
          },
          grid: {
            display: false // Remove linhas de grade do eixo x
          }
        },
        y: {
          beginAtZero: true,
          ticks: {
            color: '#333', // Cor dos ticks do eixo y
            padding: 10 // Espaçamento dos ticks
          },
          grid: {
            color: '#e5e5e5', // Cor das linhas de grade
            borderColor: '#c2c2c2' // Cor da borda do eixo y
          }
        }
      }
    }
  });
</script>

<!--#include file="footer.asp"-->