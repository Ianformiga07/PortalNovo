<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
<%
id_vereador = Request("id")

%>
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
      sqlRecentes = "SELECT * FROM cam_servidores inner join cam_vereador on cam_vereador.id_servidor = cam_servidores.id_servidor inner join cam_escolaridade on cam_escolaridade.id_escolaridade = cam_servidores.id_Escolaridade WHERE (cam_vereador.Id_Vereador = '"&id_vereador&"')"
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
            <img src="../gerenciadorPortal/upVereador/<%=rs_vereadores("fotoVereador")%>" alt="Foto do Vereador" class="responsive-img">
          </div>
        </div>
        <!-- Vereador Information -->
        <div class="col-md-4">
          <div class="vereador-info">
            <h2 class="text-success"><%=rs_vereadores("NomeCompleto")%></h2>
            <hr> <!-- Linha embaixo do nome -->
            <h4><%=rs_vereadores("apelido")%></h4>
            <ol style="list-style-type: none; padding: 0; margin: 0;">
              <li><strong>Data de Nascimento:</strong> <%=FormatDateTime(rs_vereadores("DataNascimento"), 2)%></li>
              <li><strong>Ocupação:</strong> <%=rs_vereadores("ocupacao")%></li>
              <li><strong>Estado Civil:</strong> 
                <%
                  if rs_vereadores("EstadoCivil") = 1 then
                    Response.write("Solteiro")
                  elseif rs_vereadores("EstadoCivil") = 2 then
                    Response.write("Casado")
                  else
                    Response.write("Divorciado")
                  end if
                %>
              </li>
              <li><strong>Escolaridade:</strong> <%=rs_vereadores("desc_escolaridade")%></li>
              <li><strong>Naturalidade:</strong> <%=rs_vereadores("Cidade")%>, <%=rs_vereadores("UF")%></li>
              <li><strong>Telefone:</strong> <%=rs_vereadores("Celular")%></li>
              <li><strong>Email:</strong> <%=rs_vereadores("Email")%></li>
              <li><strong>Partido:</strong> <%=rs_vereadores("partido")%></li>
            </ol>
          </div>
        </div>
        <% call fechaConexao %>
        <%
        call abreConexao
        sql = "SELECT cam_categoriaLeg.descricao AS Categoria, COUNT(cam_legislacao.id_legislacao) AS Total " & _
              "FROM cam_legislacao " & _
              "INNER JOIN cam_categoriaLeg ON cam_categoriaLeg.id_categoriaLeg = cam_legislacao.id_categoriaLeg " & _
              "WHERE cam_legislacao.id_AutorVer = " & id_vereador & " " & _
              "GROUP BY cam_categoriaLeg.descricao"
        Set rsCategorias = conn.Execute(sql)
        %>
        <!-- Additional Information (Activities and Mandates) -->
        <div class="col-md-4">
          <!-- Legislative Activities Section -->
          <div class="legislative-activities">
            <h3 class="text-secondary">Atividades Legislativas</h3>
        <% If Not rsCategorias.EOF Then %>
          <% Do While Not rsCategorias.EOF %>
            <div class="d-flex align-items-center">
              <i class="fas fa-clipboard-list"></i> <!-- Ícone indicando atividades -->
              <span class="ml-3"><strong> &nbsp <%= rsCategorias("Categoria") %>:</strong><%= rsCategorias("Total") %></span> <!-- Número de atividades -->
            </div>
          <% rsCategorias.MoveNext %>
        <% Loop %>
        <% Else %>
          <p>O vereador não possui atividades legislativas registradas.</p>
        <% End If %>
          </div>
          <% call fechaConexao %>
          <%
          call abreConexao
          sqlMandato = "SELECT id_mandatoAnt, id_vereador, id_mandatoleg, anoInicio, anoFim FROM cam_mandatoAnt WHERE id_vereador = " & id_vereador
          Set rs_Mandato = conn.Execute(sqlMandato)

          contadorMandatos = 0
          %>
          <div class="mandate-section mt-4">
            <h3 class="text-secondary">Mandatos</h3>
            <%
            if not rs_Mandato.EOF then 
              %><ul><%
              do while not rs_Mandato.EOF
                contadorMandatos = contadorMandatos + 1
              %>
                <li>Mandato <%=contadorMandatos%>: <%=rs_Mandato("anoInicio")%> - <%=rs_Mandato("anoFim")%></li>
              <%
                rs_Mandato.MoveNext
              loop
              %></ul>
              <p><strong>Total de Mandatos:</strong> <%=contadorMandatos%></p>
            <%
            else
              Response.Write("<p>Este vereador nao possui mandatos registrados.</p>")
            end if
            %>
          </div>
          <% call fechaConexao%>
        </div>
      </div>
    </div>
  </section><!-- /Document Details Section -->

</main>

<!--#include file="footer.asp"-->