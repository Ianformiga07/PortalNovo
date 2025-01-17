<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
  <main class="main">

    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
      <div class="container">
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">Inicio</a></li>
            <li class="current">Vereadores</li>
          </ol>
        </nav>
        <h1>Vereadores</h1>
      </div>
    </div><!-- End Page Title -->

      <%
      call abreConexao
        ' Consulta para as notícias recentes, excluindo a principal
        sqlRecentes = "SELECT cam_vereador.Id_Vereador, cam_servidores.NomeCompleto, cam_vereador.id_servidor, cam_vereador.apelido, cam_vereador.partido, cam_vereador.ocupacao, cam_vereador.fotoVereador, cam_vereador.IdMandato, cam_vereador.statusVereador FROM cam_vereador INNER JOIN cam_servidores ON cam_servidores.id_servidor = cam_vereador.id_servidor WHERE (cam_vereador.IdMandato = 3)"
        Set rs_vereadores = conn.Execute(sqlRecentes)
      %>
    <!-- Team Section -->
    <section id="team" class="team section">

      <div class="container">

        <div class="row gy-4">
      <% 
          Do While Not rs_vereadores.EOF
      %> 
          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
            <a href="vereador-detalhe.asp?id=<%=rs_vereadores("Id_Vereador")%>">
            <div class="team-member d-flex align-items-start">
              <div class="pic"><img src="../gerenciadorPortal/upVereador/<%=rs_vereadores("fotoVereador")%>" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4><%=rs_vereadores("NomeCompleto")%></h4>
                <h6><%=rs_vereadores("apelido")%></h6>
                <span>Presidente<%''=rs_vereadores("fotoVereador")%></span>
                <div class="social">
                <h6><%=rs_vereadores("partido")%></h6>
                </div>
              </div>
            </div>
          </a>
          </div><!-- End Team Member -->
      <%
              rs_vereadores.MoveNext
          Loop
          call fechaConexao
      %>

        </div>

      </div>

    </section><!-- /Team Section -->

  </main>

<!--#include file="footer.asp"-->