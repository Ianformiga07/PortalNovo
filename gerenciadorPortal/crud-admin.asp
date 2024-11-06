<!--#include file ="lib/Conexao.asp"-->
<!--#include file="dist/md5.asp"-->
<%
Operacao = REQUEST("Operacao")
id_servidor = Request("id_servidor")
idAlt = REQUEST("idAlt")
nivelAcesso = Request("nivelAcesso") 
nomeCompleto = Request("nomeCompleto") 
dataNasc = Request("dataNasc") 
sexo = Request("sexo") 
email = Request("email") 
senha = Request("senha") 
permissao = Request("permissao[]") 

'response.write "Nome: "&nomeCompleto& "<br>"& "dataNasc: "&dataNasc& "<br>"& "sexo: "&sexo& "<br>"& "email: "&email& "<br>"& "nivelAcesso: "&nivelAcesso
'response.end
' Verifica se a senha foi preenchida
IF senha <> "" THEN
    ' Criptografa a senha com MD5
    senhaCriptografada = MD5(senha)
END IF

arrayNumeros = Split(permissao, ",")

IF Operacao = 2 THEN 'CADASTRO

    call abreConexao

    ' Montar a query de UPDATE sem alterar a senha se estiver em branco
    sql = "UPDATE cam_servidores SET nomeCompleto = '" & nomeCompleto & "', DataNascimento = CONVERT(DateTime, '" & dataNasc & "', 103), sexo = '" & sexo & "', email = '" & email & "', nivelAcesso = '" & nivelAcesso & "'"
    'response.write sql
    'response.end

    ' Apenas atualiza a senha se foi fornecida
    IF senha <> "" THEN
        sql = sql & ", senha = '" & senhaCriptografada & "'"
    END IF

    sql = sql & " WHERE id_servidor = '" & id_servidor & "'"
    
    Set rs = conn.Execute(sql)

    ' Remover as permissões atuais do servidor na tabela cam_permissaoAcesso antes de inserir as novas
    sqlDelete = "DELETE FROM cam_permissaoAcesso WHERE id_Servidor = '" & id_servidor & "'"
    conn.Execute(sqlDelete)

    ' Inserir as novas permissões para o servidor
    For a = 0 To UBound(arrayNumeros)
        sql2 = "INSERT INTO cam_permissaoAcesso(id_Servidor, id_permissao) VALUES('" & id_servidor & "', '" & arrayNumeros(a) & "')"
        'response.write sql2
        'response.end
        conn.Execute(sql2)
    Next

    if idAlt <> 1 then
    ' Redireciona para a página de administração após o processo de inserção e exclusão
    response.Redirect("cad-administrador.asp?Resp=1&idServidor=" & id_servidor)	
    else
    response.Redirect("cad-administrador.asp?Resp=2&idAlt=1&idServidor=" & id_servidor) 
    end if	
    call fechaConexao
END IF
%>