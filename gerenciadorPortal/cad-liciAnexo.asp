<!--#include file="base.asp"-->
<%
id_licitacao = Request("id")
id_LiciAnexo = Request("id_LiciAnexo")

if id_LiciAnexo <> "" then
    call abreConexao
    sql = "SELECT * FROM cam_anexosLicitacao WHERE id_licitacao = '" & id_licitacao & "'"
    
    set rs_AnexosLici = conn.execute(sql)
    if not rs_AnexosLici.eof then
        titulo = rs_AnexosLici("titulo")
        LiciAnexos = rs_AnexosLici("LiciAnexos")
        statusAnexos = rs_AnexosLici("statusAnexos")
        existe = 1
    end if
    call fechaConexao
end if


%>

<script>
function admin(id_LiciAnexo, id_licitacao) {

    // Atualiza o campo hidden com o ID
    document.getElementById("id_LiciAnexo").value = id_LiciAnexo;
    document.getElementById("id_licitacao").value = id_licitacao;

    // Submete o formulário para recarregar os dados
    document.forms["frmAnexosLici"].action = "cad-liciAnexo.asp?id_LiciAnexo=" + id_LiciAnexo + "&id="+id_licitacao;
    document.forms["frmAnexosLici"].submit();
}

function cadastrar(){

    var form = document.forms["frmAnexosLici"];
    form.Operacao.value = 2;
    form.enctype = "multipart/form-data";
    form.action = "crud_liciAnexo.asp";
    form.submit();
}

function alterar(id_LiciAnexo, id_licitacao)
{
    //
    var form = document.forms["frmAnexosLici"];
    form.Operacao.value = 3;
    form.enctype = "multipart/form-data";
    form.action = "crud_liciAnexo.asp?id_LiciAnexo="+id_LiciAnexo+ "&id="+id_licitacao;
    form.submit();
    
}

</script>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Diário Oficial
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Diário Oficial</a></li> /
          <span class="font-w-600">Cadastrar</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <%
          call abreConexao
          sql2 = "SELECT cam_licitacao.id_licitacao, cam_licitacao.NumProceso, cam_liciTipoLicitacao.decTipoLici, cam_liciSituacao.descSituacao FROM cam_licitacao INNER JOIN cam_liciModalidade ON cam_licitacao.id_modalidade = cam_liciModalidade.id_Modalidade INNER JOIN  cam_liciTipoLicitacao ON cam_licitacao.id_TipoLicitacao = cam_liciTipoLicitacao.id_TipoLici inner join cam_liciSituacao ON cam_licitacao.id_Situacao = cam_liciSituacao.id_Situacao WHERE cam_licitacao.id_licitacao = '"&id_licitacao&"'"
          set rs_Licitacao = conn.execute(sql2)
          %>
          <div class="box-header with-border font-s-1-2"><b class="font-s-0-875">Licitação</b> » <%=rs_Licitacao("decTipoLici")%> Nº <%=rs_Licitacao("NumProceso")%></div>
          <%call fechaConexao%>
          <form role="form" name="frmAnexosLici" method="post" enctype="multipart/form-data">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="id_LiciAnexo" id="id_LiciAnexo" value="<%=id_LiciAnexo%>">
            <input type="hidden" name="id_licitacao" id="id_licitacao" value="<%=id_licitacao%>">
            <div class="box-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="for_posts_annex_title">
                                Título
                                <span class="text-red">*</span>
                                <span class="limit-char limit_posts_annex_title"></span>
                            </label>
                            <input type="text" class="form-control" id="titulo" name="titulo" value="<%=titulo%>" >
                        </div>
                        <div class="col-md-6">
                            <label for="arquivoliciAnexos">Arquivo PDF</label>
                            <input type="file" class="form-control" id="arquivoliciAnexos" name="arquivoliciAnexos" accept=".pdf" >
                            <% if LiciAnexos <> "" then %>
                              <p>
                                <a href="upLicitacoes/<%= LiciAnexos %>" target="_blank"><%= LiciAnexos %></a>
                              </p>
                            <% end if %>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <%if existe = 1 then%>
                        <div class="col-md-6">
                            <label for="statusAnexos">Status</label>
                            <select class="form-control" id="statusAnexos" name="statusAnexos" >
                                <option value="1" <%IF statusAnexos  = 1 THEN%> selected <%END IF%>>Ativo</option>
                                <option value="2" <%IF statusAnexos  = 2 THEN%> selected <%END IF%>>Inativo</option>
                            </select>
                        </div>
                        <%end if%>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" class="form-btn btn btn-primary pull-right" onClick="<%IF existe = 1 THEN%>return alterar('<%=id_LiciAnexo%>', '<%=id_licitacao%>')<%ELSE%>return cadastrar()<%END IF%>"><i class="fa fa-fw fa-check"></i> <%if Existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
            </div>

<%
call abreConexao
  sql = "SELECT  * FROM cam_anexosLicitacao WHERE id_licitacao = '" & id_licitacao & "'"
  set rs_Anexos = conn.execute(sql)
%>
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Titulo</th>
                  <th>Arquivo</th>
                  <th>Data</th>
                  <th>Ação</th>
                </tr>
                </thead>
                <tbody>
              <%do while not rs_Anexos.eof %>
                <tr>
                  <td><%=rs_Anexos("titulo")%></td>
                  <td><%=rs_Anexos("LiciAnexos")%></td>
                  <td><%=rs_Anexos("dataCad")%></td>
                  <td>
                  <a href="#" onClick="admin('<%=rs_Anexos("id_LiciAnexo")%>', '<%=rs_Anexos("id_licitacao")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button type="button" onClick="confirmarExclusao('<%=rs_Anexos("id_LiciAnexo")%>');" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
              <% rs_Anexos.movenext 
                loop %>  
                </tbody>
              <%call fechaConexao%>
              </table>
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
<input type="hidden" id="hiddenResp" value="<%= Request("Resp") %>">

<!-- SweetAlert e script para limpar URL -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  window.onload = function() {
    var resp = document.getElementById('hiddenResp').value;

    if (resp == "1") {
      Swal.fire({
        icon: 'success',
        title: 'Arquivos Cadastrado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "2") {
      Swal.fire({
        icon: 'success',
        title: 'Arquivos Alterado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "3") {
      Swal.fire({
        icon: 'success',
        title: 'Arquivos Excluída com sucesso!',
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