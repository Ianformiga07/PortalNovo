<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-fw fa-check-square-o text-blue"></i> História
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">História</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">

        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Dados Pessoais</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form">
                <div class="box-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="anoFundacao">Ano de Fundação</label>
                                <input type="text" class="form-control" id="anoFundacao" placeholder="Digite o ano de fundação">
                            </div>
                            <div class="col-md-6">
                                <label for="dataAniversario">Data de Aniversário</label>
                                <input type="text" class="form-control" id="dataAniversario" placeholder="Digite a data de aniversário">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="populacao">População</label>
                                <input type="text" class="form-control" id="populacao" placeholder="Digite a população">
                            </div>
                            <div class="col-md-6">
                                <label for="area">Área</label>
                                <input type="text" class="form-control" id="area" placeholder="Digite a área">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>
                            Conteúdo
                            <span class="text-red-light">*</span>
                        </label>
                        <div class="box-body pad">
                            <textarea id="editor1" name="editor1" rows="10" cols="90">
                                
                            </textarea>
                        </div>
                    </div>

                </div>

                <div class="box-footer">
                    <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                    <button type="submit" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> Cadastrar</button>
                </div>
                </form>
            </div>
            <!-- /.box -->

          </div>
          <!-- /.nav-tabs-custom -->
        </div>

        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Foto da Cidade
                </div>
            </div>
            <div class="box-body">
                <img class="profile-user-img img-responsive preview-image-cidade" src="images/avatar.jpg" style="height: 150px; width: 150px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="image-cidade"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="image-cidade" name="users_imagem" style="display: none"/>
            </div>
          </div>
          <!-- /.box -->
        </div>
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Imagem do Brasão
                </div>
            </div>
            <div class="box-body">
                <img class="profile-user-img img-responsive preview-image-brasao" src="images/avatar.jpg" style="height: 150px; width: 150px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="image-brasao"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="image-brasao" name="users_imagem" style="display: none"/>
            </div>
          </div>
          <!-- /.box -->
        </div>

      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

  </div>

<!--#include file="footer.asp"-->