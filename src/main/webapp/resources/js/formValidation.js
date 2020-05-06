$(document).ready(function() {

    $('#categories').change(function(){
        if($('#categories input:checkbox:checked').length){
            $('#step1button').removeAttr('disabled');
        }
        else{
            $('#step1button').attr('disabled', 'disabled');
        }
    });

    $('#formQuantity').on('change keyup', function(){
            if($('#formQuantity').val() > 0){
                $('#step2button').removeAttr('disabled');
            }
            else{
                $('#step2button').attr('disabled', 'disabled');
            }
    });

    $('#institutions').change(function(){
        if($('#institutions input:radio:checked').length){
            $('#step3button').removeAttr('disabled');
        }
        else{
            $('#step3button').attr('disabled', 'disabled');
        }
    });

    $('#step4').change(function(){
        $('#step4 input').each(function () {
            if($(this).val()){
                $('#step4button').removeAttr('disabled');
            }
            else{
                $('#step4button').attr('disabled', 'disabled');
                return false;
            }
        })
    });

});
