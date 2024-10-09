  <!--#include file="base.asp"-->
  <%
  call abreConexao
  Existe = 0
  if request("Operacao") = 1 then 'Visualizar'
      sql = "SELECT * from cam_servidores where CPF = '"&replace(replace(replace(Request("CPF"),".",""),".",""),"-","")&"'"
      set rsVisu = conn.execute(sql)
      if not rsVisu.eof then
        cpf = rsVisu("CPF")
        nomeCompleto = rsVisu("NomeCompleto")
        dataNasc = rsVisu("DataNascimento")
        sexo = rsVisu("Sexo")
        estadoCivil = rsVisu("EstadoCivil")
        matricula = rsVisu("matricula")
        rg = rsVisu("rg")
        orgaoExpedidor = rsVisu("orgaoExpedidor")
        Escolaridade = rsVisu("id_Escolaridade")
        cep = rsVisu("cep")
        endereco = rsVisu("endereco")
        numero = rsVisu("numero")
        bairro = rsVisu("bairro")
        complemento = rsVisu("complemento")
        cidade = rsVisu("cidade")
        uf = rsVisu("uf")
        celular = rsVisu("celular")
        email = rsVisu("email")
        tipoAdmissao = rsVisu("id_TipoAdmissao")
        cargo = rsVisu("id_Cargo")
        departamento = rsVisu("id_Departamento")
        decreto = rsVisu("decreto")
        dataDecreto = rsVisu("dataDecreto")
        cargaHoraria = rsVisu("cargaHorariaMensal")
        dataAdmissao = rsVisu("dataAdmissao")
        banco = rsVisu("banco")
        agencia = rsVisu("agencia")
        conta = rsVisu("conta")
        tipoConta = rsVisu("tipoConta")
        operacao = rsVisu("operacao")
        Existe = 1
      end if
  elseif request("Operacao") = 2 then 'CADASTRAR'
    call abreConexao
    sql = "INSERT INTO cam_servidores (CPF, NomeCompleto, DataNascimento, Sexo, EstadoCivil, " & _
        "Matricula, RG, OrgaoExpedidor, id_Escolaridade, CEP, Endereco, Numero, Bairro, " & _
        "Complemento, Cidade, UF, Celular, Email, TipoAdmissao, Cargo, Departamento, " & _
        "Decreto, DataDecreto, CargaHoraria, DataAdmissao, Banco, Agencia, Conta, " & _
        "TipoConta, Operacao) VALUES (" & _
        "'" & Request.Form("cpf") & "', '" & _
        Request.Form("nomeCompleto") & "', '" & _
        Request.Form("dataNasc") & "', '" & _
        Request.Form("sexo") & "', '" & _
        Request.Form("estadoCivil") & "', '" & _
        Request.Form("matricula") & "', '" & _
        Request.Form("rg") & "', '" & _
        Request.Form("orgaoExpedidor") & "', " & _
        Request.Form("escolaridade") & ", '" & _
        Request.Form("cep") & "', '" & _
        Request.Form("endereco") & "', '" & _
        Request.Form("numero") & "', '" & _
        Request.Form("bairro") & "', '" & _
        Request.Form("complemento") & "', '" & _
        Request.Form("cidade") & "', '" & _
        Request.Form("uf") & "', '" & _
        Request.Form("celular") & "', '" & _
        Request.Form("email") & "', '" & _
        Request.Form("tipoAdmissao") & "', '" & _
        Request.Form("cargo") & "', '" & _
        Request.Form("departamento") & "', '" & _
        Request.Form("decreto") & "', '" & _
        Request.Form("dataDecreto") & "', '" & _
        Request.Form("cargaHoraria") & "', '" & _
        Request.Form("dataAdmissao") & "', '" & _
        Request.Form("banco") & "', '" & _
        Request.Form("agencia") & "', '" & _
        Request.Form("conta") & "', '" & _
        Request.Form("tipoConta") & "', '" & _
        Request.Form("operacao") & "')"
    call fechaConexao
  END IF



