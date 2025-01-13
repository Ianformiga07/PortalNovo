<!--#include file ="lib/Conexao.asp"-->
<%
Operacao = REQUEST("Operacao")
id_licitantes = Request("id_licitantes")
cnpjCpfLicitante = Request("cnpjCpfLicitante")
razaoSocial = Request("razaoSocial") 
nomeFantasia = Request("nomeFantasia") 
statusLicitante = Request("statusLicitante") 
motivo = Request("motivo") 


' Verificando se é uma operação de cadastro
IF Operacao = "2" THEN ' CADASTRO
    call abreConexao
    ' Montando o SQL para o INSERT
    sql = "INSERT INTO cam_licitantes (cnpjCpfLicitante, razaoSocial, nomeFantasia, statusLicitante, Motivo) VALUES ('" & cnpjCpfLicitante & "', '" & razaoSocial & "', '" & nomeFantasia & "', 1, '" & motivo & "')"
    'response.write sql
    'response.end
    Set rs = conn.Execute(sql)
    ' Redirecionando após sucesso
    response.Redirect("list-licitantes.asp?Resp=1")	
    
    ' Fechando a conexão
    call fechaConexao
End If

' Verificando se é uma operação de atualização
IF Operacao = "3" THEN ' UPDATE
    call abreConexao

    ' Montando o SQL para o UPDATE em uma linha
    sql = "UPDATE cam_licitantes SET cnpjCpfLicitante = '" & cnpjCpfLicitante & "', razaoSocial = '" & razaoSocial & "', nomeFantasia = '" & nomeFantasia & "', statusLicitante = '" & statusLicitante & "', Motivo = '" & Motivo & "' WHERE id_licitantes = '" & id_licitantes & "'"
    'response.write sql
    'response.end    
    ' Executando a consulta SQL
    Set rs = conn.Execute(sql)
    
    ' Redirecionando após sucesso
    Response.Redirect("cad-licitantes.asp?Resp=2&id_licitantes=" & id_licitantes & "&cnpjCpfLicitante=" & cnpjCpfLicitante)
    
    ' Fechando a conexão
    call fechaConexao
End If
%>