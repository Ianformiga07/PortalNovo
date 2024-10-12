<!--#include file="base.asp"-->
<%
idServidor = Request("idServidor")
if idServidor <> "" then
    call abreConexao
    sql = "SELECT * FROM cam_servidores WHERE CPF = '" & idServidor & "' AND statusServidor = 1"
    set rs_admin = conn.execute(sql)
    if not rs_admin.eof then
        ' Armazenando dados do servidor em variáveis
        id_servidor = rs_admin("id_servidor")
        cpf = rs_admin("CPF")
        nomeCompleto = rs_admin("NomeCompleto")
        dataNasc = rs_admin("DataNascimento") ' Exemplo de campo, ajuste conforme necessário
        sexo = rs_admin("Sexo") ' Exemplo de campo, ajuste conforme necessário
        email = rs_admin("Email") ' Exemplo de campo, ajuste conforme necessário
        nivelAcesso = rs_admin("NivelAcesso") ' Exemplo de campo, ajuste conforme necessário
        id_permissao = rs_admin("id_permissao")
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

function cadastrar(){

    var form = document.forms["frmAdmin"];
    form.Operacao.value = 2;
    form.action = "crud-admin.asp";
    form.submit();
}
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
        <form role="form" name="frmAdmin" method="post">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="id_servidor" id="id_servidor" value="<%=id_servidor%>">

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
                        <a href="uploadFoto.asp" class="btn-file btn btn-success pull-right" id="users-image"><span class="fa fa-camera"></span> Foto</a>
                    </div>
                </div>
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="nav-tabs-custom">
                    <!-- general form elements -->
                    <div class="box box-primary">
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
                                            <input type="text" class="form-control" id="CPF" value="<%= cpf %>" disabled>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="nomeCompleto">Nome Completo</label>
                                            <input type="text" class="form-control" id="nomeCompleto" value="<%= nomeCompleto %>" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="dataNasc">Data Nascimento</label>
                                            <input type="text" class="form-control" id="dataNasc" value="<%= dataNasc %>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask disabled>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="sexo">Sexo</label>
                                            <select class="form-control" id="sexo" disabled>
                                                <option> -- Selecionar --</option>
                                                <option value="M" <% IF sexo = "M" THEN %> selected <% END IF %>>Masculino</option>
                                                <option value="F" <% IF sexo = "F" THEN %> selected <% END IF %>>Feminino</option>
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
                                            <select class="form-control" id="nivelAcesso" name="nivelAcesso">
                                                <option> -- Selecionar --</option>
                                                <option value="2" <%IF nivelAcesso = 2 THEN%> selected <%END IF%>>Administrador</option>
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
                                                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" disabled/>
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

                                <style>
                                    .checkbox-container {
                                        display: flex;              /* Usar flexbox para alinhamento */
                                        flex-wrap: wrap;           /* Permitir que os checkboxes se movam para a linha seguinte se necessário */
                                        margin: -10px;             /* Para compensar a margem dos items */
                                    }
                                    .checkbox-item {
                                        display: inline-flex;       /* Usar inline-flex para o label */
                                        align-items: center;        /* Alinhar verticalmente o checkbox e o texto */
                                        margin: 10px;              /* Adicionar espaço entre os checkboxes */
                                        flex-basis: calc(33.33% - 20px); /* Definir a largura de cada checkbox (33% da linha) */
                                        box-sizing: border-box;     /* Para incluir padding e margin nas dimensões do elemento */
                                    }
                                </style>

                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="checkbox-container"> <!-- Contêiner flexível -->
                                            <%
                                                call abreConexao
                                                sql = "select * from cam_tipoPermissao order by id_permissao"
                                                set rs = conn.execute(sql)
                                                
                                                i = 0 
                                                do while not rs.eof
                                                    i = i + 1

                                                    sql2 = "Select count(*) as total from cam_permissaoAcesso WHERE id_permissao = '" & rs("id_permissao") & "' AND id_adminPermissao = '" & id_permissao & "'"
                                                    set rs1 = conn.execute(sql2)
                                                    total = rs1("total")
                                            %>
                                                <label class="checkbox-item"> <!-- Classe para cada item de checkbox -->
                                                    <!-- Checkbox com iCheck -->
                                                    <input type="checkbox" class="flat-red" name="permissao[]" id="permissao" value="<%=rs("id_permissao")%>" <%if csng(total) > csng(0) then%>checked <%end if%>> 
                                                    <%=rs("desc_Permissao")%>
                                                </label>
                                            <%
                                                rs.movenext
                                                loop
                                                call fechaConexao
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                                <button type="submit" class="btn btn-primary pull-right" onClick="return cadastrar()"><i class="fa fa-check"></i> Cadastrar</button>
                            </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
          </form>
        </div>
    </section>
    <!-- /.content -->
</div>
<!--#include file="footer.asp"-->