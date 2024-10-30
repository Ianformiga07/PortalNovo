<!--#include file ="lib/Conexao.asp"-->
 <% Response.CodePage = 65001 %>
<%
' Capturando a operação para determinar se é cadastro ou alteração
Operacao = Replace(Request("Operacao"), ",", "")
' Captura dos campos do formulário
anoFundacao = Request("anoFundacao")
diaAniversario = Request("diaAniversario")
mesAniversario = Request("mesAniversario")
populacao = Request("populacao")
area = Request("area")
editor1 = Request("editor1")

' Verificando se é uma operação de cadastro
IF Operacao = "2" THEN ' CADASTRO
    call abreConexao
    ' Montando o SQL para o INSERT
    sql = "INSERT INTO cam_servidores (anoFundacao, dataAniversario, populacao, area, conteudo, UpCidade, UpBrasao, diaAniversario, mesAniversario, idUsu_Cad, dataCad) VALUES ('" & anoFundacao & "',  CONVERT(DateTime, '"&dataAniversario&"', 103), '" & populacao & "', '" & area & "', '" & editor1 & "', '" & diaAniversario & "', '" & mesAniversario & "', " & session("idUsu") & ", GETDATE())"
    response.write sql
    response.end
    Set rs = conn.Execute(sql)
    ' Redirecionando após sucesso
    response.Redirect("list-servidores.asp?Resp=1")	
    
    ' Fechando a conexão
    call fechaConexao
End If

' Verificando se é uma operação de atualização
IF Operacao = "3" THEN ' UPDATE
    call abreConexao

    ' Montando o SQL para o UPDATE em uma linha
    sql = "UPDATE cam_servidores SET NomeCompleto = '" & nomeCompleto & "', DataNascimento = CONVERT(DateTime, '" & dataNasc & "', 103), Sexo = '" & sexo & "', EstadoCivil = '" & estadoCivil & "', Matricula = '" & matricula & "', RG = '" & rg & "', OrgaoExpedidor = '" & orgaoExpedidor & "', id_Escolaridade = '" & escolaridade & "', CEP = '" & cep & "', Endereco = '" & endereco & "', Numero = '" & numero & "', Bairro = '" & bairro & "', Complemento = N'" & complemento & "', Cidade = '" & cidade & "', UF = '" & uf & "', Celular = '" & celular & "', Email = '" & email & "', id_TipoAdmissao = '" & tipoAdmissao & "', id_Cargo = '" & cargo & "', Decreto = '" & decreto & "', DataDecreto = CONVERT(DateTime, '" & dataDecreto & "', 103), CargaHorariaMensal = '" & cargaHoraria & "', DataAdmissao = CONVERT(DateTime, '" & dataAdmissao & "', 103), Banco = '" & banco & "', Agencia = '" & agencia & "', Conta = '" & conta & "', TipoConta = '" & tipoConta & "', id_Departamento = " & departamento & ", statusServidor = 1, id_UsuCad = " & session("idUsu") & ", dataCad = GETDATE() WHERE CPF = '" & CPF & "'"
    'response.write sql
    'response.end    
    ' Executando a consulta SQL
    Set rs = conn.Execute(sql)
    
    ' Redirecionando após sucesso
    response.Redirect("list-servidores.asp?Resp=2")
    
    ' Fechando a conexão
    call fechaConexao
End If
%>