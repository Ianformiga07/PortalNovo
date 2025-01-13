<!--#include file="base.asp"-->
<%
id_licitantes = Request("id_licitantes")
cnpjCpfLicitante = Request("cnpjCpfLicitante")

'response.write id_licitantes
'response.end

  call abreConexao
  if request("Operacao") = 1 or id_licitantes <> "" then 'Visualizar'
      sql = "SELECT * from cam_licitantes where cnpjCpfLicitante = '"&cnpjCpfLicitante&"'"
      'response.write sql
      'response.end
      set rsVisu = conn.execute(sql)
      if not rsVisu.eof then
        cnpjCpfLicitante = rsVisu("cnpjCpfLicitante")
        razaoSocial = rsVisu("razaoSocial")
        nomeFantasia = rsVisu("nomeFantasia")
        statusLicitante = rsVisu("statusLicitante")
        Motivo = rsVisu("Motivo")
        existe = 1
      end if
  END IF



call fechaConexao
%>
<script>

function validateCpfCnpj(input) {
  let value = input.value.replace(/\D/g, '');

  // Valida CPF
  if (value.length === 11) {
    if (!isValidCPF(value)) {
      Swal.fire({
        icon: 'error',
        title: 'CPF inválido!',
        text: 'Por favor, insira um CPF válido.',
        confirmButtonText: 'OK',
        timer: 3000
      }).then(() => {
        input.focus(); // Retorna o foco para o campo
      });
      return false;
    }
  }
  // Valida CNPJ
  else if (value.length === 14) {
    if (!isValidCNPJ(value)) {
      Swal.fire({
        icon: 'error',
        title: 'CNPJ inválido!',
        text: 'Por favor, insira um CNPJ válido.',
        confirmButtonText: 'OK',
        timer: 3000
      }).then(() => {
        input.focus(); // Retorna o foco para o campo
      });
      return false;
    }
  } else {
    Swal.fire({
      icon: 'error',
      title: 'Formato inválido!',
      text: 'O CPF deve ter 11 dígitos e o CNPJ, 14 dígitos.',
      confirmButtonText: 'OK',
      timer: 3000
    }).then(() => {
      input.focus(); // Retorna o foco para o campo
    });
    return false;
  }

  return true; // Validação OK
}

// Funções de validação do CPF e CNPJ (mantenha as já fornecidas ou ajuste se necessário)
function isValidCPF(cpf) {
  // Validação de CPF
  let soma = 0;
  let resto;
  if (cpf == "00000000000") return false;
  for (let i = 1; i <= 9; i++) soma = soma + parseInt(cpf.substring(i - 1, i)) * (11 - i);
  resto = (soma * 10) % 11;

  if (resto == 10 || resto == 11) resto = 0;
  if (resto != parseInt(cpf.substring(9, 10))) return false;

  soma = 0;
  for (let i = 1; i <= 10; i++) soma = soma + parseInt(cpf.substring(i - 1, i)) * (12 - i);
  resto = (soma * 10) % 11;

  if (resto == 10 || resto == 11) resto = 0;
  if (resto != parseInt(cpf.substring(10, 11))) return false;
  return true;
}

