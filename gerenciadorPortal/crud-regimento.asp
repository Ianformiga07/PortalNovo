<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%
' Certifique-se de inicializar o objeto ASPForm corretamente
Dim Form, Operacao, title, description, UpRegimento, NomeArquivo1, id_regimento

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
                Case "id_regimento": id_regimento = Form.Texts.Item(Key) ' Captura o ID para alteração
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

    ' Verifica se já existe um registro com o id_regimento informado
    Call abreConexao
    Dim rs_exist
    
    ' Trate id_regimento para evitar valores vazios ou não numéricos
    If IsEmpty(id_regimento) Or Not IsNumeric(id_regimento) Then
        id_regimento = 0 ' Define para 0 se vazio ou inválido
    End If

    sql = "SELECT COUNT(*) AS total FROM cam_regimento WHERE id_regimento = " & id_regimento
    Set rs_exist = conn.Execute(sql)
    
    If rs_exist("total") > 0 Then
        ' Registro já existe, define operação como "alteração"
        Operacao = 3
    Else
        ' Registro não existe, define operação como "inserção"
        Operacao = 2
    End If
    rs_exist.Close
    Set rs_exist = Nothing

    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
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
        response.Redirect("regimento.asp?Resp=1&id_regimento=" & newID)
    ElseIf Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_regimento SET titulo = '" & title & "', descricao = '" & description & "', " & _
              "data_Alt = GETDATE(), idUsu_Alt = " & Session("idUsu")
        
        ' Apenas atualiza o arquivo se houver um novo upload
        If UpRegimento = 1 Then
            sql = sql & ", anexo_regimento = '" & NomeArquivo1 & "'"
        End If
        
        sql = sql & " WHERE id_regimento = " & id_regimento
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("regimento.asp?Resp=2&id_regimento=" & id_regimento)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>