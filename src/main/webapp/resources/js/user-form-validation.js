$('form :input').not($('#retype_password')).each(function () {
    var input = $(this);
    input.on('keyup', function () {
        if (input.val() !== '') {
            input.removeClass('is-invalid').addClass('is-valid');
            if (input.val().trim() === '') {
                input.removeClass('is-valid').addClass('is-invalid');
            }
        }
        else {
            input.removeClass('is-invalid').removeClass('is-valid');
        }
    });
});

var password = document.getElementById('password');
var retypePassword = document.getElementById('retype_password');

function validatePassword() {

    if (password.value === "" && retypePassword.value === "") {
        password.classList.remove('is-invalid', 'is-valid');
        retypePassword.classList.remove('is-invalid', 'is-valid');
    } else if (password.value === retypePassword.value) {
        retypePassword.classList.remove('is-invalid');
        retypePassword.classList.add('is-valid');
        try{retypePassword.setCustomValidity('')}catch(e){}
    } else {
        retypePassword.setCustomValidity('Hasła muszą być identyczne');
        retypePassword.classList.remove('is-valid');
        retypePassword.classList.add('is-invalid');
        return false;
    }
    return true;
}
password.onchange = validatePassword;
retypePassword.onkeyup = validatePassword;

$('#email').on('keyup', function () {
    if ($(this).val() === '') {
        $(this).removeClass('is-invalid').removeClass('is-invalid');
    }
    else if (checkEmail($(this).val())){
        $(this).removeClass('is-invalid').addClass('is-valid');
    }
    else {
        $(this).removeClass('is-valid').addClass('is-invalid');
    }
    return true;

});

function checkEmail(txt) {
    var patt = /[a-zA-Z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,3}$/;
    return patt.test(txt);
}

function InvalidMsg(textbox) {
        if (textbox.value.trim() === '') {
            textbox.setCustomValidity('to pole nie może być puste');
        } else if (textbox.validity.patternMismatch) {
            if(textbox.id === 'email') {
                textbox.setCustomValidity('nieprawidłowy format adresu email');
            }
        }
        else {
            textbox.setCustomValidity('');
        }
        return true;
    }