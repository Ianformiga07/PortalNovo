<!--#include file="base.asp"-->
<%
  id_pca = Request("id_pca")

  call abreConexao
  if id_pca <> "" then
      sql = "SELECT * from cam_pca where id_pca = '"&id_pca&"'"
      set rs_pca = conn.execute(sql)
      if not rs_pca.eof then
      id_pca = rs_pca("id_pca")
      id_categoriaLeg = rs_pca("id_categoriaLeg")
      numDocumento = rs_pca("numDocumento")
      dataPublicacao = rs_pca("dataPublicacao")
      descricaoPCA = rs_pca("descricaoPCA")
      upPCA = rs_pca("upPCA")
      statusPCA = rs_pca("statusPCA")
      existe = 1     
      end if
  end if
call fechaConexao
%>
<script>
function cadastrar(){

    var form = document.forms["frmPCA"];
    form.Operacao.value = 2;
    form.enctype = "multipart/form-data";
    form.action = "crud-pca.asp";
    form.submit();
}

function alterar(id_pca)
{
    //alert(id_pca)
    var form = document.forms["frmPCA"];
    form.Operacao.value = 3;
    form.enctype = "multipart/form-data";
    form.action = "crud-pca.asp?id_pca="+id_pca;
    form.submit();
    
}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar PCA - Plano de Contratação Anual
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">PCA - Plano de Contratação Anual</a></li> /
          <span class="font-w-600">Cadastrar </span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- /.box-header -->
          <!-- form start -->
          <form role="form" name="frmPCA" method="post">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="id_pca" id="id_pca" value="<%=id_pca%>"> 
            <div class="box-body">
                <div class="form-group">
                    <div class="row">
                        <%
                        call abreConexao
                        sql = "SELECT cam_categoriaLeg.id_categoriaLeg, cam_categoriaLeg.descricao " &_
                            "FROM cam_categoriaLeg WHERE id_categoriaLeg IN (12)"
                        set rs_ataPreco = conn.execute(sql)
                        %>
                        <div class="col-md-6">
                            <label for="pcaCategoria">Categoria</label>
                            <select class="form-control" id="pcaCategoria" name="pcaCategoria">
                                <option value="">-- Selecionar --</option>
                                <option value="" disabled></option>
                        <%do while not rs_ataPreco.eof%>
                                <option <%if  rtrim(id_categoriaLeg) = rtrim(rs_ataPreco("id_categoriaLeg")) then response.write("selected") end if%> value="<%=rs_ataPreco("id_categoriaLeg")%>"><%=rs_ataPreco("descricao")%></option>
                        <% rs_ataPreco.movenext 
                        loop 
                        call fechaConexao
                        %>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="dataPublicacao">Nº Documento</label>
                            <input type="text" class="form-control" id="numDoc" name="numDoc" value="<%=numDocumento%>">
                        </div>
                        <div class="col-md-3">
                            <label for="dataPublicacao">Data da Publicação</label>
                            <input type="text" class="form-control" id="dataPublicacao" name="dataPublicacao" value="<%=dataPublicacao%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="descricaoPCA">Descricao</label>
                            <input type="text" class="form-control" id="descricaoPCA" name="descricaoPCA" value="<%=descricaoPCA%>">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="upPCA">Arquivo PDF</label>
                            <input type="file" class="form-control" id="upPCA" name="upPCA" accept=".pdf">
                            <%if upPCA <> "" then%>
                              <p><a href="upAnexos/<%= upPCA %>" target="_blank"><%= upPCA %></a></p>
                            <%end if%>
                        </div>
                        <div class="col-md-6">
                            <label for="statusPCA">Status</label>
                            <select class="form-control" id="statusPCA" name="statusPCA">
                            <option value="true" <%IF statusPCA  = true THEN%> selected <%END IF%>>Ativo</option>
                            <option value="false" <%IF statusPCA  = false THEN%> selected <%END IF%>>Inativo</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

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
  <!-- /.content -->
</div>
<!--#include file="footer.asp"-->