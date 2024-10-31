<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%
Dim Operacao, id_historia, Form, sqlRestante, NomeArquivo1, upBrasao
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
    
    upBrasao = 0
    For Each Field in Form.Files.Items
        IF Field.Name = "upBrasao" THEN
            ' Cria um nome único para o arquivo
            NomeArquivo1 = Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
            
            ' Salva o arquivo na pasta 'upHistoria'
            Field.SaveAs Server.MapPath("upBrasao") & "\" & NomeArquivo1
            upBrasao = 1
        End If  
    Next

    If Operacao = 4 Then
        ' Abre a conexão
        Call abreConexao
        If conn Is Nothing Then
            Response.Write("Erro: Conexão com o banco de dados não foi estabelecida.")
            Response.End
        End If

        ' Verifica se id_historia possui valor
        If id_historia = "" Then
            Response.Write("Erro: id_historia está vazio.")
            Response.End
        End If

        ' Consulta para verificar se o registro existe
        Dim rsVerificar, caminhoFotoAntiga
        Set rsVerificar = conn.Execute("SELECT UpBrasao FROM cam_historia WHERE id_historia = '" & id_historia & "'")

        ' Confirma se o Recordset retornou dados
        If rsVerificar.EOF Then
            ' Registro não existe, insere um novo
            If upBrasao = 1 Then
                sql = "INSERT INTO cam_historia (UpBrasao) VALUES ('.\upBrasao\" & NomeArquivo1 & "')"
                conn.Execute(sql)
            End If
        Else
            ' Registro existe, apaga a foto antiga, se houver
            caminhoFotoAntiga = rsVerificar("UpBrasao")
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
            If upBrasao = 1 Then
                sqlRestante = "UpBrasao = '.\upBrasao\" & NomeArquivo1 & "'"
                sql = "UPDATE cam_historia SET " & sqlRestante & " WHERE id_historia = '" & id_historia & "'"
                conn.Execute(sql)
            End If
        End If
    End If

    ' Redirecionar após a operação
    Response.Redirect("cad-historia.asp?Resp=4&id_historia=" & id_historia)
    
    Call fechaConexao
End If

' Função para verificar se um arquivo existe
Function FileExists(filePath)
    Dim fso
    Set fso = Server.CreateObject("Scripting.FileSystemObject")
    FileExists = fso.FileExists(filePath)
End Function
%>