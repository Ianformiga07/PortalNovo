
<form action="processar_contrato.asp" method="post" enctype="multipart/form-data">
    <h3>Cadastro de Contrato</h3>
    
    <!-- Dados Gerais -->
    <label for="numeroContrato">Número do Contrato:</label>
    <input type="text" id="numeroContrato" name="numeroContrato" required><br>
    
    <label for="dataInicio">Data de Início:</label>
    <input type="date" id="dataInicio" name="dataInicio" required><br>
    
    <label for="dataTermino">Data de Término:</label>
    <input type="date" id="dataTermino" name="dataTermino" required><br>
    
    <label for="descricao">Descrição do Objeto:</label>
    <textarea id="descricao" name="descricao" rows="4" required></textarea><br>
    
    <label for="valorTotal">Valor Total:</label>
    <input type="text" id="valorTotal" name="valorTotal" required><br>
    
    <!-- Tipo de Contratação -->
    <label for="tipoContratacao">Tipo de Contratação:</label>
    <select id="tipoContratacao" name="tipoContratacao" onchange="exibirCamposEspecificos()" required>
        <option value="">Selecione</option>
        <option value="licitacao">Licitação</option>
        <option value="dispensa">Dispensa de Licitação</option>
        <option value="inexigibilidade">Inexigibilidade de Licitação</option>
    </select><br>
    
    <!-- Campos Condicionais -->
    <div id="camposDispensa" style="display:none;">
        <h4>Informações para Dispensa</h4>
        <label for="justificativaDispensa">Justificativa:</label>
        <textarea id="justificativaDispensa" name="justificativaDispensa" rows="4"></textarea><br>
        
        <label for="baseLegalDispensa">Base Legal:</label>
        <input type="text" id="baseLegalDispensa" name="baseLegalDispensa" value="Art. 75 da Lei nº 14.133/2021"><br>
    </div>
    
    <div id="camposInexigibilidade" style="display:none;">
        <h4>Informações para Inexigibilidade</h4>
        <label for="justificativaInexigibilidade">Justificativa:</label>
        <textarea id="justificativaInexigibilidade" name="justificativaInexigibilidade" rows="4"></textarea><br>
        
        <label for="documentoExclusividade">Documento de Exclusividade:</label>
        <input type="file" id="documentoExclusividade" name="documentoExclusividade"><br>
        
        <label for="baseLegalInexigibilidade">Base Legal:</label>
        <input type="text" id="baseLegalInexigibilidade" name="baseLegalInexigibilidade" value="Art. 74 da Lei nº 14.133/2021"><br>
    </div>
    
    <!-- Botão de Submissão -->
    <button type="submit">Cadastrar Contrato</button>
</form>

<script>
    function exibirCamposEspecificos() {
        var tipoContratacao = document.getElementById('tipoContratacao').value;
        
        document.getElementById('camposDispensa').style.display = (tipoContratacao === 'dispensa') ? 'block' : 'none';
        document.getElementById('camposInexigibilidade').style.display = (tipoContratacao === 'inexigibilidade') ? 'block' : 'none';
    }
</script>
