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
                Case "NumProcesso": NumProcesso = Form.Texts.Item(Key)
                Case "Procedimento": Procedimento = Form.Texts.Item(Key)
                Case "Modalidade": Modalidade = Form.Texts.Item(Key)
                Case "TipoLici": TipoLici = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "dataAbertura": dataAbertura = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "Finalidade": Finalidade = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "RegimeExec": RegimeExec = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "ValorEstimado": ValorEstimado = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "ValorDespesa": ValorDespesa = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "dataPublicacao": dataPublicacao = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "dataHomologa": dataHomologa = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "situacao": situacao = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "orgao": orgao = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "autoridade": autoridade = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "objeto": objeto = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "statusLici": statusLici = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "id_licitacao": id_licitacao = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select
        Next

        ' Tratamento do arquivo enviado
        arquivo = 0
        tituloOriginalArquivo = ""

        For Each Field in Form.Files.Items
            If Field.Name = "arquivo" Then
                ' Pegando o nome original do arquivo
                tituloOriginalArquivo = Split(Field.FileName, "\")(UBound(Split(Field.FileName, "\"))) ' Remove o caminho, mantendo apenas o nome
                
                ' Salvando o arquivo com o nome original
                Field.SaveAs Server.MapPath("upLicitacoes") & "\" & tituloOriginalArquivo
                arquivo = 1
            End If  
        Next
        'Response.Write "Título Original: " & tituloOriginalArquivo
        'response.end
    End If
    ' Exibindo ou armazenando o nome original
    ' Verifica se já existe um registro com o id_regimento informado
    Call abreConexao
    Dim rs_exist
    
    ' Trate id_regimento para evitar valores vazios ou não numéricos
    If IsEmpty(id_licitacao) Or Not IsNumeric(id_licitacao) Then
        id_licitacao = 0 ' Define para 0 se vazio ou inválido
    End If


    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
        sql = "INSERT INTO cam_licitacao (id_Autoridade, id_Orgao, id_Procedimento, id_modalidade, id_TipoLicitacao, id_finalidade, id_RegimeSituacao, id_Situacao, NumProceso, dataAbertura, dataHomologa, dataPublicacao, valorEstimado, valorDespesa, objeto, anexo_Lici, statusLicitacao, id_UsuCad, dataCad) " & _ 
      "VALUES ('" & autoridade & "', '" & orgao & "', '" & Procedimento & "', '" & Modalidade & "', '" & TipoLici & "', '" & Finalidade & "', '" & RegimeExec & "', '" & situacao & "', '" & NumProcesso & "', '" & dataAbertura & "', '" & dataHomologa & "', '" & dataPublicacao & "', '" & ValorEstimado & "', '" & ValorDespesa & "', '" & objeto & "', '" & tituloOriginalArquivo & "', 1, " & Session("idUsu") & ", GETDATE())"
        'response.write sql
        'response.end
        conn.Execute(sql)
   
        ' Redireciona passando o ID na URL
        response.Redirect("list-licitacao.asp?Resp=1")
    ElseIf Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_licitacao SET id_Autoridade = '" & autoridade & "', id_Orgao = '" & orgao & "', id_Procedimento = '" & Procedimento & "', id_modalidade = '" & Modalidade & "', id_TipoLicitacao = '" & TipoLici & "', id_finalidade = '" & Finalidade & "', id_RegimeSituacao = '" & RegimeExec & "', id_Situacao = '" & situacao & "', NumProceso = '" & NumProcesso & "', dataAbertura = '" & dataAbertura & "', dataHomologa = '" & dataHomologa & "', " & _
              "dataPublicacao = '" & dataPublicacao & "', valorEstimado = '" & valorEstimado & "', valorDespesa = '" & valorDespesa & "', objeto = '" & objeto & "', statusLicitacao = '" & statusLici & "', dataAlt = GETDATE(), id_UsuAlt = " & Session("idUsu")
        
        ' Apenas atualiza o arquivo se houver um novo upload
        If arquivo = 1 Then
            sql = sql & ", anexo_Lici = '" & tituloOriginalArquivo & "'"
        End If
        
        sql = sql & " WHERE id_licitacao = " & id_licitacao
        'response.write sql
        'response.end
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("cad-licitacao.asp?Resp=2&id_licitacao=" & id_licitacao)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>