<!--#include file="base.asp"-->

    <script>
      function cadastrar(){

          var form = document.forms["frmRegimento"];
          form.Operacao.value = "2";
          form.enctype = "multipart/form-data";
          form.action = "crud-regimento.asp";
          form.submit();
      }
    </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-fw fa-check-square-o text-blue"></i> Regimento Interno
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Regimento Interno</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <div class="row">
      <!-- /.col -->
      <div class="col-md-12">
        <div class="nav-tabs-custom">
          <!-- general form elements -->
          <div class="box box-primary">
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" method="post" name="frmRegimento">
              <input type="hidden" name="Operacao" id="Operacao">
              <div class="box-body">
                <div class="form-group">
                  <label for="title">Título</label>
                  <input type="text" class="form-control" id="title" name="title" placeholder="Digite o título do Regimento Interno" required>
                </div>
                <div class="form-group">
                  <label for="description">Descrição</label>
                  <textarea class="form-control" id="description" name="description" rows="4" placeholder="Digite uma descrição opcional para o Regimento Interno"></textarea>
                </div>
                <div class="form-group">
                  <label for="upload">Arquivo PDF</label>
                  <input type="file" class="form-control" id="UpRegimento" name="UpRegimento" accept=".pdf" required>
                  <p class="help-block">Escolha o arquivo PDF do Regimento Interno.</p>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                  <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                  <button type="submit" class="btn btn-primary pull-right" onClick="return cadastrar()"><i class="fa fa-check"></i> Cadastrar</button>
              </div>
            </form>
          </div>
          <!-- /.box -->

        </div>
        <!-- /.nav-tabs-custom -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

  </section>
  <!-- /.content -->

</div>
<!--#include file="footer.asp"-->