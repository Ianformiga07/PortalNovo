<!--#include file="base.asp"-->
<%
call abreConexao
%>

<script>
function cpfServidor() {
    var form = document.forms["frm_BuscaServ"];
    var cpfInput = document.getElementById("txtCPF").value; // Obtém o valor do CPF digitado
    form.CpfVisualizar.value = cpfInput; // Define o valor do campo hidden
    form.action = "cad-servidores.asp"; // Define a ação do formulário
    form.submit(); // Submete o formulário
}
</script>

<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-search text-blue"></i> Buscar Servidor
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <li><a href="diarias.asp">Administrador</a></li> /
      <span class="font-w-600">Buscar Servidor</span>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
        <!-- Form para buscar servidor -->
         <form action="sel-servidor.asp" method="post" name="frm_BuscaServ" class="d-flex align-items-end" onsubmit="event.preventDefault(); cpfServidor();">
            <input type="hidden" name="CpfVisualizar" id="CpfVisualizar">
            <div class="box-body d-flex">
                <div class="col-md-6">
                    <div class="form-group">
                    <label for="txtCPF">Buscar por CPF</label>
                    <input type="text" class="form-control" id="txtCPF" name="txtCPF" placeholder="Digite CPF" maxlength="14">
                    </div>
                </div>

                <div class="col-md-2">
                    <button type="submit" class="btn btn-success" style="margin-top: 25px;">Adicionar</button>
                </div>
            </div>
        </form>
        </div>
      </div>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->