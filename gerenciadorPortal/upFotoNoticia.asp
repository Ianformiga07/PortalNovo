<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%
Dim Operacao, id_noticia, Form, sqlRestante, NomeArquivo1, upNoticia
Operacao = Request("Operacao")
id_noticia = Request("id_noticia")

Set Form = New ASPForm
Server.ScriptTimeout = 1440 ' Limite de 24 minutos de execução de código

Const MaxFileSize = 1200000 ' Limite de 1,2 MB de arquivo

If Form.State = 0 Then
    For Each Key in Form.Texts.Keys
        If Key = "Operacao" Then
            Operacao = Form.Texts.Item(Key)
        End If
    Next
    
    upNoticia = 0
    For Each Field in Form.Files.Items
        IF Field.Name = "upNoticia" THEN
            ' Cria um nome único para o arquivo
            NomeArquivo1 = Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
            
            ' Salva o arquivo na pasta 'upNoticias'
            Field.SaveAs Server.MapPath("upNoticias") & "\" & NomeArquivo1
            upNoticia = 1
        End If  
    Next

    ' Verificar se a notícia já existe
    Call abreConexao
    Dim rsVerificar, caminhoFotoAntiga, newID
    Set rsVerificar = conn.Execute("SELECT anexo_noticia FROM cam_noticias WHERE id_noticia = '" & id_noticia & "'")

    If rsVerificar.EOF Then
        ' Caso o registro não exista, insira um novo
        If upNoticia = 1 Then
            sql = "INSERT INTO cam_noticias (anexo_noticia) VALUES ('.\upNoticias\" & NomeArquivo1 & "')"
            conn.Execute(sql)
            
            ' Recupera o último ID inserido
            Set rs = conn.Execute("SELECT SCOPE_IDENTITY() AS newID")
            newID = rs("newID")
            rs.Close
            Set rs = Nothing
            
            ' Redireciona após o cadastro inicial
            Response.Redirect("cad-noticias.asp?id_noticia=" & newID)
        End If
    Else
        ' Caso o registro exista, altere-o
        caminhoFotoAntiga = rsVerificar("anexo_noticia")

        ' Apagar o arquivo antigo, se existir
        If caminhoFotoAntiga <> "" Then
            On Error Resume Next ' Ignora erro se o arquivo não existir
            Dim caminhoCompleto
            caminhoCompleto = Server.MapPath(caminhoFotoAntiga)
            If FileExists(caminhoCompleto) Then
                Dim fso
                Set fso = Server.CreateObject("Scripting.FileSystemObject")
                fso.DeleteFile(caminhoCompleto)
                Set fso = Nothing
            End If
            On Error GoTo 0 ' Retorna ao tratamento normal de erros
        End If
        
        ' Atualiza o registro com o novo arquivo
        If upNoticia = 1 Then
            sqlRestante = "anexo_noticia = '.\upNoticias\" & NomeArquivo1 & "'"
            sql = "UPDATE cam_noticias SET " & sqlRestante & " WHERE id_noticia = '" & id_noticia & "'"
            conn.Execute(sql)
            
            ' Redireciona após a atualização
            Response.Redirect("cad-noticias.asp?id_noticia=" & id_noticia)
        End If
    End If
    
    Call fechaConexao
End If

' Função para verificar se um arquivo existe
Function FileExists(filePath)
    Dim fso
    Set fso = Server.CreateObject("Scripting.FileSystemObject")
    FileExists = fso.FileExists(filePath)
    Set fso = Nothing
End Function
%>