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
                Case "licitacao": licitacao = Form.Texts.Item(Key)
                Case "numContrato": numContrato = Form.Texts.Item(Key)
                Case "inicioVigencia": inicioVigencia = Form.Texts.Item(Key) 
                Case "fimVigencia": fimVigencia = Form.Texts.Item(Key) 
                Case "valorEstimado": valorEstimado = Form.Texts.Item(Key) 
                Case "fornecedor": fornecedor = Form.Texts.Item(Key) 
                Case "fiscal": fiscal = Form.Texts.Item(Key) 
                Case "DescContrato": DescContrato = Form.Texts.Item(Key) 
                Case "statusContrato": statusContrato = Form.Texts.Item(Key) 
                Case "id_contrato": id_contrato = Form.Texts.Item(Key) 
            End Select
        Next

        ' Tratamento do arquivo enviado
        arquivoContrato = 0
        tituloOriginalContrato = ""

        For Each Field in Form.Files.Items
            If Field.Name = "arquivoContrato" Then
                ' Pegando o nome original do arquivo
                tituloOriginalContrato = Split(Field.FileName, "\")(UBound(Split(Field.FileName, "\"))) ' Remove o caminho, mantendo apenas o nome
                
                ' Salvando o arquivo com o nome original
                Field.SaveAs Server.MapPath("upAnexos") & "\" & tituloOriginalContrato
                arquivo = 1
            End If  
        Next

    End If

        'response.write tituloOriginalContrato
        'response.end

    Call abreConexao
    Dim rs_exist
    
    ' Trate id_regimento para evitar valores vazios ou não numéricos
    If IsEmpty(id_licitacao) Or Not IsNumeric(id_licitacao) Then
        id_licitacao = 0 ' Define para 0 se vazio ou inválido
    End If


    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
        sql = "INSERT INTO cam_contratos (id_licitacao, numContrato, inicioVigencia, fimVigencia, valorEstimado, id_forncedor, id_fiscal, descricao, anexoContrato, statusContrato, id_UsuCad, dataCad) " & _ 
        "VALUES ('" & licitacao & "', '" & numContrato & "', '" & inicioVigencia & "', '" & fimVigencia & "', '" & valorEstimado & "', '" & fornecedor & "', '" & fiscal & "', '" & DescContrato & "', '" & tituloOriginalContrato & "', 1, " & Session("idUsu") & ", GETDATE())"
        'response.write sql
        'response.end        
        conn.Execute(sql)
   
        ' Redireciona passando o ID na URL
        response.Redirect "list-contratos.asp?Resp=1"
    ElseIf Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_contratos SET id_Licitacao = '" & id_Licitacao & "', titulo = '" & titulo & "', " & _
              "statusAnexos = '" & statusAnexos & "', dataAlt = GETDATE(), id_UsuAlt = " & Session("idUsu")

        ' Apenas atualiza o arquivo se houver um novo upload
        If arquivoliciAnexos = 1 Then
            sql = sql & ", LiciAnexos = '" & tituloOriginalArquivo & "'"
        End If
        
        sql = sql & " WHERE id_LiciAnexo = " & id_LiciAnexo
        'response.write sql
        'response.end
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("cad-liciAnexo.asp?Resp=2&id_LiciAnexo=" & id_LiciAnexo &"&id="&id_licitacao)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>