<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%
Dim Operacao, id_historia, Form, sqlRestante, NomeArquivo1, upCidade
Operacao = Request("Operacao")
id_historia = Request("id_historia")

Set Form = New ASPForm
Server.ScriptTimeout = 1440 ' Limite de 24 minutos de execução de código

Const MaxFileSize = 1200000 ' Limite de 1,2 MB de arquivo

If Form.State = 0 Then
    For Each Key in Form.Texts.Keys
        If Key = "Operacao" Then
            Operacao = Form.Texts.Item(Key)
        End If
    Next
    
    upCidade = 0
    For Each Field in Form.Files.Items
        IF Field.Name = "upCidade" THEN
            ' Cria um nome único para o arquivo
            NomeArquivo1 = Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
            
            ' Salva o arquivo na pasta 'upHistoria'
            Field.SaveAs Server.MapPath("upHistoria") & "\" & NomeArquivo1
            upCidade = 1
        End If  
    Next

    ' Verificar se é uma inserção ou atualização
    Call abreConexao
    Dim rsVerificar, caminhoFotoAntiga
    Set rsVerificar = conn.Execute("SELECT UpCidade FROM cam_historia WHERE id_historia = '" & id_historia & "'")

    If rsVerificar.EOF Then
        ' Registro não existe, então vamos inserir um novo
        If upCidade = 1 Then
            sql = "INSERT INTO cam_historia (UpCidade) VALUES ('.\upHistoria\" & NomeArquivo1 & "')"
            'response.write sql
            'response.end
            conn.Execute(sql)
        End If
    Else
        ' Registro existe, então precisamos pegar o caminho da foto antiga para apagá-la
        caminhoFotoAntiga = rsVerificar("UpCidade")

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
        If upCidade = 1 Then
            sqlRestante = "UpCidade = '.\upHistoria\" & NomeArquivo1 & "'"
            sql = "UPDATE cam_historia SET " & sqlRestante & " WHERE id_historia = '" & id_historia & "'"
            conn.Execute(sql)
        End If
    End If

    ' Redirecionar após a operação
    Response.Redirect("cad-historia.asp?Resp=3&id_historia=" & id_historia)
    
    Call fechaConexao
End If

' Função para verificar se um arquivo existe
Function FileExists(filePath)
    Dim fso
    Set fso = Server.CreateObject("Scripting.FileSystemObject")
    FileExists = fso.FileExists(filePath)
End Function
%>