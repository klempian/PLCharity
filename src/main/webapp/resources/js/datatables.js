$(document).ready(function() {
    $('#dataTable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Polish.json"
        },
        "order": [[3, "desc"], [2, "desc"]]
    });
});