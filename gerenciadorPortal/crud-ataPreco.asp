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
                Case "id_ataPreco": id_ataPreco = Form.Texts.Item(Key)
                Case "ataCategoria": ataCategoria = Form.Texts.Item(Key)
                Case "numDoc": numDoc = Form.Texts.Item(Key)
                Case "dataPublicacao": dataPublicacao = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "descricao": descricao = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "statusAta": statusAta = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select
        Next

        ' Tratamento do arquivo enviado
        upAtaPreco = 0
        tituloOriginalupAtaPreco = ""

        For Each Field in Form.Files.Items
            If Field.Name = "upAtaPreco" Then
                ' Pegando o nome original do upAtaPreco
                tituloOriginalupAtaPreco = Split(Field.FileName, "\")(UBound(Split(Field.FileName, "\"))) ' Remove o caminho, mantendo apenas o nome
                
                ' Salvando o upAtaPreco com o nome original
                Field.SaveAs Server.MapPath("upAnexos") & "\" & tituloOriginalupAtaPreco
                upAtaPreco = 1
            End If  
        Next

    End If
    ' Exibindo ou armazenando o nome original
    ' Verifica se já existe um registro com o id_regimento informado
    Call abreConexao
    Dim rs_exist
    
    ' Trate id_regimento para evitar valores vazios ou não numéricos
    If IsEmpty(id_ataPreco) Or Not IsNumeric(id_ataPreco) Then
        id_ataPreco = 0 ' Define para 0 se vazio ou inválido
    End If


    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
        sql = "INSERT INTO cam_ataPreco (id_categoriaLeg, numDocumento, dataPublicacao, descricao, anexo_ataPreco, statusAtaPreco, id_usuCad, dataCad) " & _ 
      "VALUES ('" & ataCategoria & "', '" & numDoc & "', '" & dataPublicacao & "', '" & descricao & "', '" & tituloOriginalupAtaPreco & "', 1, " & Session("idUsu") & ", GETDATE())"
        'response.write sql
        'response.end
        conn.Execute(sql)
   
        ' Redireciona passando o ID na URL
        response.Redirect("list-ataPreco.asp?Resp=1")
    ElseIf Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_ataPreco SET id_categoriaLeg = '" & ataCategoria & "', numDocumento = '" & numDoc & "', dataPublicacao = '" & dataPublicacao & "', descricao = '" & descricao & "', " & _
              "statusAtaPreco = '" & statusAta & "', dataAlt = GETDATE(), id_UsuAlt = " & Session("idUsu")
        
        ' Apenas atualiza o arquivo se houver um novo upload
        If upAtaPreco = 1 Then
            sql = sql & ", anexo_ataPreco = '" & tituloOriginalupAtaPreco & "'"
        End If
        
        sql = sql & " WHERE id_ataPreco = " & id_ataPreco
        'response.write sql
        'response.end
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("cad-ataPreco.asp?Resp=2&id_ataPreco=" & id_ataPreco)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>