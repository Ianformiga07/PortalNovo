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

' Verificando se a entrada para populacao e area é válida antes de converter
If IsNumeric(populacao) Then
    populacao = CDbl(populacao)
Else
    populacao = 0 ' valor padrão
End If

If IsNumeric(area) Then
    area = CDbl(area)
Else
    area = 0 ' valor padrão
End If

' Abrindo a conexão com o banco de dados
call abreConexao

' Verificando se já existe um registro na tabela cam_historia
sql = "SELECT COUNT(*) AS Total FROM cam_historia"
Set rs = conn.Execute(sql)

' Se não existir registro, faz o INSERT, caso contrário, faz o UPDATE
If rs("Total") = 0 Then
    ' Montando o SQL para o INSERT na tabela
    sql = "INSERT INTO cam_historia (anoFundacao, populacao, area, conteudo, diaAniversario, mesAniversario, idUsu_Cad, dataCad) VALUES (" & anoFundacao & ", " & populacao & ", " & area & ", '" & editor1 & "', " & diaAniversario & ", '" & mesAniversario & "', '" & session("idUsu") & "', GETDATE())"
    'response.write sql
    'response.end
    Set rs = conn.Execute(sql)
    ' Redirecionando após sucesso
    response.Redirect("cad-historia.asp?Resp=1") 
Else
    ' Se já existir, faz o UPDATE
    sql = "UPDATE cam_historia SET anoFundacao = " & anoFundacao & ", populacao = " & populacao & ", area = " & area & ", conteudo = '" & editor1 & "', diaAniversario = " & diaAniversario & ", mesAniversario = '" & mesAniversario & "', idUsu_Cad = '" & session("idUsu") & "', dataCad = GETDATE()"
    'response.write sql
    'response.end
    Set rs = conn.Execute(sql)
    ' Redirecionando após sucesso
    response.Redirect("cad-historia.asp?Resp=2") 
End If

' Fechando a conexão
call fechaConexao
%>