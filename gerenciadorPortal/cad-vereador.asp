<!--#include file="base.asp"-->
<!-- Novo Vereador - Formulário Melhorado -->
<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1><i class="fa fa-fw fa-check-square-o text-blue"></i> Novo Vereador</h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Novo Vereador</li>
    </ol>
  </section>

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
            <div class="box-body" >
                <img class="profile-user-img img-responsive preview-users-image" src="images/avatar.jpg" style="height: 200px; width: 200px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="users-image"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="users-image" name="users_imagem" style="display: none"/>
            </div>
          </div>
      </div>

      <div class="col-md-9">
        <form role="form">
          <!-- Dados Pessoais -->
          <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Dados Pessoais
                    </div>
                </div>
              <div class="row">
                <div class="col-md-6">
                  <label for="nomeCompleto">Nome Completo</label>
                  <input type="text" class="form-control" id="nomeCompleto" disabled>
                </div>
                <div class="col-md-6">
                  <label for="apelido">Apelido</label>
                  <input type="text" class="form-control" id="apelido">
                </div>
              </div>
              <div class="row" style="margin-top: 10px;">
                <div class="col-md-6">
                  <label for="arquivo">Logo Partido</label>
                  <input type="file" class="form-control" id="arquivo" accept=".pdf">
                </div>
                <div class="col-md-6">
                  <label for="ocupacao">Ocupação</label>
                  <input type="text" class="form-control" id="ocupacao">
                </div>
              </div>
            </div>
          </div>

          <!-- Legislativo -->
          <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Legislativo
                    </div>
                </div>
              <div class="row">
                <div class="col-md-4">
                  <label for="mesaDiretora">Faz Parte da Mesa Diretora?</label>
                  <select class="form-control" id="mesaDiretora" onchange="toggleMesaDiretora(this.value)">
                    <option> -- Selecionar --</option>
                    <option value="sim">Sim</option>
                    <option value="nao">Não</option>
                  </select>
                </div>
            <div id="mostraMesaDiretora" style="display: none;">
                <div class="col-md-4">
                  <label for="funcaoMesa">Ano Legislativo</label>
                  <select class="form-control" id="funcaoMesa">
                    <option> -- Selecionar --</option>
                    <option>2025/2026</option>
                    <option>2027/2028</option>
                  </select>
                </div>
                <div class="col-md-4">
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

              <!-- Comissões -->
              <div class="row" style="margin-top: 15px;">
                <div class="col-md-12">
                  <label for="comissoes">Faz Parte de Comissões?</label>
                  <select class="form-control" id="comissoes" onchange="toggleComissoes(this.value)">
                    <option> -- Selecionar --</option>
                    <option value="sim">Sim</option>
                    <option value="nao">Não</option>
                  </select>
                </div>
              </div>

              <div class="row" id="mostraComissoes" style="display: none; margin-top: 10px;">
                <div class="col-md-6">
                  <label for="nomeComissao">Comissão</label>
                  <select class="form-control" id="nomeComissao" onchange="mostrarCamposComissao(this.value)">
                    <option> -- Selecionar --</option>
                    <option value="Comissao1">Constituição, Justiça e Redação</option>
                    <!-- Outras opções -->
                  </select>
                </div>
                <div class="col-md-6">
                  <label for="funcaoComissao">Função</label>
                  <select class="form-control" id="funcaoComissao">
                    <option> -- Selecionar --</option>
                    <option value="Presidente">Presidente</option>
                    <option value="Vice-Presidente">Vice-Presidente</option>
                    <option value="Membro">Membro</option>
                  </select>
                </div>
                <div class="col-md-2">
                  <button type="button" class="btn btn-success" style="margin-top: 25px;" onclick="adicionarComissao()">Adicionar</button>
                </div>
              </div>

              <div class="form-group" style="margin-top: 10px;">
                <h4>Comissões Selecionadas</h4>
                <ul id="listaComissoes"></ul>
              </div>
            </div>
          </div>

            <!-- Mandatos Anteriores -->
            <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Mandatos Anteriores
                </div>
                </div>            

                <div class="row">
                <!-- Select Já Teve Mandatos Anteriores -->
                <div class="col-md-5">
                    <label for="mandatosAnteriores">Já Teve Mandatos Anteriores?</label>
                    <select class="form-control" id="mandatosAnteriores" onchange="toggleMandatosAnteriores(this.value)">
                    <option> -- Selecionar --</option>
                    <option value="sim">Sim</option>
                    <option value="nao">Não</option>
                    </select>
                </div>

                <!-- Input e botão na mesma linha, com espaço entre eles -->
                <div class="col-md-6" id="mostraMandatosAnteriores" style="display: none;">
                    <div class="col-md-5">
                      <label for="AnoInicioMandato">Ano Início</label>
                      <input type="text" class="form-control" id="AnoInicioMandato">
                    </div>
                    <div class="col-md-5">
                      <label for="AnoFimMandato">Ano Fim</label>
                      <input type="text" class="form-control" id="AnoFimMandato">
                    </div>
                    <div class="col-md-2">
                      <button type="button" class="btn btn-success" style="margin-top: 25px;" onclick="adicionarMandato()">Adicionar</button>
                    </div>
                    </div>
                </div>
                </div>

                <div class="form-group" style="margin-top: 10px;">
                <h4>Mandatos Anteriores</h4>
                <ul id="listaMandatos"></ul>
                </div>
            </div>
            </div>
          <!-- Botão Salvar -->
        <div class="box-footer">
            <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
            <button type="submit" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> Cadastrar</button>
        </div>
        </form>
      </div>
    </div>
  </section>
</div>

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
    const anoInicioMandato = document.getElementById("AnoInicioMandato").value;
    const anoFimMandato = document.getElementById("AnoFimMandato").value;

    if (anoInicioMandato && anoFimMandato) {
        const listaMandatos = document.getElementById("listaMandatos");
        const li = document.createElement("li");
        li.textContent = `Mandato: ${anoInicioMandato} - ${anoFimMandato}`;
        listaMandatos.appendChild(li);

        // Limpar campos após adicionar
        document.getElementById("AnoInicioMandato").value = '';
        document.getElementById("AnoFimMandato").value = '';
    } else {
        alert("Por favor, preencha ambos os campos de Ano Início e Ano Fim.");
    }
}
</script>
<!--#include file="footer.asp"-->