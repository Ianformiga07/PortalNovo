<!--#include file="base.asp"-->
<script>
function cadastrar(){
    var form = document.forms["frmPatrimonio"];
    form.Operacao.value = 2;
    form.action = "crud-patrimonios.asp";
    form.submit();
}

function alterar(CPF)
{
    //alert(CPF)
    var form = document.forms["frmServidor"];
    form.CPFVisu.value = CPF;
    form.Operacao.value = 3;
    form.action = "crud-patrimonios.asp?cpf="+CPF+"&Operacao="+3;
    form.submit();
    
}

</script>
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-archive text-blue"></i> Cadastro de Patrimônio
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp/"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Cadastro de Patrimônio</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- Formulário de Cadastro de Patrimônio -->
          <form name="frmPatrimonio" method="POST">
            <input type="hidden" name="Operacao" id="Operacao">
            <div class="box-body">
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
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="numeroPatrimonio">Número do Tombamento</label>
                    <input type="text" class="form-control" id="numeroPatrimonio" name="numeroPatrimonio">
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="dataAquisicao">Data de Aquisição</label>
                    <input type="date" class="form-control" id="dataAquisicao" name="dataAquisicao">
                  </div>
                </div>
              </div>

              <!-- Data de Aquisição e Estado de Conservação lado a lado -->
              <div class="row">
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="valorPatrimonio">Valor do Patrimônio</label>
                    <input type="text" class="form-control" id="valorPatrimonio" name="valorPatrimonio">
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="valorPatrimonio">Valor Atual</label>
                    <input type="text" class="form-control" id="valorPatrimonio" name="valorPatrimonio">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="tipoBem">Tipo do Bem</label>
                    <select class="form-control" id="tipoBem" name="tipoBem">
                      <option value="">Selecione o Tipo do Bem</option>
                      <option value="Bens Móveis">Bens Móveis</option>
                      <option value="Bens Imóveis">Bens Imóveis</option>
                      <option value="Veículos">Veículos</option>
                      <option value="Equipamentos">Equipamentos</option>
                      <option value="Outros">Outros</option>
                    </select>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="estadoConservacao">Estado de Conservação</label>
                    <select class="form-control" id="estadoConservacao" name="estadoConservacao">
                      <option value="Novo">Novo</option>
                      <option value="Bom">Bom</option>
                      <option value="Regular">Regular</option>
                      <option value="Ruim">Ruim</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="fornecedor">Fornecedor</label>
                    <input type="text" class="form-control" id="fornecedor" name="fornecedor">
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="statusPatrimonio">Status</label>
                    <select class="form-control" id="statusPatrimonio" name="statusPatrimonio">
                    <option value="Ativo">Ativo</option>
                    <option value="Inativo">Inativo</option>
                    <option value="Alienado">Alienado</option>
                    </select>
                  </div>
                </div>
              </div>

              <!-- Descrição do Patrimônio (Campo Único) -->
              <div class="form-group">
                <label for="descricaoPatrimonio">Descrição do Patrimônio</label>
                <textarea class="form-control" id="descricaoPatrimonio" name="descricaoPatrimonio"></textarea>
              </div>
            </div>

            <!-- Botão de submissão -->
            <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" class="form-btn btn btn-primary pull-right" onClick="<%IF existe = 1 THEN%>return alterar('<%=id_pca%>')<%ELSE%>return cadastrar()<%END IF%>"><i class="fa fa-fw fa-check"></i> <%if Existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
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