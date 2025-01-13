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
                Case "CatLegislacao": CatLegislacao = Form.Texts.Item(Key)
                Case "numeroDoc": numeroDoc = Form.Texts.Item(Key)
                Case "dataPublicacao": dataPublicacao = Form.Texts.Item(Key)
                Case "descricao": descricao = Form.Texts.Item(Key)
                Case "verAutor": verAutor = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "statusLeg": statusLeg = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "id_legislacao": id_legislacao = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select
        Next

        ' Tratamento do arquivo enviado
        arquivoLeg = 0
        For Each Field in Form.Files.Items
            If Field.Name = "arquivoLeg" Then
                NomeArquivo1 = Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
                Field.SaveAs Server.MapPath("upAnexos") & "\" & NomeArquivo1
                arquivoLeg = 1
            End If  
        Next
    End If

    ' Verifica se já existe um registro com o id_regimento informado
    Call abreConexao
    Dim rs_exist
    
    ' Trate id_regimento para evitar valores vazios ou não numéricos
    If IsEmpty(id_legislacao) Or Not IsNumeric(id_legislacao) Then
        id_legislacao = 0 ' Define para 0 se vazio ou inválido
    End If


    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
        sql = "INSERT INTO cam_legislacao (id_categoriaLeg, numeroDoc, dataPublicacao, descricao, anexo_legislacao, id_AutorVer, status_Leg, dataCad, idUsu_Cad) " & _
              "VALUES ('" & CatLegislacao & "', '" & numeroDoc & "', '" & dataPublicacao & "', '" & descricao & "', '" & NomeArquivo1 & "', '" & verAutor & "', 1, GETDATE(), " & Session("idUsu") & ")"
              'response.write sql
              'response.end
        conn.Execute(sql)
   
        ' Redireciona passando o ID na URL
        response.Redirect("list-legislacao.asp?Resp=1")
    ElseIf Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_legislacao SET id_categoriaLeg = '" & CatLegislacao & "', numeroDoc = '" & numeroDoc & "', dataPublicacao = '" & dataPublicacao & "', descricao = '" & descricao & "', id_AutorVer = '" & verAutor & "', status_Leg = '" & statusLeg & "', " & _
              "dataAlt = GETDATE(), idUsu_Alt = " & Session("idUsu")
        
        ' Apenas atualiza o arquivo se houver um novo upload
        If arquivoLeg = 1 Then
            sql = sql & ", anexo_legislacao = '" & NomeArquivo1 & "'"
        End If
        
        sql = sql & " WHERE id_legislacao = " & id_legislacao
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("cad-legislacao.asp?Resp=2&id_legislacao=" & id_legislacao)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>