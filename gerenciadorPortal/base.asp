<!--#include file ="lib/Conexao.asp"-->
<%
' Verifica se o usuário está logado
if session("idUsu") = "" then
response.Write("<script>")
response.Write("alert('O Usu\u00e1rio n\u00e3o est\u00e1 logado!');")
response.Write("window.location.assign('logout.asp')")
response.Write("</script>")
end if
%>

<%
call abreConexao
sql = "SELECT id_servidor, CPF, LEFT(NomeCompleto, CHARINDEX(' ', NomeCompleto + ' ') - 1) AS PrimeiroNome, RIGHT(NomeCompleto, CHARINDEX(' ', REVERSE(NomeCompleto) + ' ') - 1) AS UltimoNome, statusServidor FROM  cam_servidores where CPF = '"&session("idUsu")&"'"
set rs_Serv = conn.execute(sql)
if not rs_Serv.eof then
PrimeiroNome = rs_Serv("PrimeiroNome")
UltimoNome = rs_Serv("UltimoNome")
end if
call fechaConexao
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>CAMARA MUL. DE ANANÁS</title>

  <!-- Favicons -->
  <link href="../Site/assets/img/logoicon.png" rel="icon">

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
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/iCheck/all.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <!-- SweetAlert2 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">

  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css">

<!-- Data Tables -->
  <!-- DataTables -->
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index.asp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <img src="images/logoicon.png" alt="" class="logo-mini" width="45" height="45">
      <!-- logo for regular state and mobile devices -->
      <img src="images/logonova.png" alt="" class="logo-lg" width="150" height="50">
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

<div class="navbar-custom-menu">
  <ul class="nav navbar-nav">
    <!-- User Account: style can be found in dropdown.less -->
    <li class="user user-menu">
      <a href="logout.asp" id="logoutButton">
        <span class="hidden-xs"><i class="fa fa-fw fa-sign-out"></i> Sair</span>
      </a>
    </li>
  </ul>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  // Captura o evento de clique no botão de logout
  document.getElementById('logoutButton').addEventListener('click', function(event) {
    event.preventDefault(); // Previne o comportamento padrão do link

    // Exibe o SweetAlert2 para confirmar o logout
    Swal.fire({
      title: 'Sair do Sistema?',
      text: "Você estará encerrando a sessão atual.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sim, sair',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        // Se o usuário confirmar, redireciona para a página de logout
        window.location.href = 'logout.asp';
      }
    });
  });
