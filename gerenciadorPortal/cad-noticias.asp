<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
<%
    ' Variáveis para carregar dados da notícia
    Dim id_noticia, titulo, subtitulo, conteudo, anexo_noticia, autor, destaque, operacao
    id_noticia = Request("id_noticia")
    no = Request("no")


    ' Abrindo conexão
    call abreConexao

    ' Inicializando variáveis
    titulo = ""
    subtitulo = ""
    conteudo = ""
    anexo_noticia = "" ' Caminho padrão caso não tenha imagem
    autor = ""
    destaque = ""
    statusNoticia = ""
    operacao = "inserir"

    ' Verificando se há um ID da notícia para editar
    If id_noticia <> "" Then
        ' Carregando os dados da notícia para edição
        sql = "SELECT * FROM cam_noticias WHERE id_noticia = " & id_noticia
        Set rs_noticia = conn.Execute(sql)

        If Not rs_noticia.EOF Then
            id_noticia = rs_noticia("id_noticia")
            titulo = rs_noticia("titulo")
            subtitulo = rs_noticia("subtitulo")
            conteudo = rs_noticia("conteudo")
            anexo_noticia = rs_noticia("anexo_noticia")
            autor = rs_noticia("autor")
            destaque = rs_noticia("destaque")
            statusNoticia = rs_noticia("statusNoticia")
            existe = 1
        End If
        rs_noticia.Close
    End If

    call fechaConexao


%>
  <script>
function validarCampos() {

    // Obtém o valor do ID da notícia para verificar se é um novo cadastro

    const titulo = document.getElementById("titulo").value.trim();
    const subtitulo = document.getElementById("subtitulo").value.trim();
    const conteudo = CKEDITOR.instances.editor1.getData().trim();
    const autor = document.getElementById("autor").value.trim();


    
    if (!titulo) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, preencha o campo "Título".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("titulo").focus();
        });
        return false;
    }
    if (!subtitulo) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, preencha o campo "Sub-Título".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("subtitulo").focus();
        });
        return false;
    }
    if (!conteudo) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, preencha o campo "Conteúdo".',
            confirmButtonText: 'OK'
        }).then(() => {
            CKEDITOR.instances.editor1.focus(); // Coloca o foco no editor CKEditor
        });
        return false;
    }
    if (!autor) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, preencha o campo "Autor".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("autor").focus();
        });
        return false;
    }
    return true;
}

    function cadastrar(){  
    if (validarCampos() == false) {
        return false;
    } 
    var form = document.forms["frmNoticia"];
    form.Operacao.value = "2";
    form.enctype = "multipart/form-data";
    form.action = "crud-noticias.asp";
    form.submit();
    }

    function alterar(){  
    if (validarCampos() == false) {
        return false;
    } 
    var form = document.forms["frmNoticia"];
    form.Operacao.value = "3";
    form.enctype = "multipart/form-data";
    form.action = "crud-noticias.asp";
    form.submit();
    }

  </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastro de Notícia
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Cadastro de Notícia</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
    <form role="form" name="frmNoticia" method="post">
        <input type="hidden" name="Operacao" id="Operacao">
        <input type="hidden" name="id_noticia" id="id_noticia" value="<%=id_noticia%>">
        <%if existe = 1 then%>
        <input type="hidden" name="anexo_noticia" id="anexo_noticia" value="<%=anexo_noticia%>">
        <%end if%>
        
            <div class="col-md-4">
                <!-- Primeira Imagem -->
                <div class="box box-primary">
                    <div class="box-header with-border text-black-light">
                        <div class="box-title">Capa da Notícia</div>
                    </div>
                    <div class="box-body">
                        <% If anexo_noticia <> "" Then %>
                        <img class="profile-user-img img-responsive preview-upNoticia" src="upNoticias/<%= anexo_noticia %>" style="height: 200px; width: 200px;">
                        <% Else %>
                        <img class="profile-user-img img-responsive preview-upNoticia" src="images/image.jpg" style="height: 200px; width: 200px;">
                        <% End If %>
                    </div>
                    <div class="box-footer">
                        <div class="box-header with-border">
                            <button type="button" class="btn-file btn btn-action-default btn-success pull-right" id="upNoticia"><span class="fa fa-camera"></span> Foto</button>
                            <input type="file" class="upNoticia" name="upNoticiabt" id="upNoticiabt" accept="image/*" style="display: none" />
                        </div>
                    </div>
                </div>
            </div>

        <!-- /.col -->
        <div class="col-md-8">
          <div class="nav-tabs-custom">
            <!-- general form elements -->
            <div class="box box-primary">
                <!-- /.box-header -->
                <!-- form start -->

                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="titulo">
                                        Título
                                        <span class="text-red">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="titulo" name="titulo" value="<%=titulo%>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="subtitulo">Subtitulo</label>
                                    <input type="text" class="form-control" id="subtitulo" name="subtitulo" value="<%=subtitulo%>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>
                                        Conteúdo
                                        <span class="text-red">*</span>
                                    </label>
                                    <div class="box-body pad">
                                        <textarea id="editor1" name="editor1" rows="10" class="form-control">
                                        <%=conteudo%>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6"> <!-- Ajuste a largura conforme necessário -->
                                    <label for="autor">Autor</label>
                                    <input type="text" class="form-control" id="autor" name="autor" value="<%=autor%>">
                                </div>
                                <%if existe = 1 then%>
                                <div class="col-md-6"> <!-- Ajuste a largura conforme necessário -->
                                    <label for="statusNoticia">
                                        Status Notícia
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-circle" <% If statusNoticia = true Then %> style="color: #28a745;" <% else %>style="color: #dc3545;"<% End If %>></i>
                                        </span>
                                        <select class="form-control" id="statusNoticia" name="statusNoticia" required="">
                                            <option value="">-- Selecione --</option>
                                            <option disabled=""></option>
                                            <option value="true" <% If statusNoticia = true Then %> selected <% End If %>>Ativo</option>
                                            <option value="false" <% If statusNoticia = false Then %> selected <% End If %>>Inativo</option>
                                        </select>
                                    </div>
                                </div>
                                <%end if%>
                            </div>
                        </div>
                        <div class="box-footer">
                            <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                            <button type="submit" onClick="<%if existe = 1 then%>return alterar()<%else%>return cadastrar()<%end if%>" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> <%if existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
                        </div> 
                    </div>
            </div>
            <!-- /.box -->

          </div>
          <!-- /.nav-tabs-custom -->
        </div>
    </form>
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
        title: 'Notícia Alterado com sucesso!',
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