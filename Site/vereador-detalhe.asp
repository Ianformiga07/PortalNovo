<!--#include file="base.asp"-->

<main class="main">

  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.asp">Inicio</a></li>
          <li class="current">Especificação Vereador</li>
        </ol>
      </nav>
      <h1>Vereador</h1>
        <a href="vereadores.asp" class="icon-voltar">
        <i class="fa fa-reply-all"></i> Voltar
        </a>  
    </div>
  </div><!-- End Page Title -->
    <%
    call abreConexao
      ' Consulta para as notícias recentes, excluindo a principal
      sqlRecentes = "SELECT * FROM cam_servidores inner join cam_vereador on cam_vereador.id_servidor = cam_servidores.id_servidor inner join cam_escolaridade on cam_escolaridade.id_escolaridade = cam_servidores.id_Escolaridade WHERE (cam_vereador.Id_Vereador = 55)"
      Set rs_vereadores = conn.Execute(sqlRecentes)
    %>
  <!-- Document Details Section -->
  <section id="document-details" class="section">
    <div class="container">
      <!-- Vereador Details -->
      <div class="row">
        <!-- Vereador Image -->
        <div class="col-md-4">
          <div class="vereador-photo">
            <img src="../gerenciadorPortal/upVereador/<%=rs_vereadores("fotoVereador")%>" alt="Foto do Vereador" class="img-fluid rounded">
          </div>
        </div>
        <!-- Vereador Information -->
        <div class="col-md-4">
          <div class="vereador-info">
            <h2 class="text-success"><%=rs_vereadores("NomeCompleto")%></h2>
            <hr> <!-- Linha embaixo do nome -->
            <h4><%=rs_vereadores("apelido")%></h4>
            <p><strong>Data de Nascimento:</strong> <%=rs_vereadores("DataNascimento")%></p>
            <p><strong>Ocupação:</strong> <%=rs_vereadores("ocupacao")%></p>
            <p><strong>Estado Civil:</strong> <%=rs_vereadores("EstadoCivil")%></p>
            <p><strong>Escolaridade:</strong> <%=rs_vereadores("desc_escolaridade")%></p>
            <p><strong>Naturalidade:</strong> <%=rs_vereadores("Cidade")%>,<%=rs_vereadores("UF")%></p>
            <p><strong>Telefone:</strong> <%=rs_vereadores("Celular")%></p>
            <p><strong>Email:</strong> <%=rs_vereadores("Email")%></p>
            <div class="party-logo mt-3">
              <h5><%=rs_vereadores("partido")%></h5>
            </div>
          </div>
        </div>

        <!-- Additional Information (Activities and Mandates) -->
        <div class="col-md-4">
          <!-- Legislative Activities Section -->
          <div class="legislative-activities">
            <h3 class="text-secondary">Atividades Legislativas</h3>
            <div class="d-flex align-items-center">
              <i class="fas fa-clipboard-list fa-2x"></i> <!-- Ícone indicando atividades -->
              <span class="ml-3"><strong> &nbsp Requerimentos:</strong> 15</span> <!-- Número de atividades -->
            </div>
          </div>

          <!-- Mandate Section -->
          <div class="mandate-section mt-4">
            <h3 class="text-secondary">Mandatos</h3>
            <p><strong>Total de Mandatos:</strong> 3</p>
            <ul>
              <li>Mandato 1: 2012 - 2016</li>
              <li>Mandato 2: 2016 - 2020</li>
              <li>Mandato 3: 2020 - 2024</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section><!-- /Document Details Section -->

</main>

<!--#include file="footer.asp"-->