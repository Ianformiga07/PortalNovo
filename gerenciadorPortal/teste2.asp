<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário com Máscara de CPF</title>

    <!-- jQuery (obrigatório) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- jQuery Mask Plugin -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>

    <script>
        // Certifique-se de que o jQuery Mask está sendo aplicado corretamente
        $(document).ready(function() {
            // Aplica a máscara de CPF ao campo com ID 'cpf'
            $('#cpf').mask('000.000.000-00');
        });
    </script>
</head>
<body>
    <form>
        <div class="col-md-4">
            <label for="CPF">CPF</label>
            <input type="text" class="form-control" id="cpf" name="cpf" placeholder="CPF" required>
        </div>
    </form>
</body>
</html>