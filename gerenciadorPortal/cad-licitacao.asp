<!--#include file="base.asp"-->
  <%
  id_licitacao = Request("id_licitacao")

  call abreConexao
  if id_licitacao <> "" then
      sql = "SELECT * from cam_licitacao where id_licitacao = '"&id_licitacao&"'"
      set rs_Licitacao = conn.execute(sql)
      if not rs_Licitacao.eof then
      Autoridade = rs_Licitacao("id_Autoridade")
      Orgao = rs_Licitacao("id_Orgao")
      Procedimento = rs_Licitacao("id_Procedimento")
      modalidade = rs_Licitacao("id_modalidade")
      TipoLici = rs_Licitacao("id_TipoLicitacao")
      finalidade = rs_Licitacao("id_finalidade")
      RegimeExec = rs_Licitacao("id_RegimeSituacao")
      Situacao = rs_Licitacao("id_Situacao")
      NumProceso = rs_Licitacao("NumProceso")
      dataAbertura = rs_Licitacao("dataAbertura")
      dataHomologa = rs_Licitacao("dataHomologa")
      dataPublicacao = rs_Licitacao("dataPublicacao")
      valorEstimado = rs_Licitacao("valorEstimado")
      valorDespesa = rs_Licitacao("valorDespesa")
      objeto = rs_Licitacao("objeto")
      anexo_Lici = rs_Licitacao("anexo_Lici")
      statusLicitacao = rs_Licitacao("statusLicitacao")
      existe = 1     
      end if
  end if
call fechaConexao
  %>
<script>
function cadastrar(){

    var form = document.forms["frmLicitacao"];
    form.Operacao.value = 2;
    form.enctype = "multipart/form-data";
    form.action = "crud-licitacao.asp";
    form.submit();
}

function alterar(id_licitacao)
{
    //alert(id_licitacao)
    var form = document.forms["frmLicitacao"];
    form.Operacao.value = 3;
    form.enctype = "multipart/form-data";
    form.action = "crud-licitacao.asp?id_licitacao="+id_licitacao;
    form.submit();
    
}

