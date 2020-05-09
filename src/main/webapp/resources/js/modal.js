$(function () {
    $(".delete-id").click(function () {
        var id = $(this).data('id');
        var name = $(this).data('name');
        $(".inst-del").attr('href', function(i, href) { return href + id; });
        $("#modalDeleteName").text(name);
    })
});