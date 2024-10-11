
function validacao(){
    var cpf = document.getElementById("CPF").value;
    var nomeCompleto = document.getElementById("nomeCompleto").value;
    var dataNasc = document.getElementById("dataNasc").value;
    var sexo = document.getElementById("sexo").value;
    var estadoCivil = document.getElementById("estadoCivil").value;
    var matricula = document.getElementById("matricula").value;
    var rg = document.getElementById("rg").value;
    var orgaoExpedidor = document.getElementById("orgaoExpedidor").value;
    var escolaridade = document.getElementById("escolaridade").value;
    var cep = document.getElementById("cep").value;
    var endereco = document.getElementById("endereco").value;
    var bairro = document.getElementById("bairro").value;
    var cidade = document.getElementById("cidade").value;
    var uf = document.getElementById("uf").value;
    var celular = document.getElementById("celular").value;
    var email = document.getElementById("email").value;
    var admissao = document.getElementById("admissao").value;
    var cargo = document.getElementById("cargo").value;
    var departamento = document.getElementById("departamento").value;
    var decreto = document.getElementById("decreto").value;
    var dataDecreto = document.getElementById("dataDecreto").value;
    var cargaHoraria = document.getElementById("cargaHoraria").value;
    var dataAdmissao = document.getElementById("dataAdmissao").value;
    var banco = document.getElementById("banco").value;
    var agencia = document.getElementById("agencia").value;
    var conta = document.getElementById("conta").value;
    var tipoConta = document.getElementById("tipoConta").value;
    // Validações para cada campo
    if (cpf === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo CPF.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("CPF").focus();
        return false; 
    }

    if (nomeCompleto === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Nome Completo.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("nomeCompleto").focus();
        return false; 
    }

    if (dataNasc === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Data de Nascimento.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("dataNasc").focus();
        return false; 
    }

    if (sexo === "" || sexo === "-- Selecionar --") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, selecione o Sexo.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("sexo").focus();
        return false;
    }

    if (estadoCivil === "" || estadoCivil === " -- Selecionar --") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, selecione o Estado Civil.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("estadoCivil").focus();
        return false; 
    }
    if (matricula === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Matrícula.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("matricula").focus();
        return false; 
    }

    if (rg === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo RG.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("rg").focus();
        return false; 
    }

    if (orgaoExpedidor === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Órgão Expedidor.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("orgaoExpedidor").focus();
        return false; 
    }

    if (escolaridade === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, selecione o campo Escolaridade.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("escolaridade").focus();
        return false; 
    }

    if (cep === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo CEP.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("cep").focus();
        return false; 
    }

    if (endereco === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Endereço.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("endereco").focus();
        return false; 
    }

    if (bairro === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Bairro.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("bairro").focus();
        return false; 
    }

    if (cidade === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Cidade.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("cidade").focus();
        return false; 
    }

    if (uf === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, selecione o campo UF.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("uf").focus();
        return false; 
    }

    if (celular === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Celular.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("celular").focus();
        return false; 
    }

    if (email === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Email.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("email").focus();
        return false; 
    }

    if (admissao === "" || admissao === " -- Selecionar --") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, selecione o Tipo de Admissão.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("admissao").focus();
        return false; 
    }

    if (cargo === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Cargo.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("cargo").focus();
        return false; 
    }

    if (departamento === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Departamento.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("departamento").focus();
        return false; 
    }

    if (decreto === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Decreto.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("decreto").focus();
        return false; 
    }
    // Novas validações
    if (dataDecreto === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Data Decreto.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("dataDecreto").focus();
        return false; 
    }

    if (cargaHoraria === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, digite a carga horária.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("cargaHoraria").focus();
        return false; 
    }

    if (dataAdmissao === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Data Admissão.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("dataAdmissao").focus();
        return false; 
    }

    if (banco === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo banco.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("banco").focus();
        return false; 
    }

    if (agencia === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Agência.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("agencia").focus();
        return false; 
    }

    if (conta === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, preencha o campo Conta.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("conta").focus();
        return false; 
    }

    if (tipoConta === "") {
        Swal.fire({
            position: 'top-end',
            icon: 'error',
            title: 'Por favor, selecione o campo Tipo de Conta.',
            showConfirmButton: false,
            timer: 2000
        });
        document.getElementById("tipoConta").focus();
        return false; 
    }
    return true;
}

function validarCPF(cpf) {
    cpf = cpf.replace(/[^\d]+/g, ''); // Remove caracteres não numéricos

    if (cpf.length !== 11 || /^(\d)\1+$/.test(cpf)) {
        return false; // CPF tem que ter 11 dígitos e não pode ser todos iguais
    }

    let soma;
    let resto;
    soma = 0;

    for (let i = 1; i <= 9; i++) {
        soma += parseInt(cpf.substring(i - 1, i)) * (11 - i);
    }

    resto = (soma * 10) % 11;

    if ((resto === 10) || (resto === 11)) resto = 0;
    if (resto !== parseInt(cpf.substring(9, 10))) return false;

    soma = 0;
    for (let i = 1; i <= 10; i++) {
        soma += parseInt(cpf.substring(i - 1, i)) * (12 - i);
    }

    resto = (soma * 10) % 11;

    if ((resto === 10) || (resto === 11)) resto = 0;
    if (resto !== parseInt(cpf.substring(10, 11))) return false;

    return true;
}