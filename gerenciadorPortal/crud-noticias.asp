<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%

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
                Case "id_noticia": id_noticia = Form.Texts.Item(Key)
                Case "titulo": titulo = Form.Texts.Item(Key)
                Case "subtitulo": subtitulo = Form.Texts.Item(Key)
                Case "editor1": editor1 = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "autor": autor = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "statusNoticia": statusNoticia = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "editor1": editor1 = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select


        Next
        ' Tratamento do arquivo enviado para Foto da Cidade
        upNoticia = 0
        For Each Field in Form.Files.Items
            If Field.Name = "upNoticia" Then
                NomeArquivoNoticia = "Noticia_" & Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
                Field.SaveAs Server.MapPath("upNoticia") & "\" & NomeArquivoNoticia
                upNoticia = 1
            End If  
        Next
    End If

    ' Verifica se já existe um registro com o id_regimento informado
    Call abreConexao
    Dim rs_exist
    
    ' Trate id_regimento para evitar valores vazios ou não numéricos
    If IsEmpty(id_noticia) Or Not IsNumeric(id_noticia) Then
        id_noticia = 0 ' Define para 0 se vazio ou inválido
    End If


    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
        sql = "INSERT INTO cam_noticias (titulo, subtitulo, conteudo, autor, anexo_noticia, statusNoticia, dataCad, idUsu_Cad) " & _
              "VALUES ('" & titulo & "', '" & subtitulo & "', '" & editor1 & "', '" & autor & "', '" & NomeArquivoNoticia & "', 1, GETDATE(), '" & session("idUsu") & "')"
        'response.write sql
        'response.end
        
        conn.Execute(sql)

        ' Recupera o último ID inserido
        Set rs = conn.Execute("SELECT SCOPE_IDENTITY() AS newID")
        Dim newID
        newID = rs("newID")
        rs.Close
        Set rs = Nothing
        
        ' Redireciona passando o ID na URL
        response.Redirect("list-noticias.asp?Resp=1")
    ElseIf Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_noticias SET titulo = '" & titulo & "', subtitulo = '" & subtitulo & "', " & _
            "conteudo = '" & editor1 & "', autor = '" & autor & "', " & _
            "statusNoticia = '" & statusNoticia & "', dataAlt = GETDATE(), idUsu_Alt = " & Session("idUsu")
        
        ' Apenas atualiza o arquivo de "Foto da Cidade" se houver um novo upload
        If upNoticia = 1 Then
            sql = sql & ", upNoticia = '" & NomeArquivoNoticia & "'"
        End If
        
        sql = sql & " WHERE id_noticia = " & id_noticia
        'response.write sql
        'response.end        
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("cad-noticias.asp?Resp=2&id_noticia=" & id_noticia)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>