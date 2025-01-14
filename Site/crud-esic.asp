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
                Case "tipoManifestacao": tipoManifestacao = Form.Texts.Item(Key)
                Case "nome": nome = Form.Texts.Item(Key) 
                Case "cpf": cpf = Form.Texts.Item(Key) 
                Case "dataNasc": dataNasc = Form.Texts.Item(Key)
                Case "sexo": sexo = Form.Texts.Item(Key)
                Case "Escolaridade": Escolaridade = Form.Texts.Item(Key)
                Case "formaRecebimento": formaRecebimento = Form.Texts.Item(Key)
                Case "email": email = Form.Texts.Item(Key) 
                Case "telefone": telefone = Form.Texts.Item(Key) 
                Case "descricao": descricao = Form.Texts.Item(Key) 
            End Select
        Next

        ' Tratamento do arquivo enviado
        upEsic = 0
        novoNomeupEsic = ""

        For Each Field in Form.Files.Items
            If Field.Name = "upEsic" Then
                extensao = Right(Field.FileName, Len(Field.FileName) - InStrRev(Field.FileName, "."))
                novoNomeupEsic = "arquivo_" & Year(Now) & Month(Now) & Day(Now) & "_" & Hour(Now) & Minute(Now) & Second(Now) & "." & extensao
                Field.SaveAs Server.MapPath("upOuvidoria") & "\" & novoNomeupEsic
                upEsic = 1
            End If  
        Next
    End If

    ' Obter milissegundos
    Dim milisegundos
    milisegundos = Right("00" & Timer * 1000 Mod 1000, 3) ' Pega os milissegundos do Timer atual

    ' Montar o protocolo sem espaços
    protocolo = "ESIC-" & Right("0" & Day(Now), 2) & Right("0" & Hour(Now), 2) & Right("0" & Minute(Now), 2) & Right("0" & Second(Now), 2) & milisegundos

    ' Conexão com o banco de dados
    Call abreConexao

    If Operacao = 2 Then
        sql = "INSERT INTO cam_esic ( id_tipoEsic, anonimo, nome, cpf, datanasc, sexo, id_escolaridade, telefone, formaRecebimento, email, descricaoEsic, anexoEsic, protocolo, dataCad) " & _ 
              "VALUES ('" & tipoManifestacao & "', 0, '" & nome & "', '" & cpf & "', '" & dataNasc & "', '" & sexo & "', '" & Escolaridade & "', '" & telefone & "','" & formaRecebimento & "', '" & email & "', '" & descricao & "', '" & novoNomeupEsic & "', '" & protocolo & "', GETDATE())"
        'response.write sql
        'response.end
        conn.Execute(sql)
   
        ' Redireciona passando o protocolo na URL
        response.Redirect("e-sic.asp?Resp=1&protocolo=" & protocolo)
    End If

    Call fechaConexao
End If

Set Form = Nothing
%>