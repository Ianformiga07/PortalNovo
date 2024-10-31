<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%
' Certifique-se de inicializar o objeto ASPForm corretamente
Dim Form, Operacao, title, description, UpRegimento, NomeArquivo1, idRegimento

' Instanciando o objeto ASPForm para captura de dados
Set Form = New ASPForm

' Verifique se o objeto foi instanciado corretamente
If IsObject(Form) Then
    Server.ScriptTimeout = 1440 ' Limite de 24 minutos de execução de código
    Const MaxFileSize = 1200000 ' Limite de 1,2 Mb de arquivo

    If Form.State = 0 Then
        ' Lendo os campos de texto
        For Each Key in Form.Texts.Keys
            Select Case Key
                Case "Operacao": Operacao = Form.Texts.Item(Key)
                Case "title": title = Form.Texts.Item(Key)
                Case "description": description = Form.Texts.Item(Key)
                Case "idRegimento": idRegimento = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select
        Next

        ' Tratamento do arquivo enviado
        UpRegimento = 0
        For Each Field in Form.Files.Items
            If Field.Name = "UpRegimento" Then
                NomeArquivo1 = Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
                Field.SaveAs Server.MapPath("upAnexos") & "\" & NomeArquivo1
                UpRegimento = 1
            End If  
        Next
    End If

    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
        Call abreConexao
        
        ' Executa a inserção
        sql = "INSERT INTO cam_regimento (titulo, descricao, anexo_regimento, data_cad, idUsu_Cad) " & _
            "VALUES ('" & title & "', '" & description & "', '" & NomeArquivo1 & "', GETDATE(), " & Session("idUsu") & ")"
        conn.Execute(sql)

        ' Recupera o último ID inserido
        Set rs = conn.Execute("SELECT SCOPE_IDENTITY() AS newID")
        Dim newID
        newID = rs("newID")
        rs.Close
        Set rs = Nothing
        
        ' Redireciona passando o ID na URL
        response.Redirect("regimento.asp?Resp=1&idRegimento=" & newID)
        Call fechaConexao
    ElseIf Operacao = 3 And Not IsEmpty(idRegimento) Then
        ' Atualização
        Call abreConexao
        sql = "UPDATE cam_regimento SET titulo = '" & title & "', descricao = '" & description & "', " & _
              "data_cad = GETDATE(), idUsu_Cad = " & Session("idUsu")
        
        ' Apenas atualiza o arquivo se houver um novo upload
        If UpRegimento = 1 Then
            sql = sql & ", anexo_regimento = '" & NomeArquivo1 & "'"
        End If
        
        sql = sql & " WHERE idRegimento = " & idRegimento
        response.write sql ' Verifica a consulta SQL
        response.end
        conn.execute(sql)
        Call fechaConexao
    End If
End If

' Limpeza do objeto
Set Form = Nothing
%>