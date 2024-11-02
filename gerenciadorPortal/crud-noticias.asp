<!--#include file ="lib/Conexao.asp"-->
<% Response.CodePage = 65001 %>
<%
' Capturando a operação para determinar se é cadastro ou alteração
Operacao = Replace(Request("Operacao"), ",", "")
' Captura dos campos do formulário
titulo = Request("titulo")
subtitulo = Request("subtitulo")
editor1 = Request("editor1")
autor = Request("autor")
destaque = Request("destaque")
id_noticia = Request("id_noticia")

'response.write id_noticia
'response.end
' Abrindo a conexão com o banco de dados
call abreConexao

' Verificando se já existe um registro na tabela cam_noticias
sql = "SELECT COUNT(*) AS Total FROM cam_noticias"
Set rs = conn.Execute(sql)

' Se não existir registro, faz o INSERT, caso contrário, faz o UPDATE
If rs("Total") = 0 Then
    ' Montando o SQL para o INSERT na tabela
    sql = "INSERT INTO cam_noticias (titulo, subtitulo, conteudo, autor, destaque, dataCad, idUsu_Cad) VALUES (" & titulo & ", " & subtitulo & ", " & editor1 & ", " & autor & ", '" & destaque & "', '" & session("idUsu") & "', GETDATE())"
    'response.write sql
    'response.end
    Set rs = conn.Execute(sql)
        ' Recupera o último ID inserido
        Set rs = conn.Execute("SELECT SCOPE_IDENTITY() AS newID")
        Dim newID
        newID = rs("newID")
        rs.Close
        Set rs = Nothing
    response.Redirect("list-historia.asp?Resp=1") 
Else
    ' Se já existir, faz o UPDATE
    sql = "UPDATE cam_noticias SET titulo = '" & titulo & "', subtitulo = '" & subtitulo & "', conteudo = '" & editor1 & "', autor = '" & autor & "', destaque = '" & destaque & "', dataCad = GETDATE(), idUsu_Cad = '" & session("idUsu") & "' WHERE id_noticia = '"&id_noticia&"'"

    'response.write sql
    'response.end
    Set rs = conn.Execute(sql)
    ' Redirecionando após sucesso
    response.Redirect("cad-noticias.asp?Resp=2&id_noticia=" & id_noticia) 
End If

' Fechando a conexão
call fechaConexao
%>