<!--#include file="base.asp"-->
<!-- Novo Vereador - Formulário Melhorado -->
<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1><i class="fa fa-fw fa-check-square-o text-blue"></i> Alterar Foto de Perfil</h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Alterar Foto de Perfil</li>
    </ol>
  </section>

  <section class="content">
    <div class="row">
        <form method="post" name="upfoto">
            <input type="file">
            <button>Enviar</button>
        </form>
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
    const anoLegDiv = document.getElementById("anoLegDiv");
    const mostraComissoes = document.getElementById("mostraComissoes");

    if (value === "sim") {
      anoLegDiv.style.display = "block"; // Exibe o campo Ano Legislativo
      mostraComissoes.style.display = "block"; // Exibe os outros campos
    } else {
      anoLegDiv.style.display = "none"; // Oculta o campo Ano Legislativo
      mostraComissoes.style.display = "none"; // Oculta os outros campos
      resetCampos(); // Reseta os valores dos campos
    }
  }

  function resetCampos() {
    document.getElementById("AnoLegComissao").selectedIndex = 0;
    document.getElementById("nomeComissao").selectedIndex = 0;
    document.getElementById("funcaoComissao").selectedIndex = 0;
  }

  function adicionarComissao() {
    const nomeComissao = document.getElementById("nomeComissao").value;
    const funcaoComissao = document.getElementById("funcaoComissao").value;

    if (nomeComissao && funcaoComissao) {
      const listaComissoes = document.getElementById("listaComissoes");
      const li = document.createElement("li");
      li.textContent = `${nomeComissao} - ${funcaoComissao}`;
      listaComissoes.appendChild(li);
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