call fechaConexao
  %>

<script>
    function mascaraCPF(CPF) {
        // Remove tudo que não é dígito
        cpf = cpf.replace(/[^\d]+/g, '');
        
        // Aplica a máscara
        if (cpf.length <= 3) {
            cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
        } 
        else if (cpf.length <= 6) {
            cpf = cpf.replace(/(\d{3})(\d{3})(\d)/, '$1.$2.$3');
        } 
        else if (cpf.length <= 9) {
            cpf = cpf.replace(/(\d{3})(\d{3})(\d{3})(\d)/, '$1.$2.$3-$4');
        } 
        else {
            cpf = cpf.replace(/(\d{3})(\d{3})(\d{3})(\d{1})(\d)/, '$1.$2.$3-$4$5');
        }
        
        // Atualiza o campo de entrada
        document.getElementById('CPF').value = cpf;
    }

    function validarCPF() {
      var cpf = document.getElementById("CPF").value.replace(/[^\d]+/g, '');
      
      if (cpf.length != 11 ||
        cpf == "00000000000" || cpf == "11111111111" ||
        cpf == "22222222222" || cpf == "33333333333" ||
        cpf == "44444444444" || cpf == "55555555555" ||
        cpf == "66666666666" || cpf == "77777777777" ||
        cpf == "88888888888" || cpf == "99999999999") {
        alert("CPF inválido");
        return false;
      }
      
      var soma = 0;
      var resto;
      for (var i = 1; i <= 9; i++) soma += parseInt(cpf.substring(i - 1, i)) * (11 - i);
      resto = (soma * 10) % 11;
      if ((resto == 10) || (resto == 11)) resto = 0;
      if (resto != parseInt(cpf.substring(9, 10))) {
        alert("CPF inválido");
        return false;
      }

      soma = 0;
      for (var i = 1; i <= 10; i++) soma += parseInt(cpf.substring(i - 1, i)) * (12 - i);
      resto = (soma * 10) % 11;
      if ((resto == 10) || (resto == 11)) resto = 0;
      if (resto != parseInt(cpf.substring(10, 11))) {
        alert("CPF inválido");
        return false;
      }

      return true;
    }

