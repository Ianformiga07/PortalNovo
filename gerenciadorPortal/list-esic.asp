<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
<%
  call abreConexao
  sql = "SELECT * FROM cam_esic inner join cam_tipoEsic on cam_tipoEsic.id_tipoEsic = cam_esic.id_tipoEsic ORDER BY dataCad DESC"
  'response.write sql
  'response.end
  set rs_manifestacoes = conn.execute(sql)
%>

<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-envelope text-blue"></i> Demandas Recebidas
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li>
          <span class="font-w-600">Demandas</span>
      </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Lista de Demandas</h3>
          </div>
          <div class="box-body table-responsive no-padding">
            <table id="example2" class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>Protocolo</th>
                  <th>Data</th>
                  <th>Nome</th>
                  <th>CPF</th>
                  <th>Telefone</th>
                  <th>Tipo</th>
                  <th>Respondida</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <% While Not rs_manifestacoes.EOF %>
                <tr <% If rs_manifestacoes("respondida") = True Then Response.Write("class='bg-success'") %>>
                <td><%=rs_manifestacoes("protocolo")%></td>
                <td><%=FormatDateTime(rs_manifestacoes("dataCad"), vbShortDate)%></td>
                <td>
                    <%
                    If rs_manifestacoes("anonimo") = True Then 
                        Response.Write("Anonimo") 
                    Else 
                        Response.Write(rs_manifestacoes("nome")) 
                    End If 
                    %>
                </td>
                <td>
                    <% 
                    If rs_manifestacoes("anonimo") = True Then 
                        Response.Write("-") 
                    Else 
                        Response.Write(rs_manifestacoes("cpf")) 
                    End If 
                    %>
                </td>
                <td><%=rs_manifestacoes("telefone")%></td>
                <td><%=rs_manifestacoes("descTipo")%></td>
                <td>
                    <%If rs_manifestacoes("respondida") = True Then %>
                        <span class="label label-success">SIM</span> 
                    <% Else %>
                         <span class="label label-danger">NÃO</span>
                    <% End If %>
                </td>
                <td>
                    <a href="resp-esic.asp?id=<%=rs_manifestacoes("id_esic")%>" class="btn btn-primary btn-sm">
                    <i class="fa fa-reply"></i> Responder
                    </a>
                </td>
                </tr>
                <% rs_manifestacoes.MoveNext %>
                <% Wend %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<%
  rs_manifestacoes.close
  set rs_manifestacoes = Nothing
  call fechaConexao
%>
<!--#include file="footer.asp"-->