<!--#include file ="lib/Conexao.asp"-->
<!--#include file="dist/md5.asp"-->
<%
Operacao = REQUEST("Operacao")
id_servidor = Request("id_servidor")
nivelAcesso = Request("nivelAcesso") 
senha = Request("senha") 
permissao = Request("permissao[]") 

' Criptografa a senha com MD5
senhaCriptografada = MD5(senha)

arrayNumeros = Split(permissao, ",")

'response.write nivelAcesso
'response.end
IF Operacao = 2 THEN 'CADASTRO

    ' Colocar validação aqui (valide os dados conforme necessário)

    call abreConexao

    ' Atualiza as informações do servidor (nível de acesso e senha criptografada)
    sql = "UPDATE cam_servidores SET nivelAcesso = '" & nivelAcesso & "', senha = '" & senhaCriptografada & "' WHERE id_servidor = '" & id_servidor & "'"
    'response.write sql
    'response.end
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

    ' Redireciona para a página de administração após o processo de inserção e exclusão
    response.Redirect("cad-administrador.asp?Resp=1&idServidor=" & id_servidor)	

    call fechaConexao
END IF

%>