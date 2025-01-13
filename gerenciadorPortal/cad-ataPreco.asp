<!--#include file="base.asp"-->
<%
  id_ataPreco = Request("id_ataPreco")

  call abreConexao
  if id_ataPreco <> "" then
      sql = "SELECT * from cam_ataPreco where id_ataPreco = '"&id_ataPreco&"'"
      set rs_ataPreco = conn.execute(sql)
      if not rs_ataPreco.eof then
      id_ataPreco = rs_ataPreco("id_ataPreco")
      id_categoriaLeg = rs_ataPreco("id_categoriaLeg")
      numDocumento = rs_ataPreco("numDocumento")
      dataPublicacao = rs_ataPreco("dataPublicacao")
      descricao = rs_ataPreco("descricao")
      anexo_ataPreco = rs_ataPreco("anexo_ataPreco")
      statusAtaPreco = rs_ataPreco("statusAtaPreco")
      existe = 1     
      end if
  end if
call fechaConexao
%>
<script>
function cadastrar(){

    var form = document.forms["frmAtaPreco"];
    form.Operacao.value = 2;
    form.enctype = "multipart/form-data";
    form.action = "crud-ataPreco.asp";
    form.submit();
}

function alterar(id_ataPreco)
{
    //alert(id_ataPreco)
    var form = document.forms["frmAtaPreco"];
    form.Operacao.value = 3;
    form.enctype = "multipart/form-data";
    form.action = "crud-ataPreco.asp?id_ataPreco="+id_ataPreco;
    form.submit();
    
}

</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Atas de Preços
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Atas de Preços</a></li> /
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
          <form role="form" name="frmAtaPreco" method="post">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="id_ataPreco" id="id_ataPreco" value="<%=id_ataPreco%>">             
            <div class="box-body">
                <div class="form-group">
                    <div class="row">
                        <%
                        call abreConexao
                        sql = "SELECT cam_categoriaLeg.id_categoriaLeg, cam_categoriaLeg.descricao " &_
                            "FROM cam_categoriaLeg WHERE id_categoriaLeg IN (11)"
                        set rs_ataPreco = conn.execute(sql)
                        %>
                        <div class="col-md-6">
                            <label for="ataCategoria">Categoria</label>
                            <select class="form-control" id="ataCategoria" name="ataCategoria">
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
                            <label for="descricao">Descricao</label>
                            <input type="text" class="form-control" id="descricao" value="<%=descricao%>" name="descricao">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="upPCA">Arquivo PDF</label>
                            <input type="file" class="form-control" id="upPCA" name="upPCA" accept=".pdf">
                            <%if anexo_ataPreco <> "" then%>
                              <p><a href="upAnexos/<%= anexo_ataPreco %>" target="_blank"><%= anexo_ataPreco %></a></p>
                            <%end if%>
                        </div>
                        <div class="col-md-6">
                            <label for="statusAta">Status</label>
                            <select class="form-control" id="statusAta" name="statusAta">
                            <option value="true" <%IF statusAtaPreco  = true THEN%> selected <%END IF%>>Ativo</option>
                            <option value="false" <%IF statusAtaPreco  = false THEN%> selected <%END IF%>>Inativo</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" class="form-btn btn btn-primary pull-right" onClick="<%IF existe = 1 THEN%>return alterar('<%=id_ataPreco%>')<%ELSE%>return cadastrar()<%END IF%>"><i class="fa fa-fw fa-check"></i> <%if Existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
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