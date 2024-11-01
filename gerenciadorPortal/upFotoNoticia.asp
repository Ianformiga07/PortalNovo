<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%
Dim Operacao, id_historia, Form, sqlRestante, NomeArquivo1, upNoticia
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
            
            ' Salva o arquivo na pasta 'upHistoria'
            Field.SaveAs Server.MapPath("upNoticias") & "\" & NomeArquivo1
            upNoticia = 1
        End If  
    Next

    ' Verificar se é uma inserção ou atualização
    Call abreConexao
    Dim rsVerificar, caminhoFotoAntiga
    Set rsVerificar = conn.Execute("SELECT anexo_noticia FROM cam_noticias WHERE id_noticia = '" & id_noticia & "'")

    If rsVerificar.EOF Then
        ' Registro não existe, então vamos inserir um novo
        If upNoticia = 1 Then
            sql = "INSERT INTO cam_noticias (anexo_noticia) VALUES ('.\upNoticias\" & NomeArquivo1 & "')"
            'response.write sql
            'response.end
            conn.Execute(sql)
        End If
    Else
        ' Registro existe, então precisamos pegar o caminho da foto antiga para apagá-la
        caminhoFotoAntiga = rsVerificar("anexo_noticia")

        ' Apagar o arquivo antigo, se existir
        If caminhoFotoAntiga <> "" Then
            On Error Resume Next ' Ignora erro se o arquivo não existir
            Dim caminhoCompleto
            caminhoCompleto = Server.MapPath(caminhoFotoAntiga)
            If FileExists(caminhoCompleto) Then
                Set fso = Server.CreateObject("Scripting.FileSystemObject")
                fso.DeleteFile(caminhoCompleto)
            End If
            On Error GoTo 0 ' Retorna ao tratamento normal de erros
        End If
        
        ' Atualiza o registro com o novo arquivo
        If upNoticia = 1 Then
            sqlRestante = "anexo_noticia = '.\upNoticias\" & NomeArquivo1 & "'"
            sql = "UPDATE cam_noticias SET " & sqlRestante & " WHERE id_noticia = '" & id_noticia & "'"
            'response.write sql
            'response.end
            conn.Execute(sql)
        End If
    End If

    ' Redirecionar após a operação
    Response.Redirect("cad-noticias.asp?Resp=3&id_noticia=" & id_noticia)
    
    Call fechaConexao
End If

' Função para verificar se um arquivo existe
Function FileExists(filePath)
    Dim fso
    Set fso = Server.CreateObject("Scripting.FileSystemObject")
    FileExists = fso.FileExists(filePath)
End Function
%>