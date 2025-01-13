  <!--#include file="base.asp"-->
  <%
  call abreConexao
    If Request("Operacao") = 2 Then
        ' Inserção
        sql = "INSERT INTO cam_contatoSite (nomeCompleto, email, assunto, mensagem, data_envio, visualizado) " & _ 
      "VALUES ('" & Request.Form("nome") & "', '" & Request.Form("email") & "', '" & Request.Form("assunto") & "', '" & Request.Form("mensagem") & "', GETDATE(), 0)"
        'response.write sql
        'response.end
        conn.Execute(sql)
   
        ' Redireciona passando o ID na URL
        response.Redirect("contato.asp?Resp=1")
    end if
  call fechaConexao
  %>
<script>
function cadastrar() {
    // Aqui, você pode adicionar sua lógica de envio via backend (ASP)
    var form = document.forms["frmContato"];
    form.Operacao.value = 2;
    form.action = "contato.asp";
    form.submit();
}
</script>
  <main class="main">

    <!-- Page Title -->
    <div class="page-title" data-aos="fade">
      <div class="container">
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">Inicio</a></li>
            <li class="current">Contato</li>
          </ol>
        </nav>
        <h1>Contato</h1>
      </div>
    </div><!-- End Page Title -->

    <!-- Contact Section -->
    <section id="contact" class="contact section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">
    <div class="title-wrapper">
      <h4>Entre em Contato conosco</h4>
    </div>
        <div class="row gy-4">

          <div class="col-lg-6">
            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="200">
              <i class="bi bi-geo-alt"></i>
              <h3>Endereço</h3>
              <p>Av. Brasil, 242 - centro, Ananás - TO, 77890-000</p>
            </div>
          </div><!-- End Info Item -->

          <div class="col-lg-3 col-md-6">
            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="300">
              <i class="bi bi-telephone"></i>
              <h3>Fale Conosco</h3>
              <p>(63) 3442-1500</p>
            </div>
          </div><!-- End Info Item -->

          <div class="col-lg-3 col-md-6">
            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="400">
              <i class="bi bi-envelope"></i>
              <h3>Email</h3>
              <p>camaraananas@uol.com.br</p>
            </div>
          </div><!-- End Info Item -->

        </div>

        <div class="row gy-4 mt-1">
          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
           <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.20564820089!2d-48.07619972413042!3d-6.367426862289881!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x92da54d619742271%3A0x7d4206873b2deb22!2sC%C3%A2mara%20Municipal%20de%20Anan%C3%A1s!5e0!3m2!1spt-BR!2sbr!4v1723824995496!5m2!1spt-BR!2sbr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div><!-- End Google Maps -->

          <div class="col-lg-6">
            <form method="post" class="php-email-form" name="frmContato" data-aos="fade-up" data-aos-delay="400">
              <input type="hidden" name="Operacao" id="Operacao"> 
              <div class="row gy-4">

                <div class="col-md-6">
                  <input type="text" name="nome" class="form-control" placeholder="Seu Nome" required="">
                </div>

                <div class="col-md-6 ">
                  <input type="email" class="form-control" name="email" placeholder="Seu Email" required="">
                </div>

                <div class="col-md-12">
                  <input type="text" class="form-control" name="assunto" placeholder="Assunto" required="">
                </div>

                <div class="col-md-12">
                  <textarea class="form-control" name="mensagem" rows="6" placeholder="Mensagem" required=""></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <div class="loading">Loading</div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>
                  <button type="submit" onClick="return cadastrar()">Enviar</button>
                </div>

              </div>
            </form>
          </div><!-- End Contact Form -->

        </div>

      </div>

    </section><!-- /Contact Section -->

  </main>
<!-- Campo hidden para o valor de Resp -->
<input type="hidden" id="hiddenResp" value="<%= Request("Resp") %>">

<!-- SweetAlert e script para limpar URL -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  window.onload = function() {
    var resp = document.getElementById('hiddenResp').value;

    if (resp == "1") {
      Swal.fire({
        icon: 'success',
        title: 'Mensagem enviada com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    }

    // Limpar a URL removendo o parâmetro 'Resp'
    if (resp) {
      const url = new URL(window.location);
      url.searchParams.delete('Resp');

      if (url.searchParams.toString() === '') {
        window.history.replaceState(null, null, url.pathname);
      } else {
        window.history.replaceState(null, null, url);
      }
    }
  };
</script>
    <!--#include file="footer.asp"-->