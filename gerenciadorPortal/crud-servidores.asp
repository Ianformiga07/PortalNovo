<!--#include file ="lib/Conexao.asp"-->
<%
' Capturando a operação para determinar se é cadastro ou alteração
Operacao = Replace(Request("Operacao"), ",", "")
' Captura dos campos do formulário
CPF = Request("CPF")
nomeCompleto = Request("nomeCompleto")
dataNasc = Request("dataNasc")
sexo = Request("sexo")
estadoCivil = Request("estadoCivil")
matricula = Request("matricula")
rg = Request("rg")
orgaoExpedidor = Request("orgaoExpedidor")
escolaridade = Request("escolaridade")
cep = Request("cep")
endereco = Request("endereco")
numero = Request("numero")
bairro = Request("bairro")
complemento = Request("complemento")
cidade = Request("cidade")
uf = Request("uf")
celular = Request("celular")
email = Request("email")
tipoAdmissao = Request("admissao")
cargo = Request("cargo")
departamento = Request("departamento")
decreto = Request("decreto")
dataDecreto = Request("dataDecreto")
cargaHoraria = Request("cargaHoraria")
dataAdmissao = Request("dataAdmissao")
banco = Request("banco")
agencia = Request("agencia")
conta = Request("conta")
tipoConta = Request("tipoConta")

' Verificando se é uma operação de cadastro
IF Operacao = "2" THEN ' CADASTRO
    call abreConexao
    ' Montando o SQL para o INSERT
    sql = "INSERT INTO cam_servidores (CPF, NomeCompleto, DataNascimento, Sexo, EstadoCivil, Matricula, RG, OrgaoExpedidor, id_Escolaridade, CEP, Endereco, Numero, Bairro, Complemento, Cidade, UF, Celular, Email, id_TipoAdmissao, id_Cargo, id_CargoRecebimento, Decreto, DataDecreto, CargaHorariaMensal, DataAdmissao, banco, agencia, conta, tipoConta, id_Departamento, statusServidor, id_UsuCad, dataCad) VALUES ('" & CPF & "', '" & nomeCompleto & "', '" & dataNasc & "', '" & sexo & "', '" & estadoCivil & "', '" & matricula & "', '" & rg & "', '" & orgaoExpedidor & "', '" & escolaridade & "', '" & cep & "', '" & endereco & "', '" & numero & "', '" & bairro & "', N'" & complemento & "', '" & cidade & "', '" & uf & "', '" & celular & "', '" & email & "', '" & tipoAdmissao & "', '" & cargo & "', '" & departamento & "', '" & decreto & "', '" & dataDecreto & "', '" & cargaHoraria & "', '" & dataAdmissao & "', '" & banco & "', '" & agencia & "', '" & conta & "', '" & tipoConta & "', 1, '" & session("idUsu") & "', GETDATE())"
    response.write sql
    response.end
    Set rs = conn.Execute(sql)
    ' Redirecionando após sucesso
    response.Redirect("cad-servidores.asp?Crud=1")	
    
    ' Fechando a conexão
    call fechaConexao
End If
%>