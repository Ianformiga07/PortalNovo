<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-building text-blue"></i> Cadastro de Obras
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Cadastro de Obras</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- Formulário de Cadastro de Obras -->
          <form action="salvar-obra.asp" method="POST">
            <div class="box-body">
              <div class="row">
                <!-- Número da Obra e Valor da Obra lado a lado -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="numeroObra">Número da Obra</label>
                    <input type="text" class="form-control" id="numeroObra" name="numeroObra" placeholder="Ex: 2024/001" required>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="valorObra">Valor da Obra</label>
                    <input type="text" class="form-control" id="valorObra" name="valorObra" placeholder="Ex: R$ 1.500.000,00" required>
                  </div>
                </div>
              </div>

              <!-- Data de Início e Prazo de Conclusão lado a lado -->
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="dataInicio">Data de Início</label>
                    <input type="date" class="form-control" id="dataInicio" name="dataInicio" required>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="prazoConclusao">Prazo de Conclusão</label>
                    <input type="date" class="form-control" id="prazoConclusao" name="prazoConclusao" required>
                  </div>
                </div>
              </div>

              <!-- Descrição da Obra (Campo Único) -->
              <div class="form-group">
                <label for="descricaoObra">Descrição da Obra</label>
                <textarea class="form-control" id="descricaoObra" name="descricaoObra" placeholder="Descrição detalhada da obra" required></textarea>
              </div>

              <!-- Status -->
              <div class="form-group">
                <label for="statusObra">Status</label>
                <select class="form-control" id="statusObra" name="statusObra" required>
                  <option value="Em Andamento">Em Andamento</option>
                  <option value="Concluída">Concluída</option>
                  <option value="Paralisada">Paralisada</option>
                </select>
              </div>
            </div>

            <!-- Botão de submissão -->
            <div class="box-footer">
              <button type="submit" class="btn btn-primary">Cadastrar Obra</button>
              <a href="listar-obras.asp" class="btn btn-default">Cancelar</a>
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