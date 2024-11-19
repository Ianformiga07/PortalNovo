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
                Case "titulo": titulo = Form.Texts.Item(Key)
                Case "statusAnexos": statusAnexos = Form.Texts.Item(Key)
                Case "id_licitacao": id_licitacao = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select
        Next

        ' Tratamento do arquivo enviado
        arquivoliciAnexos = 0
        tituloOriginalArquivo = ""

        For Each Field in Form.Files.Items
            If Field.Name = "arquivoliciAnexos" Then
                ' Pegando o nome original do arquivo e sua extensão
                Dim fileExtension
                fileExtension = "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))

                ' Definindo o novo nome do arquivo como o título com a mesma extensão
                tituloOriginalArquivo = titulo & fileExtension
                
                ' Salvando o arquivo com o novo nome
                Field.SaveAs Server.MapPath("upLicitacoes") & "\" & tituloOriginalArquivo
                arquivoliciAnexos = 1
            End If  
        Next

    End If

        response.write Operacao
        response.end

    Call abreConexao
    Dim rs_exist
    
    ' Trate id_regimento para evitar valores vazios ou não numéricos
    If IsEmpty(id_licitacao) Or Not IsNumeric(id_licitacao) Then
        id_licitacao = 0 ' Define para 0 se vazio ou inválido
    End If


    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
        sql = "INSERT INTO cam_anexosLicitacao (id_Licitacao, titulo, LiciAnexos, statusAnexos, id_UsuCad, dataCad) " & _ 
      "VALUES ('" & id_licitacao & "', '" & titulo & "', '" & tituloOriginalArquivo & "', 1, " & Session("idUsu") & ", GETDATE())"
        conn.Execute(sql)
   
        ' Redireciona passando o ID na URL
        response.Redirect "cad-liciAnexo.asp?Resp=1&id=" & id_licitacao
    ElseIf Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_licitacao SET id_Licitacao = '" & id_Licitacao & "', titulo = '" & titulo & "', " & _
              "statusAnexos = '" & statusAnexos & "', dataAlt = GETDATE(), id_UsuAlt = " & Session("idUsu")

        ' Apenas atualiza o arquivo se houver um novo upload
        If arquivoliciAnexos = 1 Then
            sql = sql & ", LiciAnexos = '" & tituloOriginalArquivo & "'"
        End If
        
        sql = sql & " WHERE id_LiciAnexo = " & id_LiciAnexo
        response.write sql
        response.end
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("cad-liciAnexo.asp?Resp=2&id_LiciAnexo=" & id_LiciAnexo &"&id="&id_LiciAnexo)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>