<!--#include file="base.asp"-->
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
            <form role="form" method="post" enctype="multipart/form-data" action="upload_regimento.asp">
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
                  <input type="file" id="upload" name="upload" accept=".pdf" required>
                  <p class="help-block">Escolha o arquivo PDF do Regimento Interno.</p>
                </div>
                <div class="form-group">
                  <label for="date">Data</label>
                  <input type="date" class="form-control" id="date" name="date" required>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> Cadastrar</button>
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