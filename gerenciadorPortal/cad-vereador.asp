<!--#include file="base.asp"-->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header bg-white p-bottom-5">
      <h1>
        <i class="fa fa-fw fa-check-square-o text-blue"></i> Novo Vereador
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Novo Vereador</li>
      </ol>
    </section>

<!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Foto de Perfil
                </div>
            </div>
            <div class="box-body">
                <img class="profile-user-img img-responsive preview-users-image" src="images/avatar.jpg" style="height: 200px; width: 200px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="users-image"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="users-image" name="users_imagem" style="display: none"/>
            </div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <!-- general form elements -->
            <div class="box box-primary">
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form">
                <div class="box-body">
                    <div class="box-header text-blue" style="border: none; padding: 0;">
                        <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                        <i class="fa fa-caret-right"></i> Dados Pessoais
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="nomeCompleto">Nome Completo</label>
                                <input type="text" class="form-control" id="nomeCompleto" disabled>
                            </div>
                            <div class="col-md-6">
                                <label for="apelido">Apelido</label>
                                <input type="text" class="form-control" id="apelido" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="arquivo">Logo Partido</label>
                                <input type="file" class="form-control" id="arquivo" name="arquivo" accept=".pdf" required>
                            </div>
                            <div class="col-md-6">
                                <label for="ocupacao">Ocupação</label>
                                <input type="text" class="form-control" id="ocupacao" >
                            </div>
                        </div>
                    </div>
                    <!-- Outros campos de dados pessoais -->
                    
                    <br>
                    <!-- Legislativo Section -->
                    <div class="box-header text-blue" style="border: none; padding: 0;">
                        <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                        <i class="fa fa-caret-right"></i> Legislativo
                        </div>
                    </div>
                    
                    <!-- Mesa Diretora -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="mesaDiretora">Faz Parte da Mesa Diretora?</label>
                                <select class="form-control" id="mesaDiretora" onchange="toggleMesaDiretora(this.value)">
                                    <option> -- Selecionar --</option>
                                    <option value="sim">Sim</option>
                                    <option value="nao">Não</option>
                                </select>
                            </div>
                            <div id="mostraMesaDiretora" style="display: none;">
                                <div class="col-md-6">
                                    <label for="funcaoMesa">Função</label>
                                    <select class="form-control" id="funcaoMesa">
                                        <option> -- Selecionar --</option>
                                        <option>Presidente</option>
                                        <option>Vice-Presidente</option>
                                        <option>1° Secretário</option>
                                        <option>2° Secretário</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Comissões -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="comissoes">Faz Parte de Comissões?</label>
                                <select class="form-control" id="comissoes" onchange="toggleComissoes(this.value)">
                                    <option> -- Selecionar --</option>
                                    <option value="sim">Sim</option>
                                    <option value="nao">Não</option>
                                </select>
                            </div>
                        </div>
                        <div id="mostraComissoes" style="display: none;">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="nomeComissao">Comissões</label>
                                    <select class="form-control" id="nomeComissao" onchange="mostrarCamposComissao(this.value)">
                                        <option> -- Selecionar --</option>
                                        <option value="Comissao1">Comissão de Constituição Justiça e Redação</option>
                                        <option value="Comissao2">Comissão de Administração, Trabalho, Transporte, Agricultura, Desenvolvimento Urbano e Serviço Público</option>
                                        <option value="Comissao3">Comissão de Finanças, Orçamento, Tributação, fiscalização e Controle</option>
                                        <option value="Comissao4">Comissão de Educação, Cultura e Desporto, Saúde e Meio Ambiente</option>
                                    </select>
                                </div>
                            <div id="camposComissao" style="display: none;">
                                    <div class="col-md-4">
                                        <label for="funcaoComissao">Função</label>
                                        <select class="form-control" id="funcaoComissao">
                                            <option> -- Selecionar Função --</option>
                                            <option value="Presidente">Presidente</option>
                                            <option value="Vice-Presidente">Vice-Presidente</option>
                                            <option value="Membro">Membro</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <label>&nbsp;</label>
                                        <button type="button" class="btn btn-success form-control" onclick="adicionarComissao()">Adicionar Comissão</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Lista de comissões selecionadas -->
                    <div class="form-group">
                        <h4>Comissões Selecionadas</h4>
                        <ul id="listaComissoes"></ul>
                    </div>

                    <!-- Mandatos Anteriores -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="mandatosAnteriores">Já Teve Mandatos Anteriores?</label>
                                <select class="form-control" id="mandatosAnteriores" onchange="toggleMandatosAnteriores(this.value)">
                                    <option> -- Selecionar --</option>
                                    <option value="sim">Sim</option>
                                    <option value="nao">Não</option>
                                </select>
                            </div>
                        
                        <div id="mostraMandatosAnteriores" style="display: none;">
                                <div class="col-md-6">
                                    <label for="detalhesMandato">Detalhes do Mandato Anterior</label>
                                    <input type="text" class="form-control" id="detalhesMandato" placeholder="Ex.: 2016-2020">
                                </div>
                                <div class="col-md-2">
                                    <label>&nbsp;</label>
                                    <button type="button" class="btn btn-success form-control" onclick="adicionarMandato()">Adicionar Mandato</button>
                                </div>
                        </div>
                        </div>
                        <!-- Lista de mandatos anteriores -->
                        <div class="form-group">
                            <h4>Mandatos Anteriores</h4>
                            <ul id="listaMandatos"></ul>
                        </div>
                    </div>

                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </form>
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<script>
// Funções JavaScript para alternar exibição de seções e adicionar itens

function toggleMesaDiretora(value) {
    if (value === "sim") {
        document.getElementById("mostraMesaDiretora").style.display = "block";
    } else {
        document.getElementById("mostraMesaDiretora").style.display = "none";
    }
}

function toggleComissoes(value) {
    if (value === "sim") {
        document.getElementById("mostraComissoes").style.display = "block";
    } else {
        document.getElementById("mostraComissoes").style.display = "none";
        document.getElementById("camposComissao").style.display = "none";
    }
}

function mostrarCamposComissao(value) {
    if (value) {
        document.getElementById("camposComissao").style.display = "block";
    }
}

function adicionarComissao() {
    const nomeComissao = document.getElementById("nomeComissao").value;
    const funcaoComissao = document.getElementById("funcaoComissao").value;

    if (nomeComissao && funcaoComissao) {
        const listaComissoes = document.getElementById("listaComissoes");
        const li = document.createElement("li");
        li.textContent = `${nomeComissao} - ${funcaoComissao}`;
        listaComissoes.appendChild(li);

        // Limpar seleção após adicionar
        document.getElementById("nomeComissao").value = '';
        document.getElementById("funcaoComissao").value = '';
        document.getElementById("camposComissao").style.display = "none";
    }
}

function toggleMandatosAnteriores(value) {
    if (value === "sim") {
        document.getElementById("mostraMandatosAnteriores").style.display = "block";
    } else {
        document.getElementById("mostraMandatosAnteriores").style.display = "none";
    }
}

function adicionarMandato() {
    const detalhesMandato = document.getElementById("detalhesMandato").value;

    if (detalhesMandato) {
        const listaMandatos = document.getElementById("listaMandatos");
        const li = document.createElement("li");
        li.textContent = detalhesMandato;
        listaMandatos.appendChild(li);

        // Limpar campo após adicionar
        document.getElementById("detalhesMandato").value = '';
    }
}
</script>
<!--#include file="footer.asp"-->