function isValidCNPJ(cnpj) {
  // Validação de CNPJ
  if (cnpj == "00000000000000" || cnpj.length != 14) return false;

  let tamanho = cnpj.length - 2;
  let numeros = cnpj.substring(0, tamanho);
  let digitos = cnpj.substring(tamanho);
  let soma = 0;
  let pos = tamanho - 7;

  for (let i = tamanho; i >= 1; i--) {
    soma += numeros.charAt(tamanho - i) * pos--;
    if (pos < 2) pos = 9;
  }

  let resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
  if (resultado != digitos.charAt(0)) return false;

  tamanho = tamanho + 1;
  numeros = cnpj.substring(0, tamanho);
  soma = 0;
  pos = tamanho - 7;

  for (let i = tamanho; i >= 1; i--) {
    soma += numeros.charAt(tamanho - i) * pos--;
    if (pos < 2) pos = 9;
  }

  resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
  if (resultado != digitos.charAt(1)) return false;

  return true;
}

  function applyCpfCnpjMask(input) {
    // Remove caracteres não numéricos
    let value = input.value.replace(/\D/g, '');

    // Aplica a máscara de CPF se tiver 11 dígitos
    if (value.length <= 11) {
      value = value.replace(/(\d{3})(\d)/, '$1.$2');
      value = value.replace(/(\d{3})(\d)/, '$1.$2');
      value = value.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
    } 
    // Aplica a máscara de CNPJ se tiver mais de 11 dígitos
    else {
      value = value.replace(/^(\d{2})(\d)/, '$1.$2');
      value = value.replace(/^(\d{2})\.(\d{3})(\d)/, '$1.$2.$3');
      value = value.replace(/\.(\d{3})(\d)/, '.$1/$2');
      value = value.replace(/(\d{4})(\d{1,2})$/, '$1-$2');
    }

    // Atualiza o valor no campo
    input.value = value;
  }

function cadastrar(){

    var form = document.forms["frmLicitantes"];
    form.Operacao.value = 2;
    form.action = "crud-licitantes.asp";
    form.submit();
}

function alterar(id_licitantes)
{
    //alert(id_licitantes)
    var form = document.forms["frmLicitantes"];
    form.Operacao.value = 3;
    form.action = "crud-licitantes.asp?id_licitantes="+id_licitantes;
    form.submit();
    
}

function verificar_cadastro()
{   //alert("oiii")
  document.frmLicitantes.Operacao.value = 1;
  document.frmLicitantes.id_licitantes.value = id_licitantes;
	document.frmLicitantes.action = "cad-licitantes.asp";
	document.frmLicitantes.submit();
}
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header --->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Licitantes
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Licitantes</a></li> /
          <span class="font-w-600">Cadastrar</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <form name="frmLicitantes" method="post">
            <input type="hidden" name="Operacao" id="Operacao">
            <input type="hidden" name="id_licitantes" id="id_licitantes" value="<%=id_licitantes%>">  
            <div class="box-body">
              <!-- Campos ocultos -->
              <div id="extra-fields" class="hidden-fields">
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-6">
                      <label for="cpf-cnpj">
                        CPF/CNPJ
                        <span class="text-red">*</span>
                      </label>
                      <input type="text" class="form-control form-group has-feedback" id="cnpjCpfLicitante" onblur="validateCpfCnpj(this)" name="cnpjCpfLicitante" oninput="applyCpfCnpjMask(this)" value="<%=cnpjCpfLicitante%>">
                    </div>
                    <div class="col-md-6">
                      <label for="razaoSocial">
                        Razão Social
                        <span class="text-red">*</span>
                      </label>
                      <input type="text" class="form-control" id="razaoSocial" name="razaoSocial" value="<%=razaoSocial%>">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-6">
                      <label for="nomeFantasia">
                        Nome Fantasia
                        <span class="text-red">*</span>
                      </label>
                      <input type="text" class="form-control" id="nomeFantasia" name="nomeFantasia" value="<%=nomeFantasia%>">
                    </div>
                    <%if existe = 1 then%>
                    <div class="col-md-6">
                      <label for="statusLicitante">
                        Status Licitante
                      </label>
                      <select class="form-control" id="statusLicitante" name="statusLicitante">
                        <option value="true" <%IF statusLicitante  = true THEN%> selected <%END IF%>>Ativo</option>
                        <option value="false" <%IF statusLicitante  = false THEN%> selected <%END IF%>>Inativo</option>
                      </select>
                    </div>
                    <%END IF%>
                  </div>
                </div>
                <div class="form-group">
                  <label for="motivo">Motivo</label>
                  <textarea class="form-control" id="motivo" name="motivo" rows="4" ><%=motivo%></textarea>
                </div>
              </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" class="form-btn btn btn-primary pull-right" onClick="<%IF existe = 1 THEN%>return alterar('<%=id_licitantes%>')<%ELSE%>return cadastrar()<%END IF%>"><i class="fa fa-fw fa-check"></i> <%if Existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
            </div>
          </form>
        </div>

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
