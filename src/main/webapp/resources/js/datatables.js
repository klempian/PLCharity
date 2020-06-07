$(document).ready(function() {
    $('#donationsTable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Polish.json"
        },
        "order": [[3, "desc"], [2, "desc"]]
    });

    $('#institutionTable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Polish.json"
        },
        "order": [[0, "desc"]],
        "columnDefs": [ {
            "targets": 1,
            "orderable": false
        } ]
    });

    $('#userTable').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Polish.json"
        },
        "order": [[1, "asc"], [0, "asc"], [2, "asc"]]
    });
});