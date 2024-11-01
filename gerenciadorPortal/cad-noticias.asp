<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
<%
    id_noticia = Request("id_noticia")

    'response.write "Id: "& id_noticia
    'response.end
    if id_noticia <> "" then

        call abreConexao
        ' Verifica se existe um registro
        sql = "SELECT COUNT(*) as total FROM cam_noticias"
        set rs_count = conn.execute(sql)
        existeRegistro = rs_count("total") > 0

        if existeRegistro then
            ' Se existir, carrega as informações do registro
            sql = "SELECT * FROM cam_noticias ORDER BY id_noticia"
            set rs_noticia = conn.execute(sql)

            id_noticia = rs_noticia("id_noticia")
            titulo = rs_noticia("titulo")
            subtitulo = rs_noticia("subtitulo")
            conteudo = rs_noticia("conteudo")
            anexo_noticia = rs_noticia("anexo_noticia")
            autor = rs_noticia("autor")
            destaque = rs_noticia("destaque")

            ' Define uma operação de edição
            operacao = 2
        else
            ' Se não existir, inicializa as variáveis
            id_noticia = ""
            titulo = ""
            subtitulo = ""
            conteudo = ""
            anexo_noticia = ""
            autor = ""
            destaque = ""

            ' Define uma operação de inserção
            operacao = 1
        end if
    else
        call abreConexao
            ' Se existir, carrega as informações do registro
        sql = "SELECT * FROM cam_noticias where id_noticia = '"&id_noticia&"' ORDER BY id_noticia"
        'response.write sql
        'response.end
        set rs_noticia = conn.execute(sql)
        if not rs_noticia.eof then
        id_noticia = rs_noticia("id_noticia")
        titulo = rs_noticia("titulo")
        subtitulo = rs_noticia("subtitulo")
        conteudo = rs_noticia("conteudo")
        anexo_noticia = rs_noticia("anexo_noticia")
        autor = rs_noticia("autor")
        destaque = rs_noticia("destaque")
        end if
    end if
%>
  <script>
    function cadastrar(){  

    var form = document.forms["frmNoticia"];
    form.Operacao.value = "2";
    form.action = "crud-noticias.asp";
    form.submit();
    }

    function alterar(){  
    if (validarCampos() == false) {
        return false;
    } 

    var form = document.forms["frmDiario"];
    form.Operacao.value = "3";
    form.enctype = "multipart/form-data";
    form.action = "crud-diario.asp";
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

        <!-- /.col -->
        <div class="col-md-8">
          <div class="nav-tabs-custom">
            <!-- general form elements -->
            <div class="box box-primary">
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" name="frmNoticia" method="post">
                  <input type="hidden" name="Operacao" id="Operacao">
                  <input type="hidden" name="id_noticia" id="id_noticia" value="<%=id_noticia%>">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="titulo">
                                        Título
                                        <span class="text-red">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="titulo" name="titulo" >
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="subtitulo">Subtitulo</label>
                                    <input type="text" class="form-control" id="subtitulo" name="subtitulo">
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
                                        <textarea id="editor1" name="editor1" rows="10" class="form-control" >
                                            
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-8"> <!-- Ajuste a largura conforme necessário -->
                                    <label for="autor">Autor</label>
                                    <input type="text" class="form-control" id="autor" name="autor">
                                </div>
                                <div class="col-md-4"> <!-- Ajuste a largura conforme necessário -->
                                    <label for="destaque">
                                        Destaque
                                        <span class="text-red-light" style="color: red;">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="fa fa-star"></i>
                                        </span>
                                        <select class="form-control" id="destaque" name="destaque" required="">
                                            <option value="">-- Selecione --</option>
                                            <option disabled=""></option>
                                            <option value="1">Sim</option>
                                            <option value="2">Não</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                            <button type="submit" onClick="return cadastrar()" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> <%if existeRegistro then%>Alterar<%else%>Cadastrar<%end if%></button>
                        </div> 
                    </div>
                </form>
            </div>
            <!-- /.box -->

          </div>
          <!-- /.nav-tabs-custom -->
        </div>

        <div class="col-md-4">

            <!-- Primeira Imagem -->
            <div class="box box-primary">
                <div class="box-header with-border text-black-light">
                    <div class="box-title">Capa da Notícia</div>
                </div>
                <div class="box-body">
                    <% If id_noticia <> "" Then %>
                    <img class="profile-user-img img-responsive" src=".\<%= anexo_noticia %>" style="height: 200px; width: 200px;">
                    <% Else %>
                    <img class="profile-user-img img-responsive" src="images/image.jpg" style="height: 200px; width: 200px;">
                    <% End If %>
                </div>
                <div class="box-footer">
                    <button class="btn-file btn btn-success pull-right" id="users-image" data-toggle="modal" data-target="#uploadPhotoModal1">
                        <span class="fa fa-camera"></span> Foto
                    </button>
                </div>
            </div>
        </div>

        <!-- Modais para as Imagens -->
        <div class="modal fade" id="uploadPhotoModal1" tabindex="-1" role="dialog" aria-labelledby="uploadPhotoModalLabel1" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="uploadPhotoModalLabel1">Carregar Foto da Notícia</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="uploadPhotoForm1" action="upFotoNoticia.asp?id_noticia=<%=id_noticia%>&Operacao=4" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="fileInput">Escolha uma imagem:</label>
                                <input type="file" class="form-control" id="upNoticia" name="upNoticia" accept="image/*" required>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" form="uploadPhotoForm1" class="btn btn-primary">Carregar</button>
                    </div>
                </div>
            </div>
        </div>

      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

  </div>

<!--#include file="footer.asp"-->