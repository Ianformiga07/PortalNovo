//FUNÃ‡ÃƒO DE VALIDAÃ‡ÃƒO REFERENTE A PARTE DE ALTERAÃ‡ÃƒO
function validacaoAlt(){


}

//FUNÃ‡ÃƒO DE VALIDAÃ‡ÃƒO REFERENTE A PARTE DE INSERÃ‡ÃƒO
function validacao(){
    var uvlSelect = document.getElementById("uvlSelect").value;
    var ProgramaSelect = document.getElementById("ProgramaSelect").value;
    var txtTema = document.getElementById("txtTema").value;
    var AtividadeSelect = document.getElementById("AtividadeSelect").value;
    var PublicoSelect = document.getElementById("PublicoSelect").value;
    var txtDataPalestra = document.getElementById("txtDataPalestra").value;
    var QtdPublico = document.getElementById("QtdPublico").value;
    var frequencia = document.getElementById("frequencia").value;
    var anexo = document.getElementById("anexo").value;


    if (uvlSelect === "") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Por favor, selecione uma UVL.',
                showConfirmButton: false,
                timer: 2000
            });
        document.getElementById("uvlSelect").focus();
        return false; 
    }

    if (ProgramaSelect === "") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Por favor, selecione um Programa.',
                showConfirmButton: false,
                timer: 2000
            });
        document.getElementById("ProgramaSelect").focus();
        return false; 
    }

    if (txtTema === "") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Por favor, Digite o Tema.',
                showConfirmButton: false,
                timer: 2000
            });
        document.getElementById("txtTema").focus();
        return false; 
    }

    if (AtividadeSelect === "") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Por favor, selecione a Atividade.',
                showConfirmButton: false,
                timer: 2000
            });
        document.getElementById("AtividadeSelect").focus();
        return false; 
    }

    if (PublicoSelect === "") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Por favor, selecione o Publico.',
                showConfirmButton: false,
                timer: 2000
            });
        document.getElementById("PublicoSelect").focus();
        return false; 
    }

    if (txtDataPalestra === "") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Por favor, digite a data da Palestra.',
                showConfirmButton: false,
                timer: 2000
            });
        document.getElementById("txtDataPalestra").focus();
        return false; 
    }

    if (QtdPublico === "") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Por favor, digite o PÃºblico Total.',
                showConfirmButton: false,
                timer: 2000
            });
        document.getElementById("QtdPublico").focus();
        return false; 
    }

    if (frequencia === "") {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Por favor, Insira a FrequÃªncia.',
                showConfirmButton: false,
                timer: 2000
            });
        document.getElementById("frequencia").focus();
        return false; 
    }
    return true;

}