<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="base.asp"-->
<%
call abreConexao
sql = "SELECT * FROM cam_servidores INNER JOIN cam_cargos ON cam_cargos.id_cargo = cam_servidores.id_Cargo INNER JOIN cam_departamento ON cam_departamento.id_Departamento = cam_servidores.id_Departamento order by statusServidor"
set rs_admin = conn.execute(sql)

if Request("Operacao") = 3 then 'Desativar
    sql = "UPDATE cam_servidores SET statusServidor = 0 WHERE CPF = '" & Request("CPF") & "'"
    conn.execute(sql)
    Response.Redirect "list-servidores.asp?Resp=4" ' Mensagem de sucesso
end if

if Request("Operacao") = 2 then ' Ativar
    sql = "UPDATE cam_servidores SET statusServidor = 1 WHERE CPF = '" & Request("CPF") & "'"
    conn.execute(sql)
    Response.Redirect "list-servidores.asp?Resp=3" ' Mensagem de sucesso
end if
%>

<!-- CSS para o Toggle -->
<style>
.switch {
  position: relative;
  display: inline-block;
  width: 50px;
  height: 24px;
}

.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 18px;
  width: 18px;
  left: 3px;
  bottom: 3px;
  background-color: white;
  transition: .4s;
}

input:checked + .slider {
  background-color: #4CAF50;
}

input:checked + .slider:before {
  transform: translateX(26px);
}

.slider.round {
  border-radius: 24px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>

<script>
function Ver_alterar(CPF)
{
    var form = document.forms["AltServidor"];
    form.CPF.value = CPF;
    form.Operacao.value = 1;
    form.action = "cad-servidores.asp";
    form.submit();
}

function confirmToggle(CPF, isChecked) {
    const action = isChecked ? 'ativar' : 'desativar';
    
    Swal.fire({
        title: `Você tem certeza que deseja ${action} este servidor?`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Sim',
        cancelButtonText: 'Não'
    }).then((result) => {
        if (result.isConfirmed) {
            const form = document.forms["AltServidor"];
            form.CPF.value = CPF;
            form.Operacao.value = isChecked ? 2 : 3; // 2 para ativar, 3 para desativar
            form.action = "list-servidores.asp";
            form.submit();
        } else {
            // Caso o usuário cancele, reverte o toggle
            document.getElementById(`toggle_${CPF}`).checked = !isChecked;
        }
    });
}
</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header -->
    <section class="content-header bg-white p-bottom-5">
        <h1 class="font-w-300">
            <i class="fa fa-edit text-blue"></i> Servidores
        </h1>
        <ol class="breadcrumb font-s-1">
            <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
            <span class="font-w-600">Servidores</span>
        </ol>
    </section>
    <form method="POST" id="AltServidor">
        <input type="hidden" name="BotaoVoltar">
        <input type="hidden" name="CPF" id="CPF">
        <input type="hidden" name="Operacao" id="Operacao">
    </form>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-primary">
                    <div class="box-footer">
                        <a href="cad-servidores.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Cadastro</a>
                    </div>

                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <%if rs_admin.eof then%>
                                <div class="alert alert-danger alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                                    Não há servidores cadastrados na base de dados.
                                </div>
                            <%Else%>
                            <thead>
                                <tr>
                                    <th>Matrícula</th>
                                    <th>CPF</th>
                                    <th>Nome</th>
                                    <th>Cargo</th>
                                    <th>Departamento</th>
                                    <th>Status</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%do while not rs_admin.eof %>
                                <tr>
                                    <td><%=rs_admin("Matricula")%></td>
                                    <td><%=rs_admin("CPF")%></td>
                                    <td><%=rs_admin("NomeCompleto")%></td>
                                    <td><%=rs_admin("desc_Cargo")%></td>
                                    <td><%=rs_admin("desc_Departamento")%></td>
                                    <td>
                                        <label class="switch">
                                            <input type="checkbox" 
                                                   onchange="confirmToggle('<%=rs_admin("CPF")%>', this.checked)" 
                                                   <% if rs_admin("statusServidor") = true then %>checked<% end if %> 
                                                   id="toggle_<%=rs_admin("CPF")%>">
                                            <span class="slider round"></span>
                                        </label>
                                        <span class="toggle-label">
                                            <%
                                            if rs_admin("statusServidor") = true then
                                                response.write "Ativo"
                                            else
                                                response.write "Inativo"
                                            end if
                                            %>
                                        </span>
                                    </td>
                                    <td>
                                        <a href="#" onClick="Ver_alterar('<%=rs_admin("CPF")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                                    </td>
                                </tr>
                                <% rs_admin.movenext 
                                loop %>  
                            </tbody>
                            <%end if%>
                            <%call fechaConexao%>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
</div>

<!-- Campo hidden para o valor de Resp -->
<input type="hidden" id="hiddenResp" value="<%= Request("Resp") %>">

<!-- SweetAlert e script para limpar URL -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  window.onload = function() {
    var resp = document.getElementById('hiddenResp').value;

    if (resp == "3") {
      Swal.fire({
        icon: 'success',
        title: 'Servidor ativado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "4") {
      Swal.fire({
        icon: 'success',
        title: 'Servidor desativado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "1") {
      Swal.fire({
        icon: 'success',
        title: 'Servidor Cadastrado com sucesso!',
        showConfirmButton: false,
        timer: 3000,
        position: 'top-end',
        toast: false,
        width: '30rem'
      });
    } else if (resp == "2") {
      Swal.fire({
        icon: 'success',
        title: 'Servidor Alterado com sucesso!',
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
      window.history.replaceState(null, null, url);
    }
  };
</script>
<!--#include file="footer.asp"-->