</script>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=PrimeiroNome%>&nbsp<%=UltimoNome%></p>
          <a href="cad_administrador.asp"><i class="fa fa-pencil text-gray"></i> Minha Conta</a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
          <li class="header">MENU DE NAVEGAÇÃO</li>
          <li>
            <a href="index.asp"><i class="fa fa-dashboard"></i> <span>Painel</span></a>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-university"></i> <!-- Ícone representando a Câmara -->
              <span>A Câmara</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="cad-historia.asp"><i class="fa fa-book"></i> História</a></li> <!-- Ícone representando um livro -->
              <li><a href="list-vereadores.asp"><i class="fa fa-users"></i> Vereadores</a></li> <!-- Ícone representando um grupo de pessoas -->
              <li><a href="regimento.asp"><i class="fa fa-gavel"></i> Regimento Interno</a></li> <!-- Ícone representando um martelo -->
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-newspaper-o"></i> <!-- Ícone representando um jornal -->
              <span>Diario Oficial</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="list-diario.asp"><i class="fa fa-list"></i> Todos</a></li> <!-- Ícone representando uma lista -->
              <li><a href="cad-diario.asp"><i class="fa fa-plus"></i> Novo</a></li> <!-- Ícone representando um sinal de adição -->
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-bullhorn"></i> <!-- Ícone representando um megafone -->
              <span>Noticias</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="list-noticias.asp"><i class="fa fa-list"></i> Todos</a></li> <!-- Ícone representando uma lista -->
              <li><a href="cad-noticias.asp"><i class="fa fa-plus"></i> Novo</a></li> <!-- Ícone representando um sinal de adição -->
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-legal"></i> <!-- Ícone representando uma compra -->
              <span>Licitações</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="list-licitacao.asp"><i class="fa fa-legal"></i> <span>Licitação</span></a></li>
              <li><a href="cad-licitantes.asp"><i class="fa fa-users"></i> <span>Licitantes</span></a></li>
              <li><a href="cad-fiscais.asp"><i class="fa fa-shield"></i> <span>Fiscais/Responsáveis</span></a></li>
              <li><a href="list-contratos.asp"><i class="fa fa-file-text-o"></i> <span>Contratos</span></a></li>
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-shopping-cart"></i> <!-- Ícone representando uma compra -->
              <span>Compras e Suprimentos</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="list-ataPreco.asp"><i class="fa fa-file-text"></i> Atas de Registro de preço</a></li> <!-- Ícone representando um documento -->
              <li><a href="list-convenioCongeneres.asp"><i class="fa fa-handshake-o"></i> Convenios e Inst. Congêneres</a></li> <!-- Ícone representando um aperto de mãos -->
              <li><a href="list-pca.asp"><i class="fa fa-building"></i> PCA</a></li> <!-- Ícone representando um edifício -->
              <li><a href="list-obras.asp"><i class="fa fa-wrench"></i> Obras</a></li> <!-- Ícone representando uma ferramenta -->
              <li><a href="list-patrimonios.asp"><i class="fa fa-cubes"></i> Patrimonios</a></li> <!-- Ícone representando cubos -->
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-book"></i> <!-- Ícone representando um livro -->
              <span>Legislação</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="list-legislacao.asp"><i class="fa fa-list"></i> Todos</a></li> <!-- Ícone representando uma lista -->
              <li><a href="cad-legislacao.asp"><i class="fa fa-plus"></i> Novo</a></li> <!-- Ícone representando um sinal de adição -->
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-bar-chart"></i> <!-- Ícone representando um gráfico -->
              <span>Execução Orçamentária</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="list-despesaEmpenho.asp"><i class="fa fa-money"></i> Despesas e Empenho</a></li> <!-- Ícone representando dinheiro -->
              <li><a href="list-pagamentos.asp"><i class="fa fa-credit-card"></i> Pagamentos</a></li> <!-- Ícone representando um cartão de crédito -->
              <li><a href="list-receitas.asp"><i class="fa fa-line-chart"></i> Receitas</a></li> <!-- Ícone representando um gráfico de linha -->
              <li><a href="list-execOrcamentaria.asp"><i class="fa fa-pie-chart"></i> PPA</a></li> <!-- Ícone representando um gráfico de pizza -->
              <li><a href="list-execOrcamentaria.asp"><i class="fa fa-book"></i> LDO</a></li> <!-- Ícone representando um livro -->
              <li><a href="list-execOrcamentaria.asp"><i class="fa fa-bar-chart"></i> LOA</a></li> <!-- Ícone representando um gráfico de barras -->
              <li><a href="pages/tables/data.html"><i class="fa fa-calculator"></i> Despesas Fixadas</a></li> <!-- Ícone representando uma calculadora -->
              <li><a href="pages/tables/data.html"><i class="fa fa-list-alt"></i> Receitas Previstas</a></li> <!-- Ícone representando uma lista -->
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-users"></i> <!-- Ícone representando pessoas -->
              <span>Recursos Humanos</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="list-servidores.asp"><i class="fa fa-calendar"></i>Servidores</a></li> <!-- Ícone representando um calendário -->
              <li><a href="list-concursos.asp"><i class="fa fa-users"></i> Concursos Públicos</a></li> <!-- Ícone representando um grupo de pessoas -->
              <li><a href="list-folhaPagamento.asp"><i class="fa fa-credit-card"></i> Folha de Pagamento</a></li> <!-- Ícone representando um cartão de crédito -->
              <li class="treeview">
                <a href="#">
                  <i class="fa fa-credit-card"></i> <span>Diárias Novas</span>
                  <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                  </span>
                </a>
                <ul class="treeview-menu">
                  <li><a href="gerenciador-diarias.asp"><i class="fa fa-cogs"></i> Gerenciador</a></li> <!-- Ícone de engrenagem, representa gerenciamento. -->
                  <li><a href="list-diarias.asp"><i class="fa fa-list"></i> Todas as Diárias</a></li> <!-- Ícone de lista, representando uma listagem. -->
                  <li><a href="sel-diarias.asp"><i class="fa fa-plus-circle"></i> Nova Diária</a></li> <!-- Ícone de mais, representando a adição de uma nova diária. -->
                </ul>
              </li>
              <li><a href="list-tabelaDiarias.asp"><i class="fa fa-credit-card"></i> Valores de Diárias</a></li> <!-- Ícone representando um cartão de crédito -->
            </ul>
          </li>
          <!-- Seção do Administrador -->
          <li class="header">Administrador</li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-table"></i> <span>Administradores</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="list-administrador.asp"><i class="fa fa-search"></i> <span>Todos</span></a></li> <!-- Ícone de pesquisa -->
              <li><a href="sel-admin.asp"><i class="fa fa-user-plus"></i> <span>Novo</span></a></li> <!-- Ícone de adicionar usuário -->
            </ul>
          </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- /.content-wrapper -->
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>