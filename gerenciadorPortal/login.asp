
<!--#include file ="lib/Conexao.asp"-->
<!--#include file="dist/md5.asp"-->
<%
   if request.form("cpf") <> "" and request.form("senha") <> "" then
    call abreConexao
      cpfLimpo = Replace(Replace(request.form("cpf"), ".", ""), "-", "")
      
      ' Consulta para buscar os dados do servidor
      sql = "SELECT id_servidor, CPF, NomeCompleto, senha, statusServidor FROM cam_servidores WHERE CPF = '" & cpfLimpo & "' AND (statusServidor = 1)"
      set rs_senha = conn.execute(sql)
      tiporetorno = 0
      
      if not rs_senha.eof then
          ' Verifica se o servidor está ativo (statusServidor = 1)
          if rs_senha("statusServidor") = 0 then
              tiporetorno = 1
              response.write "O servidor está inativo"
              response.end
          else
              ' Verifica a senha (usando MD5)
              senhaDigitadaMD5 = LCase(MD5(request.form("senha")))
              senhaArmazenada = LCase(Trim(rs_senha("senha")))

              ' Comparação de senhas
              if senhaDigitadaMD5 <> senhaArmazenada then
                  tiporetorno = 2
                  response.write "Senha incorreta"
                  response.end
              else
                  ' Se a senha estiver correta, cria a sessão e redireciona
                  Session("IdUsu") = rs_senha("CPF")
                  response.Redirect("index.asp")
              end if
          end if
      else
          response.write "Usuário não encontrado ou inativo."
      end if  

    call fechaConexao
   end if 
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>CAMARA MUL. DE ANANÁS</title>

  <!-- Favicons -->
  <link href="images/logoicon.png" rel="icon">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
  <!-- SweetAlert2 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    /* Deixar o fundo da página mais branco */
    body {
      background-color: #f7f7f7 !important;
    }

    /* Sombreamento no bloco de login */
    .login-box-body {
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }
  </style>

  <!-- Google Font -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<!-- Coloque o spinner fora do botão para exibir no centro da tela -->
<div id="loadingSpinner" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 10000;">
  <i class="fa fa-spinner fa-spin fa-3x fa-fw"></i>
  <span class="sr-only">Carregando...</span>
</div>

<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-logo">
      <img src="images/logonova.png" alt="" class="logo-img" width="200" height="60">
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
      <p class="login-box-msg">Faça login para iniciar a sua sessão!</p>

      <form action="login.asp" method="post" onsubmit="return validarCPF(); exibirLoading()">
        <div class="form-group has-feedback">
          <input type="text" class="form-control" id="cpf" name="cpf" placeholder="CPF" required>
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
          <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha" required>
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="row">
          <div class="col-xs-8">
            <div class="checkbox icheck">
              <label>
                <input type="checkbox"> Lembrar
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-xs-4">
            <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <a href="#">Esqueceu a senha?</a><br>
      <a href="../index.asp" class="text-center">↩ Voltar para o Site</a>

    </div>
    <!-- /.login-box-body -->
  </div>
  <!-- /.login-box -->

  <!-- jQuery 3 -->
  <script src="bower_components/jquery/dist/jquery.min.js"></script>
  <!-- jQuery Mask Plugin -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
  <!-- Bootstrap 3.3.7 -->
  <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- SweetAlert2 JS -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <!-- iCheck -->
  <script src="plugins/iCheck/icheck.min.js"></script>

  <script>
    $(function () {
      // Aplica a máscara ao campo de CPF
      $('#cpf').mask('000.000.000-00');

      $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' /* optional */
      });

    // Exibe o spinner ao submeter o formulário
    $('form').on('submit', function () {
      $('#loadingSpinner').show();  // Exibe o spinner de carregamento
      $('#btnLogin').prop('disabled', true); // Desabilita o botão para evitar múltiplos cliques
    });
    });

    // Função para validar CPF
    function validarCPF() {
      var cpf = document.getElementById("cpf").value.replace(/[^\d]+/g, '');
      
      if (cpf.length != 11 ||
        cpf == "00000000000" || cpf == "11111111111" ||
        cpf == "22222222222" || cpf == "33333333333" ||
        cpf == "44444444444" || cpf == "55555555555" ||
        cpf == "66666666666" || cpf == "77777777777" ||
        cpf == "88888888888" || cpf == "99999999999") {
        alert("CPF inválido");
        return false;
      }
      
      var soma = 0;
      var resto;
      for (var i = 1; i <= 9; i++) soma += parseInt(cpf.substring(i - 1, i)) * (11 - i);
      resto = (soma * 10) % 11;
      if ((resto == 10) || (resto == 11)) resto = 0;
      if (resto != parseInt(cpf.substring(9, 10))) {
        alert("CPF inválido");
        return false;
      }

      soma = 0;
      for (var i = 1; i <= 10; i++) soma += parseInt(cpf.substring(i - 1, i)) * (12 - i);
      resto = (soma * 10) % 11;
      if ((resto == 10) || (resto == 11)) resto = 0;
      if (resto != parseInt(cpf.substring(10, 11))) {
        alert("CPF inválido");
        return false;
      }

      return true;
    }
  </script>
</body>

</html>