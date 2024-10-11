// MASCARA CPF
function mascaraCPF(cpfField) {
    // Remove todos os caracteres que não são números
    let cpf = cpfField.value.replace(/\D/g, '');
    
    // Limita o número de caracteres ao máximo do formato de CPF (11 dígitos)
    if (cpf.length > 11) {
        cpf = cpf.substring(0, 11);
    }

    // Aplica a máscara de CPF (000.000.000-00)
    cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
    cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
    cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");

    // Define o valor formatado no campo
    cpfField.value = cpf;
}

// MASCARA CEP
function mascaraCEP(input) {
    // Remove qualquer caractere que não seja número
    let value = input.value.replace(/\D/g, '');

    // Aplica a máscara de CEP
    if (value.length > 5) {
        input.value = value.substring(0, 2) + '.' + value.substring(2, 5) + '-' + value.substring(5, 8);
    } else if (value.length > 2) {
        input.value = value.substring(0, 2) + '.' + value.substring(2, 5);
    } else {
        input.value = value;
    }
}