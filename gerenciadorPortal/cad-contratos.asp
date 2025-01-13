<!--#include file="base.asp"-->
  <%
  id_contrato = Request("id_contrato")

  call abreConexao
  if id_contrato <> "" then
      sql = "SELECT * from cam_contratos where id_contrato = '"&id_contrato&"'"
      'response.write sql
      'response.end
      set rs_contrato = conn.execute(sql)
      if not rs_contrato.eof then
      licitacao = rs_contrato("id_licitacao")
      tipoContratacao = rs_contrato("id_tipoContratacao")
      numContrato = rs_contrato("numContrato")
      inicioVigencia = rs_contrato("inicioVigencia")
      fimVigencia = rs_contrato("fimVigencia")
      valorEstimado = rs_contrato("valorEstimado")
      id_fornecedor = rs_contrato("id_fornecedor")
      id_fiscal = rs_contrato("id_fiscal")
      descricao = rs_contrato("descricao")
      anexoContrato = rs_contrato("anexoContrato")
      statusContrato = rs_contrato("statusContrato")
      existe = 1     
      end if
  end if
call fechaConexao
  %>
<script>
function cadastrar(){

    var form = document.forms["frmContrato"];
    form.Operacao.value = 2;
    form.enctype = "multipart/form-data";
    form.action = "crud-contratos.asp";
    form.submit();
}

function alterar(id_contrato)
{
    //alert(id_contrato)
    var form = document.forms["frmContrato"];
    form.Operacao.value = 3;
    form.enctype = "multipart/form-data";
    form.action = "crud-contratos.asp?id_contrato="+id_contrato;
    form.submit();
    
}

</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Contrato
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Contrato</a></li> /
          <span class="font-w-600">Cadastrar</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- /.box-header -->
          <!-- form start -->
          <form role="form" name="frmContrato" method="post">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="id_contrato" id="id_contrato" value="<%=id_contrato%>">  
            <div class="box-body">
                <div class="form-group">
                    <div class="row">
                    <%
                    call abreConexao 
                    sql = "SELECT * FROM cam_tipoContratacao ORDER BY id_tipoContratacao"
                    set rs_tipoContratacao = conn.execute(sql) 
                    %>    
                        <div class="col-md-4">
                        <label for="tipoContratacao">Tipo de Contratação</label>
                        <select class="form-control" id="tipoContratacao" name="tipoContratacao" required>
                            <option value="0" <% If IsEmpty(tipoContratacao) Or tipoContratacao = "" Then response.write("selected") End If %>>-- Selecionar --</option>
                            <option value="" disabled></option>
                    <%do while not rs_tipoContratacao.eof%>
                            <option <%if  rtrim(tipoContratacao) = rtrim(rs_tipoContratacao("id_tipoContratacao")) then response.write("selected") end if%> value="<%=rs_tipoContratacao("id_tipoContratacao")%>"><%=rs_tipoContratacao("descTipo")%></option>
                    <% rs_tipoContratacao.movenext 
                    loop 
                    call fechaConexao
                    %>
                        </select>
                        </div>
                    <%
                    call abreConexao 
                    sql = "SELECT * FROM cam_licitacao WHERE statusLicitacao = 1 ORDER BY id_licitacao"
                    set rs_licitacao = conn.execute(sql) 
                    %>                         
                        <div class="col-md-4">
                            <label for="select-licitacao">
                            Nº Edital de Licitação
                            <span class="text-red">*</span>
                            </label>
                            <select class="form-control" id="licitacao" name="licitacao" >
                            <option value="">-- Selecionar --</option>
                            <option value="" disabled></option>
                    <%do while not rs_licitacao.eof%>
                            <option <%if  rtrim(licitacao) = rtrim(rs_licitacao("id_licitacao")) then response.write("selected") end if%> value="<%=rs_licitacao("id_licitacao")%>"><%=rs_licitacao("NumProceso")%></option>
                    <% rs_licitacao.movenext 
                    loop 
                    call fechaConexao
                    %>
                            </select>
                        </div>   
                        <div class="col-md-4">
                            <label for="numContrato">Nº Contrato</label>
                            <input type="text" class="form-control" id="numContrato" name="numContrato" value="<%=numContrato%>">
                        </div>

                    </div>
                </div>
