<!--#include file ="lib/Conexao.asp"-->
<!--#include file="dist/md5.asp"-->
<%
Operacao = REQUEST("Operacao")
id_servidor = Request("id_servidor")
nivelAcesso = Request("nivelAcesso") 
senha = Request("senha") 
permissao = Request("permissao[]") 


 arrayNumeros = Split(permissao, ",")




    IF Operacao = 2 then 'CADASTRO'

        'colocar validação aqui

        call abreConexao

        sql = "UPDATE cam_servidores SET nivelAcesso = '" & nivelAcesso & "', senha = '" & senha & "' WHERE id_servidor = '"&id_servidor&"'"
        'response.write sql
        'response.end
        Set rs = conn.Execute(sql)

        'Remover as permissões


        ' Exibir cada número separadamente
        For a = 0 To UBound(arrayNumeros)

          sql2 = "INSERT cam_permissaoAcesso(id_adminPermissao, id_permissao) VALUES('"&id_servidor&"', '"& arrayNumeros(a) &"')"
          'response.write sql2
          'response.end
          conn.execute(sql2)
        Next

        response.Redirect("#")	
        call fechaConexao
    End If

%>
