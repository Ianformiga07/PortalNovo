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
      <img src="../Site/assets/img/logoicon.png" alt="" class="logo-mini" width="45" height="45">
      <!-- logo for regular state and mobile devices -->
      <img src="../Site/assets/img/logonova.png" alt="" class="logo-lg" width="150" height="50">
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
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="hidden-xs"><i class="fa fa-fw fa-sign-in"></i> Sair</span>
            </a>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
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
          <p>Ian Formiga</p>
          <a href="#"><i class="fa fa-pencil text-gray"></i> Minha Conta</a>
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
              <li><a href="cad-comissoes.asp"><i class="fa fa-sitemap"></i> Comissões</a></li> <!-- Ícone representando um organograma -->
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
              <li><a href="pages/UI/icons.html"><i class="fa fa-file-text"></i> Atas de Registro de preço</a></li> <!-- Ícone representando um documento -->
              <li><a href="pages/UI/icons.html"><i class="fa fa-handshake-o"></i> Convenios e Inst. Congêneres</a></li> <!-- Ícone representando um aperto de mãos -->
              <li><a href="pages/UI/icons.html"><i class="fa fa-building"></i> PCA</a></li> <!-- Ícone representando um edifício -->
              <li><a href="pages/UI/icons.html"><i class="fa fa-wrench"></i> Obras</a></li> <!-- Ícone representando uma ferramenta -->
              <li><a href="pages/UI/icons.html"><i class="fa fa-cubes"></i> Patrimonios</a></li> <!-- Ícone representando cubos -->
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
              <li><a href="pages/tables/simple.html"><i class="fa fa-money"></i> Despesas e Empenho</a></li> <!-- Ícone representando dinheiro -->
              <li><a href="pages/tables/data.html"><i class="fa fa-credit-card"></i> Pagamentos</a></li> <!-- Ícone representando um cartão de crédito -->
              <li><a href="pages/tables/data.html"><i class="fa fa-line-chart"></i> Receitas</a></li> <!-- Ícone representando um gráfico de linha -->
              <li><a href="pages/tables/data.html"><i class="fa fa-pie-chart"></i> PPA</a></li> <!-- Ícone representando um gráfico de pizza -->
              <li><a href="pages/tables/data.html"><i class="fa fa-book"></i> LDO</a></li> <!-- Ícone representando um livro -->
              <li><a href="pages/tables/data.html"><i class="fa fa-bar-chart"></i> LOA</a></li> <!-- Ícone representando um gráfico de barras -->
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
              <li><a href="pages/calendar.html"><i class="fa fa-calendar"></i>Servidores</a></li> <!-- Ícone representando um calendário -->
              <li><a href="pages/UI/sliders.html"><i class="fa fa-id-badge"></i> Contra-Cheques</a></li> <!-- Ícone representando um crachá -->
              <li><a href="pages/UI/sliders.html"><i class="fa fa-users"></i> Concursos Públicos</a></li> <!-- Ícone representando um grupo de pessoas -->
              <li><a href="pages/UI/timeline.html"><i class="fa fa-credit-card"></i> Folha de Pagamento</a></li> <!-- Ícone representando um cartão de crédito -->
              <li><a href="pages/UI/timeline.html"><i class="fa fa-credit-card"></i> Diárias</a></li> <!-- Ícone representando um cartão de crédito -->
              <li><a href="pages/UI/timeline.html"><i class="fa fa-credit-card"></i> Valores de Diárias</a></li> <!-- Ícone representando um cartão de crédito -->
            </ul>
          </li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-file"></i> <!-- Ícone representando um arquivo -->
              <span>Transparência</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="pages/examples/invoice.html"><i class="fa fa-money"></i> Execução Orçamentária</a></li> <!-- Ícone representando dinheiro -->
              <li><a href="pages/examples/profile.html"><i class="fa fa-credit-card"></i> Pagamentos</a></li> <!-- Ícone representando um cartão de crédito -->
              <li><a href="pages/examples/login.html"><i class="fa fa-handshake-o"></i> Transferências</a></li> <!-- Ícone representando um aperto de mãos -->
              <li><a href="pages/examples/register.html"><i class="fa fa-gavel"></i> Licitações</a></li> <!-- Ícone representando um martelo -->
            </ul>
          </li>
          <!-- Seção do Administrador -->
          <li class="header">Administrador</li>
          <li class="treeview">
            <a href="#">
              <i class="fa fa-table"></i> <span>Usuários</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li><a href="#"><i class="fa fa-search"></i> <span>Consultar</span></a></li> <!-- Ícone de pesquisa -->
              <li><a href="#"><i class="fa fa-user-plus"></i> <span>Cadastrar</span></a></li> <!-- Ícone de adicionar usuário -->
            </ul>
          </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- /.content-wrapper -->
