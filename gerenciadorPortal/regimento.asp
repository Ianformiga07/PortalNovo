<!--#include file="base.asp"-->
<%
idRegimento = Request("idRegimento")
call abreConexao
sql = "SELECT TOP(1) id_regimento, titulo, descricao, anexo_regimento, data_cad, idUsu_Cad, idUsu_Alt, data_Alt FROM cam_regimento"
set rsReq = conn.Execute(sql)
if not rsReq.eof then

end if
call fechaConexao
%>
<script>
  function cadastrar(){

      var form = document.forms["frmRegimento"];
      form.Operacao.value = "2";
      form.enctype = "multipart/form-data";
      form.action = "crud-regimento.asp";
      form.submit();
  }
</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-fw fa-check-square-o text-blue"></i> Regimento Interno
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Regimento Interno</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <div class="row">
      <!-- /.col -->
      <div class="col-md-12">
        <div class="nav-tabs-custom">
          <!-- general form elements -->
          <div class="box box-primary">
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" method="post" name="frmRegimento">
              <input type="hidden" name="Operacao" id="Operacao">
              <div class="box-body">
                <div class="form-group">
                  <label for="title">Título</label>
                  <input type="text" class="form-control" id="title" name="title" placeholder="Digite o título do Regimento Interno" required>
                </div>
                <div class="form-group">
                  <label for="description">Descrição</label>
                  <textarea class="form-control" id="description" name="description" rows="4" placeholder="Digite uma descrição opcional para o Regimento Interno"></textarea>
                </div>
                <div class="form-group">
                  <label for="upload">Arquivo PDF</label>
                  <input type="file" class="form-control" id="UpRegimento" name="UpRegimento" accept=".pdf" required>
                  <p class="help-block">Escolha o arquivo PDF do Regimento Interno.</p>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                  <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                  <button type="submit" class="btn btn-primary pull-right" onClick="return cadastrar()"><i class="fa fa-check"></i> Cadastrar</button>
              </div>
            </form>
          </div>
          <!-- /.box -->

        </div>
        <!-- /.nav-tabs-custom -->
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
        title: 'Regimento Cadastrado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    }else if (resp == "2"){
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