<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-archive text-blue"></i> Cadastro de Patrimônio
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Cadastro de Patrimônio</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- Formulário de Cadastro de Patrimônio -->
          <form action="salvar-patrimonio.asp" method="POST">
            <div class="box-body">
              <div class="row">
                <!-- Número do Patrimônio e Valor lado a lado -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="numeroPatrimonio">Número do Patrimônio</label>
                    <input type="text" class="form-control" id="numeroPatrimonio" name="numeroPatrimonio" placeholder="Ex: 2024/001" required>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="valorPatrimonio">Valor do Patrimônio</label>
                    <input type="text" class="form-control" id="valorPatrimonio" name="valorPatrimonio" placeholder="Ex: R$ 50.000,00" required>
                  </div>
                </div>
              </div>

              <!-- Data de Aquisição e Estado de Conservação lado a lado -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="dataAquisicao">Data de Aquisição</label>
                    <input type="date" class="form-control" id="dataAquisicao" name="dataAquisicao" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="estadoConservacao">Estado de Conservação</label>
                    <select class="form-control" id="estadoConservacao" name="estadoConservacao" required>
                      <option value="Novo">Novo</option>
                      <option value="Bom">Bom</option>
                      <option value="Regular">Regular</option>
                      <option value="Ruim">Ruim</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="statusPatrimonio">Status</label>
                    <select class="form-control" id="statusPatrimonio" name="statusPatrimonio" required>
                    <option value="Ativo">Ativo</option>
                    <option value="Inativo">Inativo</option>
                    <option value="Alienado">Alienado</option>
                    </select>
                  </div>
                </div>
              </div>

              <!-- Descrição do Patrimônio (Campo Único) -->
              <div class="form-group">
                <label for="descricaoPatrimonio">Descrição do Patrimônio</label>
                <textarea class="form-control" id="descricaoPatrimonio" name="descricaoPatrimonio" placeholder="Descrição detalhada do patrimônio" required></textarea>
              </div>

              <!-- Status -->
              <div class="form-group">

              </div>
            </div>

            <!-- Botão de submissão -->
            <div class="box-footer">
              <button type="submit" class="btn btn-primary">Cadastrar Patrimônio</button>
              <a href="listar-patrimonios.asp" class="btn btn-default">Cancelar</a>
            </div>
          </form>
        </div>
        <!-- /.box -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>

</div>

<!--#include file="footer.asp"-->