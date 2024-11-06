<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-file-contract text-blue"></i> Cadastrar Convênios e Instrumentos Congêneres
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="convenios.asp">Convênios</a></li> /
          <span class="font-w-600">Cadastrar</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- /.box-header -->
          <!-- form start -->
          <form role="form" action="cadastrar_convenio.asp" method="post" enctype="multipart/form-data">
            <div class="box-body">
                <!-- Dados do Convênio -->
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="convenio-numero">Número do Convênio</label>
                            <input type="text" class="form-control" id="convenio-numero" name="convenio_numero" placeholder="Digite o número do convênio" required>
                        </div>
                        <div class="col-md-6">
                            <label for="convenio-objeto">Objeto do Convênio</label>
                            <input type="text" class="form-control" id="convenio-objeto" name="convenio_objeto" placeholder="Descreva o objeto do convênio" required>
                        </div>
                    </div>
                </div>
                
                <!-- Partes Envolvidas -->
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="parte-1">Parte 1 (Câmara Municipal)</label>
                            <input type="text" class="form-control" id="parte-1" name="parte_1" value="Câmara Municipal" readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="parte-2">Parte 2 (Convenente)</label>
                            <input type="text" class="form-control" id="parte-2" name="parte_2" placeholder="Nome do convenente" required>
                        </div>
                    </div>
                </div>
                
                <!-- Vigência -->
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="data-inicio">Data de Início</label>
                            <input type="date" class="form-control" id="data-inicio" name="data_inicio" required>
                        </div>
                        <div class="col-md-6">
                            <label for="data-termino">Data de Término</label>
                            <input type="date" class="form-control" id="data-termino" name="data_termino" required>
                        </div>
                    </div>
                </div>

                <!-- Valores -->
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="valor-total">Valor Total (R$)</label>
                            <input type="text" class="form-control" id="valor-total" name="valor_total" placeholder="Ex.: 10000,00" required>
                        </div>
                        <div class="col-md-4">
                            <label for="valor-repasse">Valor de Repasse (R$)</label>
                            <input type="text" class="form-control" id="valor-repasse" name="valor_repasse" placeholder="Ex.: 8000,00" required>
                        </div>
                        <div class="col-md-4">
                            <label for="valor-contrapartida">Valor de Contrapartida (R$)</label>
                            <input type="text" class="form-control" id="valor-contrapartida" name="valor_contrapartida" placeholder="Ex.: 2000,00" required>
                        </div>
                    </div>
                </div>

                <!-- Arquivo do Convênio -->
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="arquivo">Anexar Convênio (PDF)</label>
                            <input type="file" class="form-control" id="arquivo" name="arquivo" accept=".pdf" required>
                        </div>
                        <div class="col-md-6">
                            <label for="status">Status do Convênio</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="">-- Selecionar --</option>
                                <option value="Ativo">Ativo</option>
                                <option value="Inativo">Inativo</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <a href="convenios.asp" class="btn btn-primary"><i class="fa fa-reply"></i> Voltar</a>
              <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-check"></i> Cadastrar</button>
            </div>
          </form>
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