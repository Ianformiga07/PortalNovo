  <!--#include file="base.asp"-->
  <style>
  </style>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header bg-white p-bottom-5">
      <h1>
        <i class="fa fa-fw fa-check-square-o text-blue"></i> Novo Administrador
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Novo Administrador</li>
      </ol>
    </section>

<!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Foto de Perfil
                </div>
            </div>
            <div class="box-body" >
                <img class="profile-user-img img-responsive preview-users-image" src="images/avatar.jpg" style="height: 200px; width: 200px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="users-image"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="users-image" name="users_imagem" style="display: none"/>
            </div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <!-- general form elements -->
            <div class="box box-primary">

                <!-- /.box-header -->
                <!-- form start -->
                <form role="form">
                <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Dados Pessoais
                    </div>
                </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="CPF">CPF</label>
                                <input type="text" class="form-control" id="CPF">
                            </div>
                            <div class="col-md-8">
                                <label for="nomeCompleto">Nome Completo</label>
                                <input type="text" class="form-control" id="nomeCompleto">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="dataNasc">Data Nascimento</label>
                                <input type="text" class="form-control" id="dataNasc" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                            </div>
                            <div class="col-md-6">
                                <label for="apelido">Sexo</label>
                                <select class="form-control">
                                    <option> -- Selecionar --</option>
                                    <option>Masculino</option>
                                    <option>Feminino</option>
                                </select>
                            </div>
                        </div>
                    </div>
                <br> 
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Endereço
                    </div>
                </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="cep">CEP</label>
                                <input type="text" class="form-control" id="cep">
                            </div>
                            <div class="col-md-8">
                                <label for="endereco">Endereço</label>
                                <input type="text" class="form-control" id="endereco">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label for="cidade">
                                    Cidade
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-home"></i>
                                    </span>
                                    <input type="text" class="form-control" id="cidade" name="cidade" value="" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="for_users_Email">
                                    UF
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-map-marker"></i>
                                    </span>
                                    <input type="text" class="form-control" id="uf" name="uf" value="" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="for_users_celular">
                                    Celular
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-phone"></i>
                                    </span>
                                    <input type="text" class="form-control" id="for_users_celular" name="users_celular" value="" />
                                </div>
                            </div>
                        </div>
                    </div>
                <br>
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Permissões de Acesso
                    </div>
                </div>
                <div class="col-md-12">
                <div class="row">
                    <label class="box-inline col-md-4">
                    <dl>
                        <dt class="font-w-100">
                        <div class="icheckbox_square-green" aria-checked="false" aria-disabled="false" style="position: relative;">
                            <input type="checkbox" class="flat-red">
                        </div> Administração
                        </dt>
                    </dl>
                    </label>


                </div>
                </div>
                <br>
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Dados de Acesso
                    </div>
                </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="for_users_Email">
                                    Email
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope-o"></i>
                                    </span>
                                    <input type="email" class="form-control" id="for_users_email" name="users_email" value="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="for_users_pass">
                                    Senha
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-lock"></i>
                                    </span>
                                    <input type="password" class="form-control" id="for_users_password" name="users_password" value="" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="for_users_pass">
                                    Confirmar Senha
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-lock"></i>
                                    </span>
                                    <input type="password2" class="form-control" id="for_users_password2" name="users_password2" value="" />
                                </div>
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
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->

  </div>
<!--#include file="footer.asp"-->