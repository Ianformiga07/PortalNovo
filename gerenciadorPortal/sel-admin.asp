<!--#include file="base.asp"-->
<%
call abreConexao
%>

<script src="js/mascara.js"></script>
<script>
function admin(idServidor)
{

    var form = document.forms["frm_BuscaServ"];
    form.idServidor.value = idServidor;
    form.action = "cad-administrador.asp";
    form.submit();
    
}
</script>

<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-search text-blue"></i> Buscar Servidor
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <li><a href="diarias.asp">Administrador</a></li> /
      <span class="font-w-600">Buscar Servidor</span>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-xs-12">
<div class="box box-primary">
  <div class="box-footer">
      <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
  </div>
  <!-- Form para buscar servidor -->
  <form action="sel-admin.asp" method="post" name="frm_BuscaServ">
    <input type="hidden" name="idServidor" id="idServidor">
    <div class="box-body">
      <div class="row align-items-end"> <!-- Adicionado align-items-end para alinhar o botão -->
        <div class="col-md-4"> <!-- Ajuste a largura conforme necessário -->
          <div class="form-group">
            <label for="searchCPF">Buscar por CPF</label>
            <input type="text" class="form-control" id="searchCPF" name="searchCPF" placeholder="Digite CPF" oninput="mascaraCPF(this)">
          </div>
        </div>
        <div class="col-md-6"> <!-- Ajuste a largura conforme necessário -->
          <div class="form-group">
            <label for="searchNome">Buscar por Nome</label>
            <input type="text" class="form-control" id="searchNome" name="searchNome" placeholder="Digite o nome do servidor">
          </div>
        </div>
        <div class="col-md-2"> <!-- Ajuste a largura conforme necessário -->
          <button type="submit" class="btn btn-primary" style="margin-top: 25px;">Buscar</button> <!-- Adicionado mt-4 para margem superior -->
        </div>
      </div>
    </div>
  </form>
</div>

        <!-- Lógica para exibir resultados se houver busca -->
        <%
        if request.form("searchCPF") <> "" or request.form("searchNome") <> "" then
            ' Construir a query SQL dinamicamente
            sql = "SELECT CPF, NomeCompleto, statusServidor FROM cam_servidores WHERE statusServidor = 1"
            if request.form("searchCPF") <> "" then
                sql = sql & " AND CPF = '" & request.form("searchCPF") & "'"
            end if

            if request.form("searchNome") <> "" then
                sql = sql & " AND NomeCompleto LIKE '%" & request.form("searchNome") & "%'"
            end if

            set rs_admin = conn.execute(sql)

            ' Exibir a tabela de resultados
        %>
        <div class="box box-primary">
          <div class="box-header">
            <h3 class="box-title">Resultados da Busca</h3>
          </div>
          <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>CPF</th>
                  <th>Nome</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <% if rs_admin.eof then %>
                    <tr style="background-color: #ffcccc;"> <!-- Fundo vermelho claro -->
                        <td colspan="4" class="text-center">Nenhum servidor encontrado.</td>
                    </tr>
                <% else %>
                  <% do while not rs_admin.eof %>
                    <tr>
                      <td><%= rs_admin("CPF") %></td>
                      <td><%= rs_admin("NomeCompleto") %></td>
                      <td><%if rs_admin("statusServidor") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                      <td>
                        <a href="#" onClick="admin('<%=rs_admin("CPF")%>');" class="btn btn-success btn-xs"><i class="fa fa-plus"></i></a>
                      </td>
                    </tr>
                    <% rs_admin.movenext %>
                  <% loop %>
                <% end if %>
              </tbody>
            </table>
          </div>
        </div>
        <% end if %>

      </div>
    </div>
  </section>
</div>

<%
call fechaConexao
%>

<!--#include file="footer.asp"-->