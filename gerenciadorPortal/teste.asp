<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="base.asp"-->
<%
call abreConexao
  sql = "SELECT * FROM cam_servidores inner join cam_cargos on cam_cargos.id_cargo = cam_servidores.id_Cargo inner join cam_departamento on cam_departamento.id_Departamento = cam_servidores.id_Departamento where statusServidor = 1"
  set rs_admin = conn.execute(sql)
%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-edit text-blue"></i> Servidores
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <span class="font-w-600">Servidores</span>
    </ol>
  </section>

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
                             <% If rs_admin("statusServidor") = true Then Response.Write("checked") End If %> 
                             onchange="confirmToggleStatus('<%= rs_admin("Matricula") %>', this.checked)">
                      <span class="slider round"></span>
                    </label>
                  </td>
                  <td>
                    <a href="#" data-skin="skin-blue" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i></a>
                    <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
              <% rs_admin.movenext 
                loop 
              %>  
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

<!-- SweetAlert para confirmação -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
  function confirmToggleStatus(matricula, newStatus) {
    var statusText = newStatus ? "Ativar" : "Desativar";

    Swal.fire({
      title: 'Tem certeza?',
      text: "Você quer " + statusText + " este servidor?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sim, ' + statusText
    }).then((result) => {
      if (result.isConfirmed) {
        toggleStatus(matricula, newStatus);
      } else {
        // Reverter o estado do switch se o usuário cancelar
        document.querySelector('input[type="checkbox"][onchange="confirmToggleStatus(\'' + matricula + '\', this.checked)"]').checked = !newStatus;
      }
    });
  }

  function toggleStatus(matricula, status) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "atualizarStatus.asp", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        Swal.fire('Status alterado!', '', 'success');
      }
    };
    xhr.send("matricula=" + matricula + "&status=" + (status ? 1 : 0));
  }
</script>

<!-- CSS do Switch -->
<style>
  .switch {
    position: relative;
    display: inline-block;
    width: 60px;
    height: 34px;
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
    border-radius: 34px;
  }
  .slider:before {
    position: absolute;
    content: "";
    height: 26px;
    width: 26px;
    left: 4px;
    bottom: 4px;
    background-color: white;
    transition: .4s;
    border-radius: 50%;
  }
  input:checked + .slider {
    background-color: #4CAF50;
  }
  input:checked + .slider:before {
    transform: translateX(26px);
  }
</style>
<!--#include file="footer.asp"-->