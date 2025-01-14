<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
<%
  call abreConexao

  Dim id_manifestcao, mensagem, respondida
  id_manifestcao = Request.QueryString("id")

  If Request.Form("acao") = "responder" Then
    mensagem = Request.Form("mensagem")
    sql = "UPDATE cam_esic SET resposta = '" & mensagem & "', respondida = 1, dataResposta = GETDATE(), usu_Resp = " & Session("idUsu") & " WHERE id_esic = " & id_manifestcao
    conn.execute(sql)
    Response.Redirect "list-esic.asp?Resp=2"
  End If

  sql = "SELECT * FROM cam_esic inner join cam_tipoEsic on cam_tipoEsic.id_tipoEsic = cam_esic.id_tipoEsic WHERE id_esic = " & id_manifestcao & " ORDER BY dataCad DESC"
  set rs_manifestacao = conn.execute(sql)
%>

<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-reply text-blue"></i> Responder Demanda
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li>
          <li><a href="listar_manifestacoes.asp">Demandas</a></li>
          <span class="font-w-600">Responder</span>
      </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Responder à Manifestação</h3>
          </div>
          <form method="POST">
            <input type="hidden" name="acao" value="responder">
            <div class="box-body">
              <div class="row">
                <!-- Coluna esquerda (6 campos) -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">Tipo de Manifestação:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><%= rs_manifestacao("descTipo") %></p>
                  </div>
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">Manifestação Anônima:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><%
                      If rs_manifestacao("anonimo") = true Then
                          Response.Write "Sim"
                      Else
                          Response.Write "Nao"
                      End If
                    %></p>
                  </div>
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">Forma de Recebimento:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><%= rs_manifestacao("formaRecebimento") %></p>
                  </div>
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">E-mail:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><%= rs_manifestacao("email") %></p>
                  </div>
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">CPF:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><%= rs_manifestacao("cpf") %></p>
                  </div>
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">Nome:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><%= rs_manifestacao("nome") %></p>
                  </div>
                </div>

                <!-- Coluna direita (5 campos) -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">Telefone:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><%= rs_manifestacao("telefone") %></p>
                  </div>
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">Anexo:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><%
                      If IsNull(rs_manifestacao("anexoEsic")) Then
                          Response.Write "Nenhum anexo"
                      Else
                          Response.Write "<a href='../Site/upOuvidoria/" & rs_manifestacao("anexoEsic") & "' download='" & rs_manifestacao("anexoEsic") & "'>" & rs_manifestacao("anexoEsic") & "</a>"
                      End If
                    %></p>
                  </div>
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">Protocolo:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><strong><%= rs_manifestacao("protocolo") %></strong></p>
                  </div>
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">Texto da Manifestação:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em; word-wrap: break-word; word-break: break-word; max-width: 100%;"><%= rs_manifestacao("descricaoEsic") %></p>
                  </div>
                  <div class="form-group">
                    <label style="font-size: 1.1em; color: #3c8dbc;">Data da Manifestação:</label>
                    <p class="form-control-static bg-light p-2" style="font-size: 1.1em;"><%= FormatDateTime(rs_manifestacao("dataCad"), vbShortDate) %></p>
                  </div>
                </div>
              </div>

              <!-- Campo para a resposta -->
              <div class="form-group">
                <label style="font-size: 1.1em; color: #3c8dbc;">Resposta:</label>
                <textarea class="form-control" name="mensagem" rows="5" required><%=rs_manifestacao("resposta")%></textarea>
              </div>
            </div>
            <div class="box-footer">
              <button type="submit" class="btn btn-primary" style="float: right;"><%if IsNull(rs_manifestacao("resposta")) Or rs_manifestacao("resposta") = "" then%>Enviar Resposta<%else%>Alterar Resposta<%end if%></button>
              <a href="list-ouvidoria.asp" class="btn btn-default"><i class="fa fa-reply"></i> Voltar</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</div>

<%
  rs_manifestacao.close
  set rs_manifestacao = Nothing
  call fechaConexao
%>
<!--#include file="footer.asp"-->