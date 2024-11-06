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
                Case "anoFundacao": anoFundacao = Form.Texts.Item(Key)
                Case "diaAniversario": diaAniversario = Form.Texts.Item(Key)
                Case "mesAniversario": mesAniversario = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "populacao": populacao = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "area": area = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "editor1": editor1 = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select
        Next

        ' Tratamento do arquivo enviado
        upCidade = 0
        For Each Field in Form.Files.Items
            If Field.Name = "upCidade" Then
                NomeArquivo1 = Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
                Field.SaveAs Server.MapPath("upAnexos") & "\" & NomeArquivo1
                upCidade = 1
            End If  
        Next
    End If

    ' Verifica se já existe um registro com o id_regimento informado
    Call abreConexao
    Dim rs_exist
    
    ' Trate id_regimento para evitar valores vazios ou não numéricos
    If IsEmpty(id_historia) Or Not IsNumeric(id_historia) Then
        id_historia = 0 ' Define para 0 se vazio ou inválido
    End If

    sql = "SELECT COUNT(*) AS total FROM cam_historia WHERE id_historia = " & id_historia
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
        sql = "INSERT INTO cam_historia (anoFundacao, populacao, area, conteudo, UpCidade, diaAniversario, mesAniversario, idUsu_Cad, dataCad) " & _
              "VALUES (" & anoFundacao & ", " & populacao & ", " & area & ", '" & editor1 & "', '" & NomeArquivo1 & "', " & diaAniversario & ", '" & mesAniversario & "', '" & session("idUsu") & "', GETDATE())"
        response.write sql
        response.end
        
        conn.Execute(sql)

        ' Recupera o último ID inserido
        Set rs = conn.Execute("SELECT SCOPE_IDENTITY() AS newID")
        Dim newID
        newID = rs("newID")
        rs.Close
        Set rs = Nothing
        
        ' Redireciona passando o ID na URL
        response.Redirect("regimento.asp?Resp=1&id_historia=" & newID)
    ElseIf Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_regimento SET titulo = '" & title & "', descricao = '" & description & "', " & _
              "data_Alt = GETDATE(), idUsu_Alt = " & Session("idUsu")
        
        ' Apenas atualiza o arquivo se houver um novo upload
        If UpRegimento = 1 Then
            sql = sql & ", anexo_regimento = '" & NomeArquivo1 & "'"
        End If
        
        sql = sql & " WHERE id_historia = " & id_historia
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("regimento.asp?Resp=2&id_historia=" & id_historia)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>