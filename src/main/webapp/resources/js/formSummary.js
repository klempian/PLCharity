$(document).ready(function() {

    $('#formQuantity').change(function(){

        let quant = $(this).val();
        let bagText;

        if(quant == 1) {
            bagText = "worek"
        } else if (quant > 10 && quant <15) {
            bagText = "worków"
        } else if (quant % 10 > 1 && quant % 10 < 5) {
            bagText = "worki"
        } else {
            bagText = "worków"
        }

        $('#summaryQuantity').text($(this).val() + " " + bagText);
        // ** or just this: **
        // $('#summaryQuantity').text("worków: " + $(this).val());
    });

    $('#categories').change(function(){
        let categories = $('#categories input:checked').map(function(){return $(this).data('name');}).get().join(", ");

        $('#summaryCategories').text("(" + categories + ")")
    });

    $('#institutions').change(function(){

        $('#summaryInstitution').text("Dla: " + $('#institutions input:checked').map(function () {return $(this).data('name');}).get())
    });

    $('#street').change(function(){

        $('#summaryStreet').text($(this).val());
    });

    $('#city').change(function(){

        $('#summaryCity').text($(this).val());
    });

    $('#zipCode').change(function(){

        $('#summaryZipCode').text($(this).val());
    });

    $('#pickUpDate').change(function(){

        $('#summaryPickUpDate').text($(this).val());
    });

    $('#pickUpTime').change(function(){

        $('#summaryPickUpTime').text($(this).val());
    });

    $('#pickUpComment').change(function(){

        let comment = $(this).val();
        if (comment.trim() === "") {
            comment = "Brak uwag"
        }

        $('#summaryPickUpComment').text(comment);
    });
});