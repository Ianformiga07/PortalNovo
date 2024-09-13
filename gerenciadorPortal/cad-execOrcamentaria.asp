<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Execução Orçamentária</a></li> /
          <span class="font-w-600">Cadastrar </span>
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
                        <div class="col-md-6">
                            <label for="status">Categoria</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="">-- Selecionar --</option>
                                <option value="1">PPA - Plano Plurianual</option>
                                <option value="1">LDO – Lei de Diretrizes Orçamentárias</option>
                                <option value="1">LOA – Lei Orçamentária Anual</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="dataPublicacao">Data da Publicação</label>
                            <input type="date" class="form-control" id="dataPublicacao" name="dataPublicacao" required>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="titulo">Descricao</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Digite o título" required>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="arquivo">Arquivo PDF</label>
                            <input type="file" class="form-control" id="arquivo" name="arquivo" accept=".pdf" required>
                        </div>
                        <div class="col-md-4">
                            <label for="status">Autor</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="">-- Selecionar --</option>
                                <option value="">Zélu</option>
                                <option value="">Cicinho</option>
                                <option value="">Irmao Livan</option>
                                <option value="">Portarias</option>
                                <option value="">Ofícios</option>
                                <option value="">Leis Municipais</option>
                                <option value="">Lei Orgânica</option>
                                <option value="">Requerimentos</option>
                                <option value="">Atas de Sessões</option>
                                <option value="">Pauta das Sessões</option>
                            </select>
                        </div>
                        <div class="col-md-4">
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
  <!-- /.content -->
</div>
<!--#include file="footer.asp"-->