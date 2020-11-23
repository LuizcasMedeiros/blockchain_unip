

$(document).ready(function () {

    $('.tgl').before('<span><font color=red>mostrar mais »</font></span>');

    $('.tgl').css('display', 'none')

    $('span', '#box-toggle').click(function () {

        $(this).next().slideToggle('slow')

                .siblings('.tgl:visible').slideToggle('fast');

        $(this).toggleText('mostrar mais »', '« mostrar menos')

                .siblings('span').next('.tgl:visible').prev()

                .toggleText('mostrar mais »', '« mostrar menos')

    });

})