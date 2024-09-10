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
        <div class="col-md-8">
          <div class="nav-tabs-custom">
            <!-- general form elements -->
            <div class="box box-primary">
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="anoFundacao">
                                        Título
                                        <span class="text-red">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="anoFundacao" placeholder="Digite o ano de fundação">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="populacao">Subtitulo</label>
                                    <input type="text" class="form-control" id="populacao" placeholder="Digite a população">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>
                                        Conteúdo
                                        <span class="text-red">*</span>
                                    </label>
                                    <div class="box-body pad">
                                        <textarea id="editor1" name="editor1" rows="10" class="form-control" placeholder="Insira o conteúdo aqui">
                                            This is my textarea to be replaced with CKEditor.
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="populacao">Autor</label>
                                    <input type="text" class="form-control" id="populacao" placeholder="Digite a população">
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <!-- /.box -->

          </div>
          <!-- /.nav-tabs-custom -->
        </div>

        <div class="col-md-4">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
            </div>
            <div class="box-body">
                <img class="profile-user-img img-responsive preview-users-image" src="https://www.assindefesa-to.com.br/timthumb.php?src=admin-pcs/images/image.jpg&w=250" style="width: 250px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="users-image"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="users-image" name="users_imagem" style="display: none"/>
            </div>
          </div>
          <!-- /.box -->
        </div>
        <div class="col-md-4" style="padding-left: 15px; padding-right: 15px; margin-top: 20px;">
            <!-- Profile Image -->
            <div class="box box-primary" style="padding: 15px;">
                <div class="form-group">
                    <label for="for_posts_fixed">
                        Destaque
                        <span class="text-red-light" style="color: red;">*</span>
                    </label>
                    <div class="input-group">
                        <span class="input-group-addon">
                        <i class="fa fa-star"></i>
                        </span>
                        <select class="form-control" id="for_posts_fixed" name="posts_fixed" required="">
                        <option value="">-- Selecione --</option>
                        <option disabled=""></option>
                        <option value="1">Sim</option>
                        <option value="2">Não</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="data">Data da Publicação</label>
                            <input type="date" class="form-control" id="data" placeholder="Digite a Data">
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                    <button type="submit" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> Cadastrar</button>
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