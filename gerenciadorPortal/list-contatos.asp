<!--#include file="base.asp"-->
<%
  call abreConexao
  sql = "SELECT id_Contato, nomeCompleto, email, assunto, mensagem, data_envio, visualizado FROM cam_contatoSite ORDER BY id_Contato DESC"
  set rs_mensagens = conn.execute(sql)
%>

<!-- Content Wrapper -->
<div class="content-wrapper">
  <!-- Content Header -->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-envelope text-blue"></i> Mensagens Recebidas
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li>
          <span class="font-w-600">Mensagens Recebidas</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Lista de Mensagens</h3>
          </div>
          <div class="box-body table-responsive">
            <table id="example2" class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Nome</th>
                  <th>Assunto</th>
                  <th>Data de Envio</th>
                  <th>Status</th>
                  <th>Ação</th>
                </tr>
              </thead>
              <tbody>
                <% 
                If Not rs_mensagens.EOF Then
                  Do While Not rs_mensagens.EOF
                    id = rs_mensagens("id_Contato")
                    visualizado = rs_mensagens("visualizado")
                %>
                  <tr data-id="<%=id%>">
                    <td><%=id%></td>
                    <td><%=rs_mensagens("nomeCompleto")%></td>
                    <td><%=rs_mensagens("assunto")%></td>
                    <td><%=rs_mensagens("data_envio")%></td>
                    <td class="status-cell">
                      <% If visualizado Then %>
                        <span class="label label-success">Visualizado</span>
                      <% Else %>
                        <span class="label label-danger">Não Visualizado</span>
                      <% End If %>
                    </td>
                    <td>
                      <button class="btn btn-primary" 
                              data-toggle="modal" 
                              data-target="#modal-default" 
                              onclick="abrirModal('<%=id%>', '<%=Server.HTMLEncode(rs_mensagens("nomeCompleto"))%>', '<%=Server.HTMLEncode(rs_mensagens("email"))%>', '<%=Server.HTMLEncode(rs_mensagens("assunto"))%>', '<%=Server.HTMLEncode(rs_mensagens("mensagem"))%>', '<%=rs_mensagens("data_envio")%>')">
                        <i class="fa fa-eye"></i>
                      </button>
                    </td>
                  </tr>
                <% 
                  rs_mensagens.MoveNext
                  Loop
                Else
                %>
                  <tr>
                    <td colspan="6" class="text-center">Nenhuma mensagem encontrada.</td>
                  </tr>
                <% 
                End If
                Call fechaConexao
                %>
              </tbody>
            </table>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>

<!-- Modal -->
<div class="modal fade" id="modal-default">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title"><i class="fa fa-envelope-open-text"></i> Detalhes da Mensagem</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label><strong>Nome:</strong></label>
          <p id="modalNome"></p>
        </div>
        <div class="form-group">
          <label><strong>Email:</strong></label>
          <p id="modalEmail"></p>
        </div>
        <div class="form-group">
          <label><strong>Assunto:</strong></label>
          <p id="modalAssunto"></p>
        </div>
        <div class="form-group">
          <label><strong>Mensagem:</strong></label>
          <p id="modalMensagemTexto"></p>
        </div>
        <div class="form-group">
          <label><strong>Data de Envio:</strong></label>
          <p id="modalData"></p>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

<!-- Script -->
<script>
  function abrirModal(id, nome, email, assunto, mensagem, dataEnvio) {
    // Preenche os campos da modal
    document.getElementById('modalNome').textContent = nome;
    document.getElementById('modalEmail').textContent = email;
    document.getElementById('modalAssunto').textContent = assunto;
    document.getElementById('modalMensagemTexto').textContent = mensagem;
    document.getElementById('modalData').textContent = dataEnvio;

    // Atualiza o status no banco de dados e na tabela
    fetch(`list-contatos.asp?id=${id}`)
      .then(response => response.text())
      .then(data => {
        const statusCell = document.querySelector(`tr[data-id="${id}"] .status-cell`);
        if (statusCell) {
          statusCell.innerHTML = '<span class="label label-success">Visualizado</span>';
        }
      })
      .catch(error => console.log("Erro ao atualizar o status: ", error));
  }
</script>

<!-- ASP para atualizar status -->
<%
  If Request.QueryString("id") <> "" Then
    call abreConexao
    id = Request.QueryString("id")
    If IsNumeric(id) Then
      id = CInt(id)
      sql = "UPDATE cam_contatoSite SET visualizado = 1 WHERE id_Contato = " & id
      conn.execute(sql)
    End If
    call fechaConexao
  End If
%>

<!--#include file="footer.asp"-->