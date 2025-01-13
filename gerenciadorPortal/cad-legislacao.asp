<!--#include file="base.asp"-->
<%
id_legislacao = Request("id_legislacao")

call abreConexao

if id_legislacao <> "" then
sql = "SELECT id_legislacao, id_categoriaLeg, descricao, dataPublicacao, anexo_legislacao, id_AutorVer, status_Leg, numeroDoc FROM cam_legislacao where id_legislacao = '"&id_legislacao&"'"
set rsReq = conn.Execute(sql)

    id_legislacao = rsReq("id_legislacao")
    id_categoriaLeg = rsReq("id_categoriaLeg")
    descricao = rsReq("descricao")
    anexo_legislacao = rsReq("anexo_legislacao")
    id_AutorVer = rsReq("id_AutorVer")
    status_Leg = rsReq("status_Leg")
    numeroDoc = rsReq("numeroDoc")
    dataPublicacao = rsReq("dataPublicacao")

    existe = 1
else
    id_legislacao = ""
    id_categoriaLeg = ""
    descricao = ""
    anexo_legislacao = ""
    id_AutorVer = ""
    status_Leg = ""
    numeroDoc = ""

    existe = 0
end if
call fechaConexao

%>
<script>
function validarCampos(isCadastro) {
    let CatLegislacao = document.getElementById("CatLegislacao").value.trim();
    let numeroDoc = document.getElementById("numeroDoc").value.trim();
    let descricao = document.getElementById("descricao").value.trim();
    let arquivoLeg = document.getElementById("arquivoLeg").value.trim();
    let verAutor = document.getElementById("verAutor").value.trim();


    if (!CatLegislacao) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, selecione o campo "Categoria".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("CatLegislacao").focus();
        });
        return false;
    }
    if (!numeroDoc) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, preencha o campo "Número Documento".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("numeroDoc").focus();
        });
        return false;
    }
    if (!descricao) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, preencha o campo "Descrição".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("descricao").focus();
        });
        return false;
    }
    if (isCadastro && !arquivoLeg) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, insira um arquivo no campo "Arquivo PDF".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("arquivoLeg").focus();
        });
        return false;
    }
    if (!verAutor) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, selecione o campo "Autor".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("verAutor").focus();
        });
        return false;
    }

    return true;
}


  function cadastrar() {

    if (!validarCampos(true)) { // Passa "true" para indicar que é um cadastro
        return false;
    } 

      var form = document.forms["frmCadLeg"];
      form.Operacao.value = "2";
      form.enctype = "multipart/form-data";
      form.action = "crud-legislacao.asp";
      form.submit();
  }
  function alterar() {

    if (!validarCampos(false)) { // Passa "false" para indicar que é uma alteração
        return false;
    } 

      var form = document.forms["frmCadLeg"];
      form.Operacao.value = "3";
      form.enctype = "multipart/form-data";
      form.action = "crud-legislacao.asp";
      form.submit();
  }
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Legislação
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Legislação</a></li> /
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
          <form role="form" name="frmCadLeg" method="post">
              <input type="hidden" name="Operacao" id="Operacao">
              <input type="hidden" name="id_legislacao" id="id_legislacao" value="<%=id_legislacao%>">
            <div class="box-body">
                <div class="form-group">
                    <%
                    call abreConexao 
                    sql = "SELECT * FROM cam_categoriaLeg where id_categoriaLeg IN (1,2,3,4,5,6,7,8,9,10) ORDER BY id_categoriaLeg"
                    set rs_catLeg = conn.execute(sql) 
                    %> 
                    <div class="row">
                        <div class="col-md-4">
                            <label for="CatLegislacao">Categoria</label>
                            <select class="form-control" id="CatLegislacao" name="CatLegislacao" required>
                                <option value="">-- Selecionar --</option>
                                <option value=""></option>
                            <%do while not rs_catLeg.eof%>
                                <option <%if  rtrim(id_categoriaLeg) = rtrim(rs_catLeg("id_categoriaLeg")) then response.write("selected") end if%> value="<%=rs_catLeg("id_categoriaLeg")%>"><%=rs_catLeg("descricao")%></option>
                            <% rs_catLeg.movenext 
                            loop 
                            call fechaConexao
                            %>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="numeroDoc">Número Documento</label>
                            <input type="text" class="form-control" id="numeroDoc" name="numeroDoc" value="<%=numeroDoc%>" required>
                        </div>
                        <div class="col-md-4">
                            <label for="dataPublicacao">Data da Publicação</label>
                            <input type="text" class="form-control" id="dataPublicacao" name="dataPublicacao" value="<%=dataPublicacao%>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="descricao">Descricao</label>
                            <input type="text" class="form-control" id="descricao" name="descricao" value="<%=descricao%>" required>
                        </div>
                        <div class="col-md-6">
                            <label for="arquivoLeg">Arquivo PDF</label>
                            <input type="file" class="form-control" id="arquivoLeg" name="arquivoLeg" accept=".pdf">
                            <% 
                            ' Verifica se existe um anexo e exibe o link para o PDF
                            if anexo_legislacao <> "" then 
                            %>
                                <p>
                                <a href="upAnexos/<%= anexo_legislacao %>" target="_blank"><%= anexo_legislacao %></a>
                                </p>
                            <% 
                            end if 
                            %>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                    <%
                    call abreConexao 
                    sql = "SELECT  id_servidor, CPF, NomeCompleto, id_Cargo FROM cam_servidores WHERE  (id_Cargo = 15)"
                    set rs_verAutor = conn.execute(sql) 
                    %> 
                        <div class="col-md-6">
                            <label for="verAutor">Autor</label>
                            <select class="form-control" id="verAutor" name="verAutor" required>
                                <option value="">-- Selecionar --</option>
                                <option value=""></option>
                            <%do while not rs_verAutor.eof%>
                                <option <%if  rtrim(id_AutorVer) = rtrim(rs_verAutor("id_servidor")) then response.write("selected") end if%> value="<%=rs_verAutor("id_servidor")%>"><%=rs_verAutor("NomeCompleto")%></option>
                            <% rs_verAutor.movenext 
                            loop 
                            call fechaConexao
                            %>
                            </select>
                        </div>
                        <%if existe = 1 then%>
                        <div class="col-md-6">
                            <label for="statusLeg">Status</label>
                            <select class="form-control" id="statusLeg" name="statusLeg" required>
                                <option disabled=""></option>
                                <option value="true" <% If status_Leg = true Then %> selected <% End If %>>Ativo</option>
                                <option value="false" <% If status_Leg = false Then %> selected <% End If %>>Inativo</option>
                            </select>
                        </div>
                        <%end if%>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary"><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" class="btn btn-primary pull-right" onClick="<%if existe = 1 then%>return alterar()<%else%>return cadastrar()<%end if%>"><i class="fa fa-check"></i><%if existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
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

    if (resp == "2") {
      Swal.fire({
        icon: 'success',
        title: 'Dados Alterados com sucesso!',
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