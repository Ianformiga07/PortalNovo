<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Licitação
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Licitação</a></li> /
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
                        <div class="col-md-3">
                            <label for="titulo">Nº Contrato</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Digite o título" required>
                        </div>
                        <div class="col-md-3">
                            <label for="titulo">Inicio da Vigência</label>
                            <input type="date" class="form-control" id="titulo" name="titulo" placeholder="Digite o título" required>
                        </div>
                        <div class="col-md-3">
                            <label for="titulo">Fim da Vigência</label>
                            <input type="date" class="form-control" id="titulo" name="titulo" placeholder="Digite o título" required>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3">
                            <label for="titulo">Valor da Estimado</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Digite o título" required>
                        </div>
                        <div class="col-md-5">
                            <label for="titulo">Fornecedor</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="">-- Selecionar --</option>
                                <option value="0">APPMAKE SOLUÇÕES TECNOLÓGICAS</option>
                                <option value="1">NORRIS INFORCELL</option>
                                <option value="2">EMPREITADA POR PREÇO GLOBAL</option>
                                <option value="3">NÃO SE APLICA</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="status">Fiscal de Contrato</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="">-- Selecionar --</option>
                                <option value="0">DEBORA CARVALHO DE ALMEIDA</option>
                                <option value="1">EMPREITADA POR PREÇO UNITÁRIO</option>
                                <option value="2">EMPREITADA POR PREÇO GLOBAL</option>
                                <option value="3">NÃO SE APLICA</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="description">Objeto</label>
                            <textarea class="form-control" id="description" name="description" rows="4" placeholder="Digite uma descrição para o Objeto"></textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="arquivo">Arquivo PDF</label>
                            <input type="file" class="form-control" id="arquivo" name="arquivo" accept=".pdf" required>
                        </div>
                        <div class="col-md-6">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="Ativo">Ativo</option>
                                <option value="Inativo">Inativo</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
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
</div>
<!--#include file="footer.asp"-->