<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->
<% Response.CodePage = 65001 %>
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
                Case "id_servidor": id_servidor = Form.Texts.Item(Key)
                Case "apelido": apelido = Form.Texts.Item(Key)
                Case "partido": partido = Form.Texts.Item(Key)
                Case "ocupacao": ocupacao = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "statusVereador": statusVereador = Form.Texts.Item(Key) ' Captura o ID para alteração
                Case "IdVereador": IdVereador = Form.Texts.Item(Key) ' Captura o ID para alteração
            End Select
        Next
        ' Tratamento do arquivo enviado para Foto da Cidade
        upVereadorbt = 0
        For Each Field in Form.Files.Items
            If Field.Name = "upVereadorbt" Then
                NomeArquivoVereador = "vereador" & Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
                Field.SaveAs Server.MapPath("upVereador") & "\" & NomeArquivoVereador
                upVereadorbt = 1
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

    sql = "SELECT COUNT(*) AS total FROM cam_vereador WHERE Id_Vereador = " & IdVereador
    'response.write sql
    'response.end
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

    If Operacao = 3 Then
        ' Atualização
        sql = "UPDATE cam_vereador SET apelido = '" & apelido & "', partido = '" & partido & "', " & _
            "ocupacao = '" & ocupacao & "', statusVereador = '"& statusVereador &"'"
        
        ' Apenas atualiza o arquivo de "Foto da Cidade" se houver um novo upload
        If upVereadorbt = 1 Then
            sql = sql & ", fotoVereador = '" & NomeArquivoVereador & "'"
        End If
    
        sql = sql & " WHERE Id_Vereador = " & IdVereador
        'response.write sql
        'response.end
        conn.Execute(sql)
        
        ' Redireciona com mensagem de sucesso
        response.Redirect("sel-mandatovereador.asp?Resp=2&cod=1&IdVereador="&IdVereador)
    End If

    Call fechaConexao
End If

' Limpeza do objeto
Set Form = Nothing
%>