<script>
    function controlarCampos() {
        var tipoContratacao = document.getElementById("tipoContratacao").value;
        var licitacaoDiv = document.getElementById("licitacao").closest(".col-md-4"); // Ajuste da classe correta
        
        // Exibe o campo apenas se o Tipo de Contratação for Licitação (valor 1)
        if (tipoContratacao === "1") {
            licitacaoDiv.style.display = "block"; // Exibe
        } else {
            licitacaoDiv.style.display = "none"; // Oculta
        }
    }

    document.addEventListener("DOMContentLoaded", function () {
        controlarCampos(); // Executa a função ao carregar a página
        document.getElementById("tipoContratacao").addEventListener("change", controlarCampos); // Adiciona o evento ao campo
    });
</script>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="valorEstimado">Valor Estimado</label>
                            <input type="text" class="form-control" id="valorEstimado" name="valorEstimado" value="<%=valorEstimado%>">
                        </div>
                        <div class="col-md-4">
                            <label for="inicioVigencia">Inicio da Vigência</label>
                            <input type="text" class="form-control" id="inicioVigencia" name="inicioVigencia" value="<%=inicioVigencia%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                        </div>
                        <div class="col-md-4">
                            <label for="fimVigencia">Fim da Vigência</label>
                            <input type="text" class="form-control" id="fimVigencia" name="fimVigencia" value="<%=fimVigencia%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="fornecedor">Fornecedor</label>
                            <select class="form-control" id="fornecedor" name="fornecedor" required>
                                <option value="">-- Selecionar --</option>
                                <option value="1" <%IF id_fornecedor  = 1 THEN%> selected <%END IF%>>APPMAKE SOLUÇÕES TECNOLÓGICAS</option>
                                <option value="2" <%IF id_fornecedor  = 2 THEN%> selected <%END IF%>>NORRIS INFORCELL</option>
                            </select>
                        </div>
                        <%
                        call abreConexao
                        sql = "SELECT cam_servidores.id_servidor, cam_servidores.NomeCompleto " &_
                            "FROM cam_servidores WHERE id_Cargo IN (1, 2, 5, 6, 7, 8, 11, 12, 13, 16)"
                        set rs_Servidor = conn.execute(sql)
                        %>
                        <div class="col-md-6">
                            <label for="fiscal">Fiscal de Contrato</label>
                            <select class="form-control" id="fiscal" name="fiscal" >
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_Servidor.eof%>
                                <option <%if  rtrim(id_fiscal) = rtrim(rs_Servidor("id_servidor")) then response.write("selected") end if%> value="<%=rs_Servidor("id_servidor")%>"><%=rs_Servidor("NomeCompleto")%></option>
                        <% rs_Servidor.movenext 
                        loop 
                        call fechaConexao
                        %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="DescContrato">Descrição</label>
                            <textarea class="form-control" id="DescContrato" name="DescContrato" rows="4"><%=descricao%></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="arquivoContrato">Arquivo PDF</label>
                            <input type="file" class="form-control" id="arquivoContrato" name="arquivoContrato" accept=".pdf" required>
                            <%if anexoContrato <> "" then%>
                              <p><a href="upAnexos/<%= anexoContrato %>" target="_blank"><%= anexoContrato %></a></p>
                            <%end if%>
                        </div>
                        <%if existe = 1 then%>
                        <div class="col-md-6">
                            <label for="status_Contrato">Status</label>
                            <select class="form-control" id="status_Contrato" name="status_Contrato" >
                              <option value="true" <% If statusContrato = true Then %> selected <% End If %>>Ativo</option>
                              <option value="false" <% If statusContrato = false Then %> selected <% End If %>>Inativo</option>
                            </select>
                        </div>
                        <%end if%>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" class="form-btn btn btn-primary pull-right" onClick="<%IF existe = 1 THEN%>return alterar('<%=id_contrato%>')<%ELSE%>return cadastrar()<%END IF%>"><i class="fa fa-fw fa-check"></i> <%if Existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
            </div>
          </form>
        </div>
        <!-- /.box -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
</div>
<!--#include file="footer.asp"-->