<!--#include file="base.asp"-->
<%
idServidor = Request("idServidor")
if idServidor <> "" then
    call abreConexao
    sql = "SELECT * FROM cam_servidores WHERE CPF = '" & idServidor & "' AND statusServidor = 1"
    set rs_admin = conn.execute(sql)
    if not rs_admin.eof then
        ' Armazenando dados do servidor em variáveis
        cpf = rs_admin("CPF")
        nomeCompleto = rs_admin("NomeCompleto")
        dataNasc = rs_admin("DataNascimento") ' Exemplo de campo, ajuste conforme necessário
        sexo = rs_admin("Sexo") ' Exemplo de campo, ajuste conforme necessário
        email = rs_admin("Email") ' Exemplo de campo, ajuste conforme necessário
        nivelAcesso = rs_admin("NivelAcesso") ' Exemplo de campo, ajuste conforme necessário
    end if
    rs_admin.close
else
    ' Se não houver idServidor, inicialize as variáveis como vazias
    cpf = ""
    nomeCompleto = ""
    dataNasc = ""
    sexo = ""
    email = ""
    nivelAcesso = ""
end if
%>
<head>
    <!-- iCheck CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/icheck/1.0.2/skins/all.css">

    <!-- jQuery (necessário para iCheck) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- iCheck JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/icheck/1.0.2/icheck.min.js"></script>

    <script>
    $(document).ready(function() {
        // Inicializar todos os checkboxes de classe 'flat-red'
        $('input.flat-red').iCheck({
            checkboxClass: 'icheckbox_square-green', // Definir o estilo do checkbox como verde
            increaseArea: '20%' // Aumentar a área clicável
        });
    });
    </script>
</head>

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
                        <div class="box-title">Foto de Perfil</div>
                    </div>
                    <div class="box-body">
                        <img class="profile-user-img img-responsive preview-users-image" src="images/avatar.jpg" style="height: 200px; width: 200px;">
                    </div>
                    <div class="box-footer">
                    </div>
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <!-- general form elements -->
                    <div class="box box-primary">
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
                                            <input type="text" class="form-control" id="CPF" value="<%= cpf %>">
                                        </div>
                                        <div class="col-md-8">
                                            <label for="nomeCompleto">Nome Completo</label>
                                            <input type="text" class="form-control" id="nomeCompleto" value="<%= nomeCompleto %>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="dataNasc">Data Nascimento</label>
                                            <input type="text" class="form-control" id="dataNasc" value="<%= dataNasc %>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="sexo">Sexo</label>
                                            <select class="form-control" id="sexo">
                                                <option> -- Selecionar --</option>
                                                <option value="1" <% IF sexo = 1 THEN %> selected <% END IF %>>Masculino</option>
                                                <option value="0" <% IF sexo = 0 THEN %> selected <% END IF %>>Feminino</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <br>
                                <div class="box-header text-blue" style="border: none; padding: 0;">
                                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                                        <i class="fa fa-caret-right"></i> Dados de Acesso
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <!-- Nível de Acesso -->
                                        <div class="col-md-4">
                                            <label for="nivelAcesso">Nível de Acesso</label>
                                            <select class="form-control" id="nivelAcesso">
                                                <option> -- Selecionar --</option>
                                                <option value="1" <%IF nivelAcesso = 1 THEN%> selected <%END IF%>>Administrador Geral</option>
                                                <option value="2" <%IF nivelAcesso = 2 THEN%> selected <%END IF%>>Administrador I</option>
                                                <option value="3" <%IF nivelAcesso = 3 THEN%> selected <%END IF%>>Editor</option>
                                            </select>
                                        </div>
                                        
                                        <!-- Email -->
                                        <div class="col-md-8">
                                            <label for="email">Email</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-envelope-o"></i>
                                                </span>
                                                <input type="email" class="form-control" id="email" name="email" value="<%= email %>"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="senha">Senha</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-lock"></i>
                                                </span>
                                                <input type="password" class="form-control" id="senha" name="senha" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="confirmarSenha">Confirmar Senha</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-lock"></i>
                                                </span>
                                                <input type="password" class="form-control" id="confirmarSenha" name="confirmarSenha" />
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
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao_admin" value="1"> Administrador
                                                </dt>
                                            </dl>
                                        </label>
                                        <label class="box-inline col-md-4">
                                            <dl>
                                                <dt class="font-w-100">
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao_camara" value="2"> A Câmara
                                                </dt>
                                            </dl>
                                        </label>
                                        <label class="box-inline col-md-4">
                                            <dl>
                                                <dt class="font-w-100">
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao_diario" value="3"> Diário Oficial
                                                </dt>
                                            </dl>
                                        </label>
                                        <label class="box-inline col-md-4">
                                            <dl>
                                                <dt class="font-w-100">
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao_noticia" value="4"> Notícias
                                                </dt>
                                            </dl>
                                        </label>
                                        <label class="box-inline col-md-4">
                                            <dl>
                                                <dt class="font-w-100">
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao_licitacoes" value="5"> Licitações
                                                </dt>
                                            </dl>
                                        </label>
                                        <label class="box-inline col-md-4">
                                            <dl>
                                                <dt class="font-w-100">
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao_compras" value="6"> Compras e Suprimentos
                                                </dt>
                                            </dl>
                                        </label>
                                        <label class="box-inline col-md-4">
                                            <dl>
                                                <dt class="font-w-100">
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao_legislacao" value="7"> Legislação
                                                </dt>
                                            </dl>
                                        </label>
                                        <label class="box-inline col-md-4">
                                            <dl>
                                                <dt class="font-w-100">
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao_execOrcamentaria" value="8"> Execução Orçamentária
                                                </dt>
                                            </dl>
                                        </label>
                                        <label class="box-inline col-md-4">
                                            <dl>
                                                <dt class="font-w-100">
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao_RH" value="9"> Recursos Humanos
                                                </dt>
                                            </dl>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary pull-right">Salvar</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
<!--#include file="footer.asp"-->