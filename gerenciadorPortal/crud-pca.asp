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
                Case "id_pca": id_pca = Form.Texts.Item(Key)
                Case "pcaCategoria": pcaCategoria = Form.Texts.Item(Key)
                Case "numDoc": numDoc = Form.Texts.Item(Key)
                Case "dataPublicacao": dataPublicacao = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "descricaoPCA": descricaoPCA = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "statusPCA": statusPCA = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select
        Next

        ' Tratamento do arquivo enviado
        upPCA = 0
        tituloOriginalupPCA = ""

        For Each Field in Form.Files.Items
            If Field.Name = "upPCA" Then
                ' Pegando o nome original do upPCA
                tituloOriginalupPCA = Split(Field.FileName, "\")(UBound(Split(Field.FileName, "\"))) ' Remove o caminho, mantendo apenas o nome
                
                ' Salvando o upPCA com o nome original
                Field.SaveAs Server.MapPath("upAnexos") & "\" & tituloOriginalupPCA
                upPCA = 1
            End If  
        Next

    End If
    ' Exibindo ou armazenando o nome original
    ' Verifica se já existe um registro com o id_regimento informado
    Call abreConexao
    Dim rs_exist
    
    ' Trate id_regimento para evitar valores vazios ou não numéricos
    If IsEmpty(id_pca) Or Not IsNumeric(id_pca) Then
        id_pca = 0 ' Define para 0 se vazio ou inválido
    End If


    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
        sql = "INSERT INTO cam_pca (id_categoriaLeg, numDocumento, dataPublicacao, descricaoPCA, upPCA, statusPCA, id_usuCad, dataCad) " & _ 
      "VALUES ('" & pcaCategoria & "', '" & numDoc & "', '" & dataPublicacao & "', '" & descricaoPCA & "', '" & tituloOriginalupPCA & "', 1, " & Session("idUsu") & ", GETDATE())"
        'response.write sql
        'response.end
        conn.Execute(sql)
   
        ' Redireciona passando o ID na URL
        response.Redirect("list-pca.asp?Resp=1")
    ElseIf Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_pca SET id_categoriaLeg = '" & pcaCategoria & "', numDocumento = '" & numDoc & "', dataPublicacao = '" & dataPublicacao & "', descricaoPCA = '" & descricaoPCA & "', " & _
              "statusPCA = '" & statusPCA & "', dataAlt = GETDATE(), id_UsuAlt = " & Session("idUsu")
        
        ' Apenas atualiza o arquivo se houver um novo upload
        If upPCA = 1 Then
            sql = sql & ", upPCA = '" & tituloOriginalupPCA & "'"
        End If
        
        sql = sql & " WHERE id_pca = " & id_pca
        'response.write sql
        'response.end
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("cad-pca.asp?Resp=2&id_pca=" & id_pca)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>