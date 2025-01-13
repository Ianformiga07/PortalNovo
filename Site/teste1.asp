<!--#include file ="lib/Conexao.asp"-->
<%
call abreConexao
protocolo = Request.Form("protocolo")
If protocolo <> "" Then
    ' Consulta SQL para buscar o protocolo no banco de dados
    sql = "SELECT protocolo FROM cam_manifestacao WHERE protocolo = '" & Replace(protocolo, "'", "''") & "'"
    Set rs_resposta = conn.Execute(sql)

    If Not rs_resposta.EOF Then
        protocolo = rs_resposta("protocolo")
    Else
        protocolo = "Não encontrado"
    End If
End If
call fechaConexao
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Manifestação</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Consultar Manifestação</h2>
        <p>Insira o número do protocolo e consulte o andamento da sua manifestação</p>
        <form method="post">
            <label for="protocolo">Número de Protocolo</label>
            <input type="text" id="protocolo" name="protocolo" class="form-control" placeholder="Digite o número do protocolo">
            <button type="submit" class="btn btn-primary mt-3">Consultar</button>
        </form>
    </div>

    <% If protocolo <> "" Then %>
        <!-- Modal para exibir as informações -->
        <div class="modal fade show" tabindex="-1" role="dialog" style="display: block;">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Detalhes da Manifestação</h5>
                    </div>
                    <div class="modal-body">
                        <p><strong>Número do Protocolo:</strong> <%= protocolo %></p>
                    </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-secondary">Fechar</a>
                    </div>
                </div>
            </div>
        </div>
    <% End If %>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>