</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Licitação
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Licitação</a></li> /
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
          <form role="form" name="frmLicitacao" method="post" enctype="multipart/form-data">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="id_licitacao" id="id_licitacao" value="<%=id_licitacao%>">  
            <div class="box-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3">
                            <label for="NumProcesso">Nº Processo</label>
                            <input type="text" class="form-control" id="NumProcesso" name="NumProcesso" value="<%=NumProceso%>">
                        </div>
                        <%
                        call abreConexao 
                        sql = "SELECT * FROM cam_liciProcedimento ORDER BY id_Procedimento"
                        set rs_Procedimento = conn.execute(sql) 
                        %>                     
                        <div class="col-md-3">
                            <label for="Procedimento">Procedimento</label>
                            <select class="form-control" id="Procedimento" name="Procedimento" >
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_Procedimento.eof%>
                                <option <%if  rtrim(Procedimento) = rtrim(rs_Procedimento("id_Procedimento")) then response.write("selected") end if%> value="<%=rs_Procedimento("id_Procedimento")%>"><%=rs_Procedimento("Descricao")%></option>
                        <% rs_Procedimento.movenext 
                        loop 
                        call fechaConexao
                        %>
                            </select>
                        </div>
                        <%
                        call abreConexao 
                        sql = "SELECT * FROM cam_liciModalidade ORDER BY id_Modalidade"
                        set rs_Modalidade = conn.execute(sql) 
                        %>    
                        <div class="col-md-3">
                            <label for="Modalidade">Modalidade</label>
                            <select class="form-control" id="Modalidade" name="Modalidade" >
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_Modalidade.eof%>
                                <option <%if  rtrim(Modalidade) = rtrim(rs_Modalidade("id_Modalidade")) then response.write("selected") end if%> value="<%=rs_Modalidade("id_Modalidade")%>"><%=rs_Modalidade("descModalidade")%></option>
                        <% rs_Modalidade.movenext 
                        loop 
                        call fechaConexao
                        %>
                            </select>
                        </div>
                        <%
                        call abreConexao 
                        sql = "SELECT * FROM cam_liciTipoLicitacao ORDER BY id_TipoLici"
                        set rs_tipoLici = conn.execute(sql) 
                        %> 
                        <div class="col-md-3">
                            <label for="TipoLici">Tipo</label>
                            <select class="form-control" id="TipoLici" name="TipoLici" >
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_tipoLici.eof%>
                                <option <%if  rtrim(tipoLici) = rtrim(rs_tipoLici("id_TipoLici")) then response.write("selected") end if%> value="<%=rs_tipoLici("id_TipoLici")%>"><%=rs_tipoLici("decTipoLici")%></option>
                        <% rs_tipoLici.movenext 
                        loop 
                        call fechaConexao
                        %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-2">
                            <label for="dataAbertura">Data de Abertura</label>
                            <input type="text" class="form-control" id="dataAbertura" name="dataAbertura" value="<%=dataAbertura%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                        </div>
                        <%
                        call abreConexao 
                        sql = "SELECT * FROM cam_liciFinalidade ORDER BY id_Finalidade"
                        set rs_Finalidade = conn.execute(sql) 
                        %> 
                        <div class="col-md-3">
                            <label for="Finalidade">Finalidade</label>
                            <select class="form-control" id="Finalidade" name="Finalidade" >
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_Finalidade.eof%>
                                <option <%if  rtrim(Finalidade) = rtrim(rs_Finalidade("id_Finalidade")) then response.write("selected") end if%> value="<%=rs_Finalidade("id_Finalidade")%>"><%=rs_Finalidade("descFinalidade")%></option>
                        <% rs_Finalidade.movenext 
                        loop 
                        call fechaConexao
                        %>
                            </select>
                        </div>
                        <%
                        call abreConexao 
                        sql = "SELECT * FROM cam_liciRegimeExec ORDER BY id_RegimeExec"
                        set rs_RegimeExec = conn.execute(sql) 
                        %> 
                        <div class="col-md-3">
                            <label for="RegimeExec">Regime de Execução</label>
                            <select class="form-control" id="RegimeExec" name="RegimeExec" >
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_RegimeExec.eof%>
                                <option <%if  rtrim(RegimeExec) = rtrim(rs_RegimeExec("id_RegimeExec")) then response.write("selected") end if%> value="<%=rs_RegimeExec("id_RegimeExec")%>"><%=rs_RegimeExec("decRegimeExec")%></option>
                        <% rs_RegimeExec.movenext 
                        loop 
                        call fechaConexao
                        %>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label for="ValorEstimado">Valor Estimado</label>
                            <input type="text" class="form-control" id="ValorEstimado" name="ValorEstimado" value="<%=valorEstimado%>">
                        </div>
                        <div class="col-md-2">
                            <label for="ValorDespesa">Valor Despesa</label>
                            <input type="text" class="form-control" id="ValorDespesa" name="ValorDespesa" value="<%=valorDespesa%>">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="dataPublicacao">Data da Publicação</label>
                            <input type="text" class="form-control" id="dataPublicacao" name="dataPublicacao" value="<%=dataPublicacao%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                        </div>
                        <div class="col-md-4">
                            <label for="dataHomologa">Data de Homologação</label>
                            <input type="text" class="form-control" id="dataHomologa" name="dataHomologa" value="<%=dataHomologa%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                        </div>
                        <%
                        call abreConexao 
                        sql = "SELECT * FROM cam_liciSituacao ORDER BY id_Situacao"
                        set rs_Situacao = conn.execute(sql) 
                        %>
                        <div class="col-md-4">
                            <label for="situacao">Situação</label>
                            <select class="form-control" id="situacao" name="situacao" >
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_Situacao.eof%>
                                <option <%if  rtrim(Situacao) = rtrim(rs_Situacao("id_Situacao")) then response.write("selected") end if%> value="<%=rs_Situacao("id_Situacao")%>"><%=rs_Situacao("descSituacao")%></option>
                        <% rs_Situacao.movenext 
                        loop 
                        call fechaConexao
                        %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <%
                        call abreConexao 
                        sql = "SELECT * FROM cam_Orgao ORDER BY id_Orgao"
                        set rs_Orgao = conn.execute(sql) 
                        %>
                        <div class="col-md-6">
                            <label for="orgao">Orgão</label>
                            <select class="form-control" id="orgao" name="orgao" >
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_Orgao.eof%>
                                <option <%if  rtrim(Orgao) = rtrim(rs_Orgao("id_Orgao")) then response.write("selected") end if%> value="<%=rs_Orgao("id_Orgao")%>"><%=rs_Orgao("descOrgao")%></option>
                        <% rs_Orgao.movenext 
                        loop 
                        call fechaConexao
                        %>
                            </select>
                        </div>
                        <%
                        call abreConexao
                        sql = "SELECT cam_servidores.id_servidor, cam_servidores.NomeCompleto " &_
                            "FROM cam_servidores WHERE id_Cargo IN (1, 2, 5, 6, 7, 8, 11, 12, 13, 16)"
                        set rs_Servidor = conn.execute(sql)
                        %>
                        <div class="col-md-6">
                            <label for="autoridade">Autoridade Responsável</label>
                            <select class="form-control" id="autoridade" name="autoridade" >
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_Servidor.eof%>
                                <option <%if  rtrim(Orgao) = rtrim(rs_Servidor("id_servidor")) then response.write("selected") end if%> value="<%=rs_Servidor("id_servidor")%>"><%=rs_Servidor("NomeCompleto")%></option>
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
                            <label for="objeto">Objeto</label>
                            <textarea class="form-control" id="objeto" name="objeto" rows="4"><%=objeto%></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="arquivo">Arquivo PDF</label>
                            <input type="file" class="form-control" id="arquivo" name="arquivo" accept=".pdf" >
                            <% 
                            ' Verifica se existe um anexo e exibe o link para o PDF
                            if anexo_Lici <> "" then 
                            %>
                              <p>
                                <a href="upLicitacoes/<%= anexo_Lici %>" target="_blank"><%= anexo_Lici %></a>
                              </p>
                            <% 
                            end if 
                            %>
                        </div>
                        <%if existe = 1 then%>
                        <div class="col-md-6">
                            <label for="statusLici">Status</label>
                            <select class="form-control" id="statusLici" name="statusLici" >
                                <option value="1" <%IF statusLicitacao  = 1 THEN%> selected <%END IF%>>Ativo</option>
                                <option value="2" <%IF statusLicitacao  = 2 THEN%> selected <%END IF%>>Inativo</option>
                            </select>
                        </div>
                        <%end if%>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" class="form-btn btn btn-primary pull-right" onClick="<%IF existe = 1 THEN%>return alterar('<%=id_licitacao%>')<%ELSE%>return cadastrar()<%END IF%>"><i class="fa fa-fw fa-check"></i> <%if Existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
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
<!-- Campo hidden para o valor de Resp -->
<input type="hidden" id="hiddenResp" name="hiddenResp" value="<%= Request("Resp") %>">

<!-- SweetAlert e script para limpar URL -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  window.onload = function() {
    var resp = document.getElementById('hiddenResp').value;

    if (resp == "2") {
      Swal.fire({
        icon: 'success',
        title: 'Licitação Alterada com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    }

    // Limpar a URL removendo o parâmetro 'Resp'
    if (resp) {
      const url = new URL(window.location);
      url.searchParams.delete('Resp');

      if (url.searchParams.toString() === '') {
        window.history.replaceState(null, null, url.pathname);
      } else {
        window.history.replaceState(null, null, url);
      }
    }
  };
</script>
<!--#include file="footer.asp"-->