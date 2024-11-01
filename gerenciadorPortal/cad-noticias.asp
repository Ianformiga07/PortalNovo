<!--#include file="base.asp"-->

  <script>
    function cadastrar(){  

    var form = document.forms["frmDiario"];
    form.Operacao.value = "2";
    form.enctype = "multipart/form-data";
    form.action = "crud-diario.asp";
    form.submit();
    }

    function alterar(){  
    if (validarCampos() == false) {
        return false;
    } 

    var form = document.forms["frmDiario"];
    form.Operacao.value = "3";
    form.enctype = "multipart/form-data";
    form.action = "crud-diario.asp";
    form.submit();
    }

  </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastro de Notícia
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Cadastro de Notícia</li>
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

            <!-- Primeira Imagem -->
            <div class="box box-primary">
                <div class="box-header with-border text-black-light">
                    <div class="box-title">Foto da Cidade</div>
                </div>
                <div class="box-body">
                    <% If UpCidade <> "" Then %>
                    <img class="profile-user-img img-responsive" src=".\<%= UpCidade %>" style="height: 200px; width: 200px;">
                    <% Else %>
                    <img class="profile-user-img img-responsive" src="images/image.jpg" style="height: 200px; width: 200px;">
                    <% End If %>
                </div>
                <div class="box-footer">
                    <button class="btn-file btn btn-success pull-right" id="users-image" data-toggle="modal" data-target="#uploadPhotoModal1">
                        <span class="fa fa-camera"></span> Foto
                    </button>
                </div>
            </div>
        </div>

        <!-- Modais para as Imagens -->
        <div class="modal fade" id="uploadPhotoModal1" tabindex="-1" role="dialog" aria-labelledby="uploadPhotoModalLabel1" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="uploadPhotoModalLabel1">Carregar Foto da Notícia</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="uploadPhotoForm1" action="upFotoNoticia.asp?id_historia=<%=id_historia%>&Operacao=4" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="fileInput">Escolha uma imagem:</label>
                                <input type="file" class="form-control" id="upNoticia" name="upNoticia" accept="image/*" required>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" form="uploadPhotoForm1" class="btn btn-primary">Carregar</button>
                    </div>
                </div>
            </div>
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