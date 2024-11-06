<!--#include file="base.asp"-->
<% Response.CodePage = 65001 %>
<%
    id_historia = Request("id_historia")

    call abreConexao

    ' Verifica se existe um registro
    sql = "SELECT COUNT(*) as total FROM cam_historia"
    set rs_count = conn.execute(sql)
    existeRegistro = rs_count("total") > 0

    if existeRegistro then
        ' Se existir, carrega as informações do registro
        sql = "SELECT id_historia, anoFundacao, diaAniversario, populacao, area, conteudo, UpCidade, UpBrasao, mesAniversario FROM cam_historia"
        set rs_historia = conn.execute(sql)

        id_historia = rs_historia("id_historia")
        anoFundacao = rs_historia("anoFundacao")
        diaAniversario = rs_historia("diaAniversario")
        populacao = rs_historia("populacao")
        area = rs_historia("area")
        conteudo = rs_historia("conteudo")
        UpCidade = rs_historia("UpCidade")
        UpBrasao = rs_historia("UpBrasao")
        mesAniversario = rs_historia("mesAniversario")

        ' Define uma operação de edição
        operacao = 2
    else
        ' Se não existir, inicializa as variáveis
        anoFundacao = ""
        diaAniversario = ""
        populacao = ""
        area = ""
        conteudo = ""
        UpCidade = ""
        UpBrasao = ""
        mesAniversario = ""

        ' Define uma operação de inserção
        operacao = 1
    end if
%>

    <script>
    function formatPopulation(input) {
        // Remove todos os caracteres que não sejam números
        let value = input.value.replace(/\D/g, '');
        
        // Adiciona pontos como separadores de milhar
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
        
        // Atualiza o valor do campo de entrada
        input.value = value;
    }


function validarCampos() {
    let anoFundacao = document.getElementById("anoFundacao").value.trim();
    let diaAniversario = document.getElementById("diaAniversario").value.trim();
    let mesAniversario = document.getElementById("mesAniversario").value.trim();
    let populacao = document.getElementById("populacao").value.trim();
    let area = document.getElementById("area").value.trim();
    let conteudo = document.getElementById("editor1").value.trim();

    if (!anoFundacao) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, preencha o campo "Ano de Fundação".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("anoFundacao").focus();
        });
        return false;
    }

    if (!diaAniversario) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, selecione o "Dia de Aniversário".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("diaAniversario").focus();
        });
        return false;
    }

    if (!mesAniversario) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, selecione o "Mês de Aniversário".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("mesAniversario").focus();
        });
        return false;
    }

    if (!populacao) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, preencha o campo "População".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("populacao").focus();
        });
        return false;
    }

    if (!area) {
        Swal.fire({
            icon: 'warning',
            title: 'Campo obrigatório',
            text: 'Por favor, preencha o campo "Área".',
            confirmButtonText: 'OK'
        }).then(() => {
            document.getElementById("area").focus();
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
            document.getElementById("editor1").focus();
        });
        return false;
    }

    return true;
}

      function cadastrar(){      

      var form = document.forms["frmHistoria"];
      form.Operacao.value = "2";
      form.enctype = "multipart/form-data";
      form.action = "teste1.asp";
      form.submit();

      }

    </script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-fw fa-check-square-o text-blue"></i> História
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">História</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
    <form role="form" name="frmHistoria" method="post">
        <input type="hidden" name="Operacao" id="Operacao">
        <input type="hidden" name="id_historia" id="id_historia" value="<%=id_historia%>">
        <div class="col-md-3">
            <!-- Primeira Imagem -->
            <div class="box box-primary">
                <div class="box-header with-border text-black-light">
                    <div class="box-title">Foto da Cidade</div>
                </div>
                <div class="box-body">
                    <img class="img-center img-thumbnail preview-posts-image" src=".\<%= UpCidade %>" style="height: 200px; width: 200px;">
                </div>
                <div class="box-footer">
                    <div class="box-header with-border">
                        <button type="button" class="btn-file btn btn-action-default btn-success" id="posts-image"><span class="fa fa-camera"></span> Foto</button>
                        <input type="file" class="posts-image" name="upCidade" name="upCidade" style="display: none" />
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
        <!-- Coluna da Imagem -->

            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Dados Pessoais</h3>
                </div>
                <!-- /.box-header -->

                <!-- form start -->

                <div class="box-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="anoFundacao">Ano de Fundação</label>
                                <input type="text" class="form-control" id="anoFundacao" name="anoFundacao" value="<%= anoFundacao %>">
                            </div>
                            <div class="col-md-2">
                                <label for="diaAniversario">Dia</label>
                                <select class="form-control" id="diaAniversario" name="diaAniversario">
                                    <option value="">Selecione o dia</option>
                                    <% 
                                    For i = 1 To 31 
                                        If i = diaAniversario Then 
                                            Response.Write("<option value='" & i & "' selected>" & i & "</option>")
                                        Else
                                            Response.Write("<option value='" & i & "'>" & i & "</option>")
                                        End If
                                    Next 
                                    %>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="mesAniversario">Mês de Aniversário</label>
                                <select class="form-control" id="mesAniversario" name="mesAniversario">
                                    <option value="">Selecione o mês</option>
                                    <% 
                                    Dim meses
                                    meses = Array("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")
                                    For j = 0 To UBound(meses)
                                        If meses(j) = mesAniversario Then 
                                            Response.Write("<option value='" & meses(j) & "' selected>" & meses(j) & "</option>")
                                        Else
                                            Response.Write("<option value='" & meses(j) & "'>" & meses(j) & "</option>")
                                        End If
                                    Next 
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="populacao">População</label>
                                 <input type="text" class="form-control" id="populacao" name="populacao" oninput="formatPopulation(this)" value="<%=populacao%>">
                            </div>
                            <div class="col-md-6">
                                <label for="area">Área (km²)</label>
                                <input type="text" class="form-control" id="area" name="area" value="<%=area%>">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>
                            Conteúdo
                            <span class="text-red-light">*</span>
                        </label>
                        <div class="box-body pad">
                            <textarea id="editor1" name="editor1" rows="10" cols="90">
                                <%=conteudo%>
                            </textarea>
                        </div>
                    </div>

                </div>

                <div class="box-footer">
                    <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                    <button type="submit" onClick="return cadastrar()" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> <%if existeRegistro then%>Alterar<%else%>Cadastrar<%end if%></button>
                </div>
                
            </div>
            <!-- /.box -->

          </div>
          <!-- /.nav-tabs-custom -->
        </div>
    </form>
    </section>
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
        title: 'História Cadastrado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    }else if (resp == "2"){
        Swal.fire({
        icon: 'success',
        title: 'História Alterada com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    }else if (resp == "3"){
        Swal.fire({
        icon: 'success',
        title: 'Dados Alterado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    }else if (resp == "4"){
        Swal.fire({
        icon: 'success',
        title: 'Dados Alterado com sucesso!',
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