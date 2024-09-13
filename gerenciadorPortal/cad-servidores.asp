  <!--#include file="base.asp"-->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header bg-white p-bottom-5">
      <h1>
        <i class="fa fa-fw fa-check-square-o text-blue"></i> Novo Vereador
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Novo Vereador</li>
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
                            <div class="col-md-3">
                                <label for="CPF">CPF</label>
                                <input type="text" class="form-control" id="CPF" placeholder="Digite o CPF">
                            </div>
                            <div class="col-md-5">
                                <label for="nomeCompleto">Nome Completo</label>
                                <input type="text" class="form-control" id="nomeCompleto" placeholder="Digite o nome completo">
                            </div>
                            <div class="col-md-4">
                                <label for="apelido">Apelido</label>
                                <input type="text" class="form-control" id="apelido" placeholder="Digite o apelido">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="nomeCompleto">Data Nascimento</label>
                                <input type="date" class="form-control" id="nomeCompleto" placeholder="Digite o nome completo">
                            </div>
                            <div class="col-md-4">
                                <label for="apelido">Sexo</label>
                                <select class="form-control">
                                    <option> -- Selecionar --</option>
                                    <option>Masculino</option>
                                    <option>Feminino</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="apelido">Estado Civil</label>
                                <select class="form-control">
                                    <option> -- Selecionar --</option>
                                    <option>Solteiro</option>
                                    <option>Casado</option>
                                    <option>Divorciado</option>
                                </select>
                            </div>
                        </div>
                    </div>
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Endereço
                    </div>
                </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="apelido">CEP</label>
                                <input type="text" class="form-control" id="apelido" placeholder="00.000-000">
                            </div>
                            <div class="col-md-8">
                                <label for="apelido">Endereço</label>
                                <input type="text" class="form-control" id="apelido" placeholder="Digite o Endere;o">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">
                                <label for="apelido">Nº.</label>
                                <input type="text" class="form-control" id="apelido" placeholder="00">
                            </div>
                            <div class="col-md-5">
                                <label for="apelido">Bairro</label>
                                <input type="text" class="form-control" id="apelido" placeholder="Digite o Bairro">
                            </div>
                            <div class="col-md-5">
                                <label for="apelido">Complemento</label>
                                <input type="text" class="form-control" id="apelido" placeholder="Digite o Complemento">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="for_users_celular">
                                    Cidade
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-home"></i>
                                    </span>
                                    <input type="text" class="form-control" id="for_users_celular" name="users_celular" value="" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="for_users_Email">
                                    UF
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-map-marker"></i>
                                    </span>
                                    <input type="email" class="form-control" id="for_users_celular" name="users_celular" value="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
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
                            <div class="col-md-7">
                                <label for="for_users_Email">
                                    Email
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope-o"></i>
                                    </span>
                                    <input type="email" class="form-control" id="for_users_celular" name="users_celular" value="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="apelido">Escolaridade</label>
                                <select class="form-control">
                                    <option> -- Selecionar --</option>
                                    <option>Fundamental Incompleto</option>
                                    <option>Fundamental Completo</option>
                                    <option>Ensino Médio Incompleto</option>
                                    <option>Ensino Médio Completo</option>
                                    <option>Superior Incompleto</option>
                                    <option>Superior Completo</option>
                                    <option>Pós-Graduação</option>
                                    <option>Mestrado</option>
                                    <option>Doutorado</option>
                                    <option>Pós-Doutorado</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="apelido">Estado</label>
                                <select class="form-control">
                                    <option> -- Selecionar --</option>
                                    <option>Tocantins</option>
                                    <option>São Paulo</option>
                                    <option>Belém</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="apelido">Município</label>
                                <select class="form-control">
                                    <option> -- Selecionar --</option>
                                    <option>Ananás</option>
                                    <option>Palmas</option>
                                    <option>Araguaína</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
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
                            <div class="col-md-8">
                                <label for="for_users_Email">
                                    Email
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope-o"></i>
                                    </span>
                                    <input type="email" class="form-control" id="for_users_celular" name="users_celular" value="" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Adicione o campo para verificar se é o primeiro mandato -->
                    <div class="form-group">
                        <label for="primeiroMandato">Faz Parte da Mesa Diretora?</label>
                        <select class="form-control" id="primeiroMandato" onchange="mesaDiretora(this.value)">
                            <option> -- Selecionar --</option>
                            <option value="sim">Sim</option>
                            <option value="nao">Não</option>
                        </select>
                    </div>
                    <!-- Campos para mandatos anteriores, inicialmente ocultos -->
                    <div id="MostraMesa" style="display: none;">
                        <div id="mandatosContainer">
                            <div class="form-group mandato-item">
                            <label for="anoInicio">Função</label>
                                <select class="form-control">
                                    <option> -- Selecionar --</option>
                                    <option>Presidente</option>
                                    <option>Vice-Presidente</option>
                                    <option>1° Secretário</option>
                                    <option>2° Secretário</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <!-- Adicione o campo para verificar se é o primeiro mandato -->
                    <div class="form-group">
                        <label for="primeiroMandato">É o primeiro mandato?</label>
                        <select class="form-control" id="primeiroMandato" onchange="toggleMandatos(this.value)">
                            <option> -- Selecionar --</option>
                            <option value="sim">Sim</option>
                            <option value="nao">Não</option>
                        </select>
                    </div>

                    <!-- Campos para mandatos anteriores, inicialmente ocultos -->
                    <div id="mandatosAnteriores" style="display: none;">
                        <div id="mandatosContainer">
                            <div class="form-group mandato-item">
                                <label for="anoInicio">Período do Mandato</label>
                                <div class="row">
                                    <div class="col-md-5">
                                        <input type="text" class="form-control ano" placeholder="Ano Início" />
                                    </div>
                                    <div class="col-md-2 text-center">
                                        <span> até </span>
                                    </div>
                                    <div class="col-md-5">
                                        <input type="text" class="form-control ano" placeholder="Ano Fim" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-success" onclick="addMandato()">Adicionar Mandato</button>
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
<script>
function mesaDiretora(valor) {
    const MostraMesa = document.getElementById('MostraMesa');
    if (valor === 'sim') {
        MostraMesa.style.display = 'block';
    } else {
        MostraMesa.style.display = 'none';
    }
}

function toggleMandatos(valor) {
    const mandatosAnteriores = document.getElementById('mandatosAnteriores');
    if (valor === 'nao') {
        mandatosAnteriores.style.display = 'block';
    } else {
        mandatosAnteriores.style.display = 'none';
    }
}

function addMandato() {
    const container = document.getElementById('mandatosContainer');
    const novoMandato = document.createElement('div');
    novoMandato.className = 'form-group mandato-item';
    novoMandato.innerHTML = `
        <label for="anoInicio">Período do Mandato</label>
        <div class="row">
            <div class="col-md-5">
                <input type="text" class="form-control ano" placeholder="Ano Início" />
            </div>
            <div class="col-md-2 text-center">
                <span> até </span>
            </div>
            <div class="col-md-5">
                <input type="text" class="form-control ano" placeholder="Ano Fim" />
            </div>
        </div>
    `;
    container.appendChild(novoMandato);
}
</script>
<!--#include file="footer.asp"-->