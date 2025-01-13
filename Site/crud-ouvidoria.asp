<!--#include file="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%
Dim Form, Operacao, title, description, UpRegimento, NomeArquivo1, id_regimento

' Instanciando o objeto ASPForm para captura de dados
Set Form = New ASPForm

If IsObject(Form) Then
    Server.ScriptTimeout = 1440 ' Limite de 24 minutos de execução de código
    Const MaxFileSize = 1200000 ' Limite de 1,2 Mb de arquivo

    If Form.State = 0 Then
        ' Lendo os campos de texto
        For Each Key in Form.Texts.Keys
            Select Case Key
                Case "Operacao": Operacao = Form.Texts.Item(Key)
                Case "id_tipoManifestacao": id_tipoManifestacao = Form.Texts.Item(Key)
                Case "anonimo": anonimo = Form.Texts.Item(Key)
                Case "recebimento": recebimento = Form.Texts.Item(Key)
                Case "email": email = Form.Texts.Item(Key) 
                Case "cpf": cpf = Form.Texts.Item(Key) 
                Case "nome": nome = Form.Texts.Item(Key) 
                Case "telefone": telefone = Form.Texts.Item(Key) 
                Case "manifestacao": manifestacao = Form.Texts.Item(Key) 
            End Select
        Next

        ' Tratamento do arquivo enviado
        anexo = 0
        novoNomeAnexo = ""

        For Each Field in Form.Files.Items
            If Field.Name = "anexo" Then
                extensao = Right(Field.FileName, Len(Field.FileName) - InStrRev(Field.FileName, "."))
                novoNomeAnexo = "arquivo_" & Year(Now) & Month(Now) & Day(Now) & "_" & Hour(Now) & Minute(Now) & Second(Now) & "." & extensao
                Field.SaveAs Server.MapPath("upOuvidoria") & "\" & novoNomeAnexo
                anexo = 1
            End If  
        Next
    End If

    ' Obter milissegundos
    Dim milisegundos
    milisegundos = Right("00" & Timer * 1000 Mod 1000, 3) ' Pega os milissegundos do Timer atual

    ' Montar o protocolo sem espaços
    protocolo = "PRT-" & Right("0" & Day(Now), 2) & Right("0" & Hour(Now), 2) & Right("0" & Minute(Now), 2) & Right("0" & Second(Now), 2) & milisegundos

    ' Conexão com o banco de dados
    Call abreConexao

    If Operacao = 2 Then
        sql = "INSERT INTO cam_manifestacao (id_tipoManifestacao, anonimo, formaRecebimento, email, cpf, nome, telefone, anexo, textoManifestacao, protocolo, dataCad) " & _ 
              "VALUES ('" & id_tipoManifestacao & "', '" & anonimo & "', '" & recebimento & "', '" & email & "', '" & cpf & "', '" & nome & "', '" & telefone & "', '" & novoNomeAnexo & "','" & manifestacao & "', '" & protocolo & "', GETDATE())"
        'response.write sql
        'response.end
        conn.Execute(sql)
   
        ' Redireciona passando o protocolo na URL
        response.Redirect("ouvidoria.asp?Resp=1&protocolo=" & protocolo)
    End If

    Call fechaConexao
End If

Set Form = Nothing
%>