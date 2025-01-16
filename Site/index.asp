  <!--#include file="base.asp"-->
  <% Response.CodePage = 65001 %>
  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section">
      <div id="hero-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">
        <div class="carousel-item active">
          <img src="assets/img/hero-carousel/03.png" alt="">
          <div class="carousel-container"></div>
        </div>
        <div class="carousel-item">
          <img src="assets/img/hero-carousel/04.png" alt="">
          <div class="carousel-container"></div>
        </div>
        <!--
        <div class="carousel-item">
          <img src="assets/img/hero-carousel/02.png" alt="">
          <div class="carousel-container"></div>
        </div>
        -->
        <a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
        </a>
        <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
        </a>
      </div>
    </section><!-- /Hero Section -->

  <!-- Portais -->
<div class="container5">
  <div class="portal5">
    <a href="e-sic.asp">
    <div class="icon5"><img src="assets/img/eSic.png" alt=""></div>
  </a>
  </div>
  <div class="portal5">
    <a href="transparencia.asp">
    <div class="icon5"><img src="assets/img/Transparencia.png" alt=""></div>
    </a>
  </div>
  <div class="portal5">
    <a href="https://radardatransparencia.atricon.org.br/radar-da-transparencia-publica.html">
    <div class="icon5"><img src="assets/img/Radar Transparencia.png" alt=""></div>
  </a>
  </div>
</div>

<!-- NOTICIAS -->
<section id="blog-posts" class="blog-posts section">
  <div class="container">
    <div class="row gy-4">
      <%
      call abreConexao
          ' Consulta para a notícia principal
          sqlPrincipal = "SELECT TOP (1) * FROM cam_noticias ORDER BY id_noticia DESC;"
          Set rs_Noticia = conn.Execute(sqlPrincipal)
          
          ' Armazena o ID da notícia em destaque
          destaqueId = rs_Noticia("id_noticia")

          ' Extrai o conteúdo
          fullContent = rs_Noticia("conteudo")
          
          ' Extrai o primeiro parágrafo
          firstParagraph = ""
          If InStr(fullContent, vbCrLf) > 0 Then
              firstParagraph = Split(fullContent, vbCrLf)(0)
          Else
              firstParagraph = fullContent ' Caso não tenha quebras, usa o conteúdo completo
          End If
      %>
      <!-- Notícia Principal -->
      <div class="section-title">
        <h2>Notícias Recentes</h2>
        <div class="section-bar"></div>
      </div>
      <div class="col-lg-8">
        <article class="main-post">
          <div class="post-img">
            <img src="../gerenciadorPortal/upNoticias/<%=rs_Noticia("anexo_noticia")%>" alt="" class="img-fluid">
          </div>
          <h2 class="title">
            <a href="#"><%=rs_Noticia("titulo")%></a>
          </h2>
          <div class="meta-top">
            <ul>
              <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="#"><%=rs_Noticia("autor")%></a></li>
              <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="#"><time datetime="<%=rs_Noticia("dataCad")%>"><%=rs_Noticia("dataCad")%></time></a></li>
            </ul>
          </div>
          <div class="content">
            <p>
              <%=firstParagraph%>
            </p>
            <div class="read-more">
              <a href="noticia-detalhe.asp?id=<%=rs_Noticia("id_noticia")%>">Leia Mais..</a>
            </div>
          </div>
        </article>
      </div>
      <%call fechaConexao%>

      <%
      call abreConexao
        ' Consulta para as notícias recentes, excluindo a principal
        sqlRecentes = "SELECT TOP (5) * FROM cam_noticias WHERE id_noticia <> " & destaqueId & " ORDER BY id_noticia DESC;"
        Set rs_NotiRecentes = conn.Execute(sqlRecentes)
      %>
      <!-- Posts Recentes -->
      <div class="col-lg-4">
        <div class="recent-posts-widget widget-item">
          <h3 class="widget-title">Postagens Recentes</h3>
      <% 
        Do While Not rs_NotiRecentes.EOF
      %> 
          <div class="post-item d-flex align-items-start">
            <img src="../gerenciadorPortal/upNoticias/<%=rs_NotiRecentes("anexo_noticia")%>" alt="" class="flex-shrink-0">
            <div>
              <h4><a href="noticia-detalhe.asp?id=<%=rs_NotiRecentes("id_noticia")%>"><%=rs_NotiRecentes("titulo")%></a></h4>
              <time datetime="<%=rs_NotiRecentes("dataCad")%>"><%=rs_NotiRecentes("dataCad")%></time>
              <p class="post-text"><%=rs_NotiRecentes("subtitulo")%></p>
            </div>
          </div><!-- End recent post item-->
      <%
            rs_NotiRecentes.MoveNext
        Loop
        call fechaConexao
      %>
        </div><!--/Recent Posts Widget -->
      </div><!--/col-lg-4-->
    </div><!--/row-->
  </div><!--/container-->
