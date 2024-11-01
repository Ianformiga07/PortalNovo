<!--#include file="base.asp"-->
<%
id_diario = Request("id_diario")

call abreConexao

if id_diario <> "" then
sql = "SELECT id_diario, titulo, anexo_diario, status_diario FROM cam_diarioOfi where id_diario = '"&id_diario&"'"
set rsReq = conn.Execute(sql)

    id_diario = rsReq("id_diario")
    titulo = rsReq("titulo")
    status_diario = rsReq("status_diario")
    anexo_diario = rsReq("anexo_diario")

    existe = 1
else
    titulo = ""
    status_diario = ""
    anexo_diario = ""

    existe = 0
end if
call fechaConexao

%>
  <script>
    function cadastrar(){  


    var form = document.forms["frmDiario"];
    form.Operacao.value = "2";
    form.enctype = "multipart/form-data";
    form.action = "crud-diario.asp";
    form.submit();
    }

    function alterar(){  


    var form = document.forms["frmDiario"];
    form.Operacao.value = "3";
    form.enctype = "multipart/form-data";
    form.action = "crud-diario.asp";
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
          <!-- /.box-header -->
          <!-- form start -->
          <form role="form" name="frmDiario" method="post">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="id_diario" id="id_diario" value="<%=id_diario%>">
            <div class="box-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="titulo">Título</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" value="<%=titulo%>" required>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="upDiario">Arquivo PDF</label>
                            <input type="file" class="form-control" id="upDiario" name="upDiario" value="<%= anexo_diario %>" accept=".pdf" required>
                            <% 
                            ' Verifica se existe um anexo e exibe o link para o PDF
                            if anexo_diario <> "" then 
                            %>
                              <p>
                                <a href="upAnexos/<%= anexo_diario %>" target="_blank"><%= anexo_diario %></a>
                              </p>
                            <% 
                            end if 
                            %>
                        </div>
                        <div class="col-md-6">
                            <label for="status">Status</label>
                            <select class="form-control" id="statusDiario" name="statusDiario" required>
                              <option value="true" <% If status_diario = true Then %> selected <% End If %>>Ativo</option>
                              <option value="false" <% If status_diario = false Then %> selected <% End If %>>Inativo</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
            <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
            <button type="submit" onClick="<%if existe = 1 then%>return alterar()<%else%>return cadastrar()<%end if%>" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> <%if existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
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
        title: 'Diário Cadastrado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "2") {
      Swal.fire({
        icon: 'success',
        title: 'Diário Alterado com sucesso!',
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

      // Verificar se ainda há parâmetros na URL após a remoção de 'Resp'
      if (url.searchParams.toString() === '') {
        // Se não houver mais parâmetros, substitua a URL apenas pelo pathname
        window.history.replaceState(null, null, url.pathname);
      } else {
        // Caso contrário, substitua a URL com os parâmetros restantes
        window.history.replaceState(null, null, url);
      }
    }
  };
</script>
<!--#include file="footer.asp"-->