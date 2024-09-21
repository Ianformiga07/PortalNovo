//JQUERY START
$(function () {

    //############# Abre a seleção de imagens dos campos inputs file
    $(document.body).on('click', '.btn-file', function () {
        var id = $(this).attr('id');
        $('.' + id).click();
    });

    //############# Função para criar a pré visualização de imagens
    $(document.body).on('change', 'input:file:not(.image_off)', function () {
        var input = $(this);
        var target = $('.preview-' + $(this).attr('class'));
        var defaultImage = target.attr('default-image');
        var defaultWidth = target.attr('default-width');

        if (!input.val()) {
            target.fadeOut('fast', function () {
                $(this).attr('src', defaultImage).fadeIn('slow');
            });
            return false;
        }

        if (this.files && this.files[0].type.match('image.*')) {
            var reader = new FileReader();
            reader.onload = function (e) {
                target.fadeOut('fast', function () {
                    target.attr('src', e.target.result).width(defaultWidth).height('100%').fadeIn('fast');
                });
            };
            reader.readAsDataURL(this.files[0]);
        } else {
            BoxInfo(AlertJS('Envie imagens JPG, PNG ou GIF.'));
            target.fadeOut('fast', function () {
                $(this).attr('src', defaultImage).fadeIn('slow');
            });
            input.val('');
            return false;
        }
    });
});