</section><!-- /Blog Posts Section -->

      <%
      call abreConexao
          sql = "SELECT top(5)id_legislacao, cam_legislacao.descricao, cam_categoriaLeg.descricao as descTipoLeg, anexo_legislacao, dataPublicacao FROM cam_legislacao inner join cam_categoriaLeg on cam_categoriaLeg.id_categoriaLeg = cam_legislacao.id_categoriaLeg"
          Set rs_DocRecentes = conn.Execute(sql)
      %>
      <!-- Services Section -->
      <section id="services" class="services section">

  <div class="container">
    <div class="services-grid">
      <!-- Notícias Recentes -->
      <div class="news">
        <div class="section-title">
          <h2>Documentos Recentes</h2>
          <div class="section-bar"></div>
        </div>
        <div class="diario">
          <div class="listaDiario">
      <% 
          Do While Not rs_DocRecentes.EOF
      %>      
            <div class="diario-item">
              <div class="diario-header">
                <h4 class="diario-subtitle"><%=rs_DocRecentes("descTipoLeg")%></h4>
                <p class="diario-date"><%=rs_DocRecentes("dataPublicacao")%></p>
                <div class="diario-icons">
                  <a href="../gerenciadorPortal/upAnexos/<%=rs_DocRecentes("anexo_legislacao")%>" class="diario-icon" target="_blank" title="Visualizar Detalhes">
                    <i class="bi bi-eye"></i>
                  </a>
                  <a href="../gerenciadorPortal/upAnexos/<%=rs_DocRecentes("anexo_legislacao")%>" download="<%=rs_DocRecentes("anexo_legislacao")%>">
                    <i class="bi bi-download" style="color: #004c20;"></i>
                  </a>
                </div>
              </div>
              <p class="diario-content"><%=rs_DocRecentes("descricao")%></p>
            </div>
      <%
              rs_DocRecentes.MoveNext
          Loop
          call fechaConexao
      %>

          </div>  
        </div>
      </div>

      <!-- Acesso Rápido -->
      <div class="quick-access">
        <div class="section-title">
          <h2>Acesso Rápido</h2>
          <div class="section-bar"></div>
        </div>
        <div class="AcessoRapidoContainer">
          <div class="AcessoRapido">
            <a href="contrato.asp" rel="noopener">
              <i class="fas fa-file-contract icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Contratos</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="atas-sessoes.asp" rel="noopener">
              <i class="fas fa-calendar-alt icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Atas de Sessões</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="diario-ofi.asp" rel="noopener">
              <i class="fas fa-book icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Diário Oficial</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="transparencia.asp" rel="noopener">
              <i class="fas fa-search icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Transparência</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="decretos.asp" rel="noopener">
              <i class="fas fa-file-alt icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Decretos</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="servidores.asp" rel="noopener">
              <i class="fas fa-users icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Servidores</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="portarias.asp" rel="noopener">
              <i class="fas fa-file-signature icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Portarias</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="licitacoes.asp" rel="noopener">
              <i class="fas fa-gavel icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Licitações</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="regimeinterno.asp" rel="noopener">
              <i class="fas fa-file-alt icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Regime Interno</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="mesadiretora.asp" rel="noopener">
              <i class="fas fa-user-tie icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Mesa Diretora</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="ouvidoria.asp" rel="noopener">
              <i class="fas fa-headset icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Ouvidoria</p>
            </a>
          </div>
          <div class="AcessoRapido">
            <a href="leis-municipais.asp" rel="noopener">
              <i class="fas fa-book-open icones" style="font-size:40px;"></i>
              <p class="has-grey-80-color has-text-color has-16-font-size">Leis Municipais</p>
            </a>
          </div>

        </div>
      </div>

    </div>
  </div>

