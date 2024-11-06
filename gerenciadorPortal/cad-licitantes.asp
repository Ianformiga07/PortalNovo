<!--#include file="base.asp"-->
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
          <form role="form" action="cadastrar_diario_oficial.asp" method="post" enctype="multipart/form-data">
            <div class="box-body">
              <div class="form-group">
                <div class="row">
                  <div class="col-md-3">
                    <label for="select-licitacao">
                      Selecione a Licitação
                      <span class="text-red">*</span>
                    </label>
                    <select class="form-control" id="select-licitacao" name="licitacao" required>
                      <option value="">-- Selecionar --</option>
                      <option value="1">Licitação 1</option>
                      <option value="2">Licitação 2</option>
                      <option value="3">Licitação 3</option>
                    </select>
                  </div>
                </div>
              </div>

              <!-- Campos ocultos -->
              <div id="extra-fields" class="hidden-fields">
                <div class="form-group">
                  <div class="row">
                    <div class="col-md-6">
                      <label for="fornecedor">
                        Fornecedor
                        <span class="text-red">*</span>
                      </label>
                      <input type="text" class="form-control" id="fornecedor" name="fornecedor" placeholder="Digite o nome do fornecedor" required>
                    </div>
                    <div class="col-md-3">
                      <label for="cpf-cnpj">
                        CPF/CNPJ
                        <span class="text-red">*</span>
                      </label>
                      <input type="text" class="form-control" id="cpf-cnpj" name="cpf_cnpj" placeholder="Digite o CPF/CNPJ" required>
                    </div>
                    <div class="col-md-3">
                      <label for="habilitado">
                        Habilitado
                        <span class="text-red">*</span>
                      </label>
                      <select class="form-control" id="habilitado" name="habilitado" required>
                        <option value="">-- Selecionar --</option>
                        <option value="1">SIM</option>
                        <option value="0">NÃO</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="description">Motivo</label>
                  <textarea class="form-control" id="description" name="description" rows="4" placeholder="Digite um Motivo"></textarea>
                </div>
              </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <a href="#" class="btn btn-primary"><i class="fa fa-reply"></i> Voltar</a>
              <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-check"></i> Cadastrar</button>
            </div>
          </form>
        </div>

        <div class="box box-primary">
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Fornecedor</th>
                  <th>CPF/CNPJ</th>
                  <th>Habilitado</th>
                  <th>Motivo</th>
                  <th>Ação</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>APPMAKE SOLUÇÕES TECNOLÓGICAS LTDA-ME</td>
                  <td>18669921000107</td>
                  <td>SIM</td>
                  <td></td>
                  <td>
                    <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
        </div>
        <!-- /.box -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
<!--#include file="footer.asp"-->

<!-- JavaScript para exibir os campos -->
<script>
  document.getElementById('select-licitacao').addEventListener('change', function() {
    var extraFields = document.getElementById('extra-fields');
    if (this.value !== "") {
      extraFields.style.display = 'block'; // Mostra os campos adicionais
    } else {
      extraFields.style.display = 'none'; // Oculta os campos adicionais
    }
  });
</script>

<style>
  .hidden-fields {
    display: none; /* Oculta os campos inicialmente */
  }
</style>