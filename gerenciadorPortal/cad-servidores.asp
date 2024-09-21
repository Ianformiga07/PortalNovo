  <!--#include file="base.asp"-->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header bg-white p-bottom-5">
      <h1>
        <i class="fa fa-fw fa-check-square-o text-blue"></i> Novo Servidor
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Novo Servidor</li>
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
                                <input type="text" class="form-control" id="CPF" placeholder="Digite o CPF">
                            </div>
                            <div class="col-md-8">
                                <label for="nomeCompleto">Nome Completo</label>
                                <input type="text" class="form-control" id="nomeCompleto" placeholder="Digite o nome completo">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="dataNasc">Data Nascimento</label>
                                <input type="text" class="form-control" id="dataNasc" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
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
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">
                                <label for="CPF">Matrícula</label>
                                <input type="text" class="form-control" id="CPF" placeholder="Digite a Matrícula">
                            </div>
                            <div class="col-md-3">
                                <label for="CPF">RG</label>
                                <input type="text" class="form-control" id="CPF" placeholder="Digite o RG">
                            </div>
                            <div class="col-md-3">
                                <label for="nomeCompleto">Orgão Expedidor</label>
                                <input type="text" class="form-control" id="nomeCompleto" placeholder="Digite o Orgão Expedidor">
                            </div>
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
                                <label for="apelido">CEP</label>
                                <input type="text" class="form-control" id="apelido" placeholder="00.000-000">
                            </div>
                            <div class="col-md-8">
                                <label for="apelido">Endereço</label>
                                <input type="text" class="form-control" id="apelido" placeholder="Digite o Endereço">
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
                                    <input type="text" class="form-control" id="for_users_celular" name="users_celular" data-inputmask='"mask": "(99) 99999-9999"' data-mask/>
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
                <br>
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Local Trabalho
                    </div>
                </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="apelido">Tipo de Admissão</label>
                                <select class="form-control">
                                    <option> -- Selecionar --</option>
                                    <option value="Concursado">Concursado</option>
                                    <option value="Contrato">Contrato</option>
                                    <option value="Comissionado">Comissionado</option>
                                    <option value="Estagiário">Estagiário</option>
                                    <option value="Terceirizado">Terceirizado</option>
                                    <option value="Efetivo">Efetivo</option>
                                    <option value="Aposentado">Aposentado</option>
                                    <option value="Eletivo">Eletivo (Vereador)</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="cargo">Cargo</label>
                                <select class="form-control" id="cargo" onchange="mostrarCamposAdicionais(this.value)">
                                    <option> -- Selecionar --</option>
                                    <option value="Assessor de Gabinete">Assessor de Gabinete</option>
                                    <option value="Assistente Administrativo">Assistente Administrativo</option>
                                    <option value="Auxiliar de Serviços Gerais">Auxiliar de Serviços Gerais</option>
                                    <option value="Contador">Contador</option>
                                    <option value="Controlador Interno">Controlador Interno</option>
                                    <option value="Diretor Legislativo">Diretor Legislativo</option>
                                    <option value="Procurador Jurídico">Procurador Jurídico</option>
                                    <option value="Secretário Legislativo">Secretário Legislativo</option>
                                    <option value="Técnico em Informática">Técnico em Informática</option>
                                    <option value="Vigilante">Vigilante</option>
                                    <option value="Chefe de Gabinete">Chefe de Gabinete</option>
                                    <option value="Assessor Parlamentar">Assessor Parlamentar</option>
                                    <option value="Assessor Jurídico">Assessor Jurídico</option>
                                    <option value="Motorista">Motorista</option>
                                    <option value="Vereador">Vereador</option>
                                    <option value="Tesoureiro">Tesoureiro</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="apelido">Cargo Recebimento</label>
                                <select class="form-control">
                                    <option> -- Selecionar --</option>
                                    <option value="Assessor de Gabinete">Assessor de Gabinete</option>
                                    <option value="Assistente Administrativo">Assistente Administrativo</option>
                                    <option value="Auxiliar de Serviços Gerais">Auxiliar de Serviços Gerais</option>
                                    <option value="Contador">Contador</option>
                                    <option value="Controlador Interno">Controlador Interno</option>
                                    <option value="Diretor Legislativo">Diretor Legislativo</option>
                                    <option value="Procurador Jurídico">Procurador Jurídico</option>
                                    <option value="Secretário Legislativo">Secretário Legislativo</option>
                                    <option value="Técnico em Informática">Técnico em Informática</option>
                                    <option value="Vigilante">Vigilante</option>
                                    <option value="Chefe de Gabinete">Chefe de Gabinete</option>
                                    <option value="Assessor Parlamentar">Assessor Parlamentar</option>
                                    <option value="Assessor Jurídico">Assessor Jurídico</option>
                                    <option value="Motorista">Motorista</option>
                                    <option value="Vereador">Vereador</option>
                                    <option value="Tesoureiro">Tesoureiro</option>
                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="apelido">Decreto</label>
                                <input type="text" class="form-control" id="apelido" >
                            </div>
                            <div class="col-md-3">
                                <label for="apelido">Data Decreto</label>
                                <input type="date" class="form-control" id="apelido" >
                            </div>
                            <div class="col-md-3">
                                <label for="apelido">Carga Horária/Mês</label>
                                <input type="text" class="form-control" id="apelido" placeholder="Digite a carga horária">
                            </div>
                            <div class="col-md-3">
                                <label for="apelido">Data de Admissão</label>
                                <input type="date" class="form-control" id="apelido">
                            </div>
                        </div>
                    </div>
                <br>    
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Dados Bancarios
                    </div>
                </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="banco">Nome Banco</label>
                                <input type="text" class="form-control" id="banco" name="banco" required>
                            </div>
                            <div class="col-md-4">
                                <label for="agencia">Agência</label>
                                <input type="text" class="form-control" id="agencia" name="agencia" required>
                            </div>
                            <div class="col-md-4">
                                <label for="conta">Conta</label>
                                <input type="text" class="form-control" id="conta" name="conta" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="tipoConta">Tipo de Conta</label>
                                <select class="form-control" id="tipoConta" name="tipoConta" required>
                                    <option>-- Selecionar --</option>
                                    <option value="Corrente">Corrente</option>
                                    <option value="Poupança">Poupança</option>
                                    <option value="Salário">Salário</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="operacao">Operação (se aplicável)</label>
                                <input type="text" class="form-control" id="operacao" name="operacao">
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


<!-- MASCARA DATA E TELEFONE -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, locale: { format: 'MM/DD/YYYY hh:mm A' }})
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    })

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    })
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass   : 'iradio_flat-green'
    })

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
  })
</script>

<!--#include file="footer.asp"-->