</section><!-- /Services Section -->

<!-- Carrossel Automático -->
<section id="clients" class="section clients">
  <div class="container" data-aos="fade-up" data-aos-delay="100">

    <!-- Título da Seção -->
    <div class="section-title" data-aos="fade-up">
      <h2>Vereadores</h2>
    </div><!-- Fim do Título da Seção -->
      <%
      call abreConexao
        ' Consulta para as notícias recentes, excluindo a principal
        sqlRecentes = "SELECT Id_Vereador, id_servidor, apelido, partido, ocupacao, fotoVereador, IdMandato, statusVereador FROM cam_vereador WHERE IdMandato = 3"
        Set rs_vereadores = conn.Execute(sqlRecentes)
      %>
    <!-- Carrossel -->
    <div class="swiper init-swiper">
      <script type="application/json" class="swiper-config">
        {
          "loop": true,
          "speed": 600,
          "autoplay": {
            "delay": 5000
          },
          "slidesPerView": "auto",
          "pagination": {
            "el": ".swiper-pagination",
            "type": "bullets",
            "clickable": true
          },
          "breakpoints": {
            "320": {
              "slidesPerView": 2,
              "spaceBetween": 10
            },
            "480": {
              "slidesPerView": 3,
              "spaceBetween": 10
            },
            "640": {
              "slidesPerView": 4,
              "spaceBetween": 10
            },
            "992": {
              "slidesPerView": 6,
              "spaceBetween": 10
            }
          }
        }
      </script>
      <div class="swiper-wrapper align-items-center">
      <% 
          Do While Not rs_vereadores.EOF
      %>       
        <!-- Exemplo de card de vereador -->
        <div class="swiper-slide vereador-card green">
          <img src="../gerenciadorPortal/upVereador/<%=rs_vereadores("fotoVereador")%>" alt="Foto do Vereador 1">
          <h3><%=rs_vereadores("apelido")%></h3>
          <h4>Vereador</h4>
        </div>
      <%
              rs_vereadores.MoveNext
          Loop
          call fechaConexao
      %>
      </div><!-- Fim do swiper-wrapper -->

      <div class="swiper-pagination"></div>
    </div><!-- Fim do Carrossel -->
  </div><!-- Fim do container -->

  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script>
    // Inicialização do Swiper
    const swiperConfig = JSON.parse(document.querySelector('.swiper-config').textContent);
    const swiper = new Swiper('.init-swiper', swiperConfig);
  </script>
</section><!-- Fim da seção clients -->
<!-- FIM do Carrossel automatico -->
    <!-- About Section -->
    <section id="about" class="section about">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">
          <div class="col-lg-6 order-1 order-lg-2">
            <img src="assets/img/ananas.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 order-2 order-lg-1 content">
            <h3>CONHEÇA NOSSA CIDADE</h3>
            <p class="fst-italic">
              Conheça nossa cidade e se encante com suas belezas
            </p>
            <p>
              O município de Ananás, localizado no Vale do Araguaia, tem seu primeiro registro histórico em 1870. Teodoro Geofre Vanderley, proveniente do Maranhão, comprou uma gleba de terra, muito fértil em mogno, que era de propriedade dos padres. Após vários anos aquela foi vendida a João Ribeiro Pires de Oliveira. Em 1890, quando alguns fazendeiros escolheram as Campinas da região para criatório de gado, passando estes criadores, a trazerem suas famílias e habitarem este local. Mas, o primeiro registro histórico foi por ocasião da fixação da família José Honorato da Cruz, vinda do Maranhão por volta de 1903, onde hoje se ergue a sede principal. 
            </p>
            <p>
              Os primeiros habitantes trabalhavam na criação de gado, lavoura de cana e extração de amêndoas de babaçu. Aos poucos, com a fertilidade das terras, esse aglomerado rural começou a chamar a atenção dos municípios vizinhos.            
            </p>
            <button type="button" class="btn btn-success"><a href="historia.asp" style="color: aliceblue;" class="btn-get-started">Saiba Mais</a></button>
          </div>
        </div>
        
      </div>

    </section><!-- /About Section -->
  </main>
    <!--#include file="footer.asp"-->