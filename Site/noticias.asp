<!--#include file="base.asp"-->
<%
call abreConexao
' Parâmetros de paginação
noticiasPorPagina = 8 ' Quantidade de notícias por página
paginaAtual = Request.QueryString("pagina")
If paginaAtual = "" Then
    paginaAtual = 1
Else
    paginaAtual = CInt(paginaAtual)
End If

inicio = (paginaAtual - 1) * noticiasPorPagina

' Consulta SQL com OFFSET-FETCH
sql = "SELECT id_noticia, titulo, subtitulo, conteudo, anexo_noticia, autor, destaque, dataCad, idUsu_Cad, idUsu_Alt, dataAlt, statusNoticia " & _
      "FROM cam_noticias " & _
      "ORDER BY dataCad DESC " & _
      "OFFSET " & inicio & " ROWS FETCH NEXT " & noticiasPorPagina & " ROWS ONLY"

Set rs = conn.Execute(sql)
%>
<main class="main">

  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.html">Inicio</a></li>
          <li class="current">Notícias</li>
        </ol>
      </nav>
      <h1>Notícias</h1>
    </div>
  </div><!-- End Page Title -->

  <!-- Notícias Section -->
  <section id="noticias" class="noticias section">
    <div class="container">
      <div class="row">
          <% Do While Not rs.EOF %>
          <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
              <div class="card-noticia">
                  <img src="..\gerenciadorPortal\upNoticias\<%= rs("anexo_noticia") %>" alt="Imagem da Notícia" class="img-fluid">
                  <div class="card-body">
                      <h6 class="card-title"><%= rs("titulo") %></h6>
                      <p class="card-text"><%= Left(rs("conteudo"), 100) %>...</p>
                      <small class="text-muted">Data: <%= rs("dataCad") %></small>
                      <a href="noticia-detalhe.asp?id=<%= rs("id_noticia") %>" class="btn-leia-mais">Leia mais</a>
                  </div>
              </div>
          </div>
          <% rs.MoveNext %>
          <% Loop %>
      </div>

      </div>

<%
' Total de notícias
Dim totalNoticias, totalPaginas
Set rs = conn.Execute("SELECT COUNT(*) AS Total FROM cam_noticias")
totalNoticias = rs("Total")
If totalNoticias Mod noticiasPorPagina = 0 Then
    totalPaginas = totalNoticias \ noticiasPorPagina
Else
    totalPaginas = (totalNoticias \ noticiasPorPagina) + 1
End If
%>

<nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
        <%
        If paginaAtual > 1 Then
            Response.Write "<li class='page-item'><a class='page-link' href='noticias.asp?pagina=" & (paginaAtual - 1) & "'>Anterior</a></li>"
        Else
            Response.Write "<li class='page-item disabled'><a class='page-link'>Anterior</a></li>"
        End If

        For i = 1 To totalPaginas
            If i = paginaAtual Then
                Response.Write "<li class='page-item active'><a class='page-link'>" & i & "</a></li>"
            Else
                Response.Write "<li class='page-item'><a class='page-link' href='noticias.asp?pagina=" & i & "'>" & i & "</a></li>"
            End If
        Next

        If paginaAtual < totalPaginas Then
            Response.Write "<li class='page-item'><a class='page-link' href='noticias.asp?pagina=" & (paginaAtual + 1) & "'>Próximo</a></li>"
        Else
            Response.Write "<li class='page-item disabled'><a class='page-link'>Próximo</a></li>"
        End If
        %>
    </ul>
</nav>
<%
call fechaConexao
%>
    </div>
  </section><!-- /Notícias Section -->

</main>

<!--#include file="footer.asp"-->