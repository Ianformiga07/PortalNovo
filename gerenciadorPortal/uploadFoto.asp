<!--#include file ="lib/Conexao.asp"-->
<!--#include file="upload.lib.asp"-->

<%
Dim Operacao, id_servidor, Form, sqlRestante, NomeArquivo1, UpFoto
Operacao = Request("Operacao")
id_servidor = Request("id_servidor")
idAlt = REQUEST("idAlt")


Set Form = New ASPForm
Server.ScriptTimeout = 1440 ' Limite de 24 minutos de execução de código

Const MaxFileSize = 1200000 ' Limite de 1,2 Mb de arquivo

If Form.State = 0 Then
    For Each Key in Form.Texts.Keys
        If Key = "Operacao" Then
            Operacao = Form.Texts.Item(Key)
        End If
    Next
    
    UpFoto = 0
    For Each Field in Form.Files.Items
        IF Field.Name = "UpFoto" THEN
            ' Verifica o tamanho do arquivo
            'If Request.Files("UpFoto").TotalBytes > MaxFileSize Then
                'Response.Write("O arquivo é muito grande. O tamanho máximo é 1,2 MB.")
                'Response.End
            'End If
            
            ' Cria um nome único para o arquivo
            NomeArquivo1 = Year(Date) & Month(Date) & Day(Date) & Hour(Now) & Minute(Now) & Second(Now) & "." & Split(Field.FileName, ".")(UBound(Split(Field.FileName, ".")))
            
            ' Salva o arquivo na pasta 'upPerfil'
            Field.SaveAs Server.MapPath("upPerfil") & "\" & NomeArquivo1
            UpFoto = 1
        End If  
    Next
If Operacao = 4 Then ' ALTERAÇÃO
    Call abreConexao
    sqlRestante = ""

    ' Primeiro, obtenha a foto atual do banco de dados
    Dim fotoAtual
    sqlFotoAtual = "SELECT FotoPerfil FROM cam_servidores WHERE id_servidor = '" & id_servidor & "'"
    Set rsFoto = conn.Execute(sqlFotoAtual)

    If Not rsFoto.EOF Then
        fotoAtual = rsFoto("FotoPerfil")
    End If
    rsFoto.Close

    ' Se a foto atual existir e a operação de upload estiver habilitada
    If UpFoto = 1 Then
        ' 1. Remover a foto atual do banco de dados
        sqlDelete = "UPDATE cam_servidores SET FotoPerfil = NULL WHERE id_servidor = '" & id_servidor & "'"
        conn.Execute(sqlDelete)

        ' 2. Agora, inserir a nova foto
        sqlRestante = sqlRestante & ", FotoPerfil = '.\upPerfil\" & NomeArquivo1 & "' "
    End If 

    ' Executa a atualização
    sql = "UPDATE cam_servidores SET " & Mid(sqlRestante, 3) & " WHERE id_servidor = '" & id_servidor & "'"
    'response.write sql
    'response.end
    conn.execute(sql)
    
    if idAlt <> 1 then
    ' Redireciona para a página de administração após o processo de inserção e exclusão
    response.Redirect("cad-administrador.asp?Resp=1&idServidor=" & id_servidor)	
    else
    response.Redirect("cad-administrador.asp?Resp=2&idAlt=1&idServidor=" & id_servidor) 
    end if	

    Call fechaConexao
End If
End If
%>