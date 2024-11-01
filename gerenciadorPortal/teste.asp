<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%
' Certifique-se de inicializar o objeto ASPForm corretamente
Dim Form, Operacao, title, description, UpRegimento, NomeArquivo1, id_regimento
id_diario = Request("id_diario")

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
                Case "statusDiario": statusDiario = Form.Texts.Item(Key)
                Case "id_diario": id_diario = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select
        Next

        ' Tratamento do arquivo enviado
        upDiario = 0
        For Each Field in Form.Files.Items
            If Field.Name = "upDiario" Then
                NomeArquivo1 = Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
                Field.SaveAs Server.MapPath("upAnexos") & "\" & NomeArquivo1
                upDiario = 1
            End If  
        Next
    End If



    ' Insere ou atualiza o registro no banco de dados
    If Operacao = 2 Then
        ' Inserção
        sql = "INSERT INTO cam_diarioOfi (titulo, anexo_diario, status_diario, dataCad, idUsu_Cad) " & _
              "VALUES ('" & titulo & "', '" & NomeArquivo1 & "', '" & statusDiario & "',  GETDATE(), " & Session("idUsu") & ")"
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
        response.Redirect("cad-diario.asp?Resp=1&id_diario=" & newID)
    end if
    If Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_diarioOfi SET titulo = '" & titulo & "', status_diario = '" & statusDiario & "', " & _
            "dataAlt = GETDATE(), idUsu_Alt = " & Session("idUsu")

        ' Verifica se há um novo upload e adiciona o campo ao SQL
        If upDiario = 1 And NomeArquivo1 <> "" Then
            sql = sql & ", anexo_diario = '" & NomeArquivo1 & "'"
        End If

        sql = sql & " WHERE id_diario = " & id_diario

        response.write sql
        response.end
        ' Executa o comando SQL
        conn.Execute(sql)

        ' Redireciona com mensagem de sucesso
        response.Redirect("cad-diario.asp?Resp=2&id_diario=" & id_diario)
    End If
    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>