function verificar_cadastro()
{   

    document.frmServidor.Operacao.value = 1;
	document.frmServidor.action = "cad-servidores.asp";
	document.frmServidor.submit();
}
</script>
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
        <form role="form" name="frmServidor" method="post">
            <input type="hidden" name="Operacao" id="Operacao">


        <div class="row">
            <div class="col-md-3">
          <!-- Profile Image -->
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <!-- general form elements -->
            <div class="box box-primary">

                <!-- /.box-header -->
                <!-- form start -->
                
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
                                <input type="text" class="form-control" id="CPF" name="CPF" placeholder="Digite o CPF" oninput="mascaraCPF(this.value)" onblur="return verificar_cadastro()" value="<%=cpf%>">
                            </div>
                            <div class="col-md-8">
                                <label for="nomeCompleto">Nome Completo</label>
                                <input type="text" class="form-control" id="nomeCompleto" name="nomeCompleto" value="<%=nomeCompleto%>" placeholder="Digite o nome completo">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="dataNasc">Data Nascimento</label>
                                <input type="text" class="form-control" id="dataNasc" name="dataNasc" value="<%=dataNasc%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                            </div>
                            <div class="col-md-4">
                                <label for="sexo">Sexo</label>
                                <select class="form-control" name="sexo" id="sexo">
                                    <option> -- Selecionar --</option>
                                    <option value="1" <% IF sexo = 1 THEN %> selected <% END IF %>>Masculino</option>
                                    <option value="0" <% IF sexo = 0 THEN %> selected <% END IF %>>Feminino</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="estadoCivil">Estado Civil</label>
                                <select class="form-control" id="estadoCivil" name="estadoCivil">
                                    <option> -- Selecionar --</option>
                                    <option value="1" <%IF estadoCivil = 1 THEN%> selected <%END IF%>>Solteiro</option>
                                    <option value="2" <%IF estadoCivil = 2 THEN%> selected <%END IF%>>Casado</option>
                                    <option value="3" <%IF estadoCivil = 3 THEN%> selected <%END IF%>>Divorciado</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">
                                <label for="matricula">Matrícula</label>
                                <input type="text" class="form-control" id="matricula" name="matricula" value="<%=matricula%>" placeholder="Digite a Matrícula">
                            </div>
                            <div class="col-md-3">
                                <label for="rg">RG</label>
                                <input type="text" class="form-control" id="rg" name="rg" value="<%=rg%>" placeholder="Digite o RG">
                            </div>
                            <div class="col-md-3">
                                <label for="orgaoExpedidor">Orgão Expedidor</label>
                                <input type="text" class="form-control" id="orgaoExpedidor" name="orgaoExpedidor" value="<%=orgaoExpedidor%>" placeholder="Digite o Orgão Expedidor">
                            </div>
                            <%
                            call abreConexao 
                            sql = "SELECT * FROM cam_escolaridade ORDER BY id_escolaridade"
                            set rs2 = conn.execute(sql) 
                            %> 
                            <div class="col-md-4">
                                <label for="escolaridade">Escolaridade</label>
                                <select class="form-control" id="escolaridade" name="escolaridade">
                                    <option> -- Selecionar --</option>
                            <%do while not rs2.eof%>
                                    <option <%if  rtrim(Escolaridade) = rtrim(rs2("id_escolaridade")) then response.write("selected") end if%> value="<%=rs2("id_escolaridade")%>"><%=rs2("desc_escolaridade")%></option>
                            <% rs2.movenext 
                            loop 
                            call fechaConexao
                            %>
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
                                <input type="text" class="form-control" id="cep" name="cep" value="<%=cep%>" placeholder="00.000-000">
                            </div>
                            <div class="col-md-8">
                                <label for="endereco">Endereço</label>
                                <input type="text" class="form-control" id="endereco" name="endereco" value="<%=endereco%>" placeholder="Digite o Endereço">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">
                                <label for="numero">Nº.</label>
                                <input type="text" class="form-control" id="numero" name="numero" value="<%=numero%>" placeholder="00">
                            </div>
                            <div class="col-md-5">
                                <label for="bairro">Bairro</label>
                                <input type="text" class="form-control" id="bairro" name="bairro" value="<%=bairro%>" placeholder="Digite o Bairro">
                            </div>
                            <div class="col-md-5">
                                <label for="complemento">Complemento</label>
                                <input type="text" class="form-control" id="complemento" name="complemento" value="<%=complemento%>" placeholder="Digite o Complemento">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="cidade">
                                    Cidade
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-home"></i>
                                    </span>
                                    <input type="text" class="form-control" id="cidade" name="cidade" value="<%=cidade%>" value="" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="uf">
                                    UF
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-map-marker"></i>
                                    </span>
                                    <input type="email" class="form-control" id="uf" name="uf" value="<%=uf%>" value="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label for="celular">
                                    Celular
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-phone"></i>
                                    </span>
                                    <input type="text" class="form-control" id="celular" name="celular" value="<%=celular%>" data-inputmask='"mask": "(99) 99999-9999"' data-mask/>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <label for="email">
                                    Email
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope-o"></i>
                                    </span>
                                    <input type="email" class="form-control" id="email" name="email" value="<%=email%>" value="" />
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
                            <%
                            call abreConexao 
                            sql = "SELECT * FROM cam_admissao ORDER BY id_tipoAdmissao"
                            set rs3 = conn.execute(sql) 
                            %> 
                            <div class="col-md-4">
                                <label for="admissao">Tipo de Admissão</label>
                                <select class="form-control" id="admissao" name="admissao">
                                    <option> -- Selecionar --</option>
                            <%do while not rs3.eof%>
                                    <option <%if  rtrim(tipoAdmissao) = rtrim(rs3("id_tipoAdmissao")) then response.write("selected") end if%> value="<%=rs3("id_tipoAdmissao")%>"><%=rs3("desc_admissao")%></option>
                            <% rs3.movenext 
                            loop 
                            call fechaConexao
                            %>
                                </select>
                            </div>
                            <%
                            call abreConexao 
                            sql = "SELECT * FROM cam_cargos ORDER BY id_cargo"
                            set rs4 = conn.execute(sql) 
                            %> 
                            <div class="col-md-4">
                                <label for="cargo">Cargo</label>
                                <select class="form-control" id="cargo" name="cargo" onchange="mostrarCamposAdicionais(this.value)">
                                    <option> -- Selecionar --</option>
                            <%do while not rs4.eof%>
                                    <option <%if  rtrim(cargo) = rtrim(rs4("id_cargo")) then response.write("selected") end if%> value="<%=rs4("id_cargo")%>"><%=rs4("desc_cargo")%></option>
                            <% rs4.movenext 
                            loop 
                            call fechaConexao
                            %>
                                </select>
                            </div>
                            <%
                            call abreConexao 
                            sql = "SELECT * FROM cam_departamento ORDER BY id_departamento"
                            set rs5 = conn.execute(sql) 
                            %> 
                            <div class="col-md-4">
                                <label for="departamento">Departamento</label>
                                <select class="form-control" id="departamento" name="departamento">
                                    <option> -- Selecionar --</option>
                            <%do while not rs5.eof%>
                                    <option <%if  rtrim(departamento) = rtrim(rs5("id_departamento")) then response.write("selected") end if%> value="<%=rs5("id_departamento")%>"><%=rs5("desc_departamento")%></option>
                            <% rs5.movenext 
                            loop 
                            call fechaConexao
                            %>
                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="decreto">Decreto</label>
                                <input type="text" class="form-control" id="decreto" name="decreto" value="<%=decreto%>">
                            </div>
                            <div class="col-md-3">
                                <label for="dataDecreto">Data Decreto</label>
                                <input type="text" class="form-control" id="dataDecreto" name="dataDecreto" value="<%=dataDecreto%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                            </div>
                            <div class="col-md-3">
                                <label for="cargaHoraria">Carga Horária/Mês</label>
                                <input type="text" class="form-control" id="cargaHoraria" name="cargaHoraria" value="<%=cargaHoraria%>" placeholder="Digite a carga horária">
                            </div>
                            <div class="col-md-3">
                                <label for="dataAdmissao">Data de Admissão</label>
                                <input type="text" class="form-control" id="dataAdmissao" name="dataAdmissao" value="<%=dataAdmissao%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
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
                                <input type="text" class="form-control" id="banco" name="banco" value="<%=banco%>" required>
                            </div>
                            <div class="col-md-4">
                                <label for="agencia">Agência</label>
                                <input type="text" class="form-control" id="agencia" name="agencia" value="<%=agencia%>" required>
                            </div>
                            <div class="col-md-4">
                                <label for="conta">Conta</label>
                                <input type="text" class="form-control" id="conta" name="conta" value="<%=conta%>" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="tipoConta">Tipo de Conta</label>
                                <select class="form-control" id="tipoConta" name="tipoConta" required>
                                    <option>-- Selecionar --</option>
                                    <option value="1" <%IF tipoConta  = 1 THEN%> selected <%END IF%>>Corrente</option>
                                    <option value="2" <%IF tipoConta  = 2 THEN%> selected <%END IF%>>Poupança</option>
                                    <option value="3" <%IF tipoConta  = 3 THEN%> selected <%END IF%>>Salário</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="operacao">Operação (se aplicável)</label>
                                <input type="text" class="form-control" id="operacao" name="operacao" value="<%=operacao%>">
                            </div>
                        </div>
                    </div>


                <div class="box-footer">
                    <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                    <button type="submit" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> <%if Existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
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