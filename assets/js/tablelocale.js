$(document).ready(function () {
    $('#tabladedatos').dataTable(
        {
            "iDisplayLength": 10,
            "pageLength": 10,
            "lengthMenu":[[10,20,30,50,-1],[10,20,30,50,"todos"]],
            "order": [],
            "columnDefs": [{
                "targets": 'no-sort',
                "orderable": false
            }],
            "language": {
                columns:        "<i class='material-icons md-28' style='vertical-align: -8px;color:#7b7b7b;'>view_week</i>",
                processing:     "En proceso...",
                search:         "<i class='material-icons md-28' style='vertical-align: -8px;color:#7b7b7b;'>search</i>",
                lengthMenu:    "<i class='material-icons md-28' style='vertical-align: -8px;color: #7b7b7b;'>format_list_numbered</i> _MENU_",
                info:           "_START_ a _END_ de <strong>_TOTAL_</strong> en total",
                infoEmpty:      "No hay elementos",
                infoFiltered:   "(Filtrado de _MAX_ elementos en total)",
                infoPostFix:    "",
                loadingRecords: "Cargando...",
                zeroRecords:    "No se encontraron registros",
                emptyTable:     "No hay datos en esta tabla",
                paginate: {
                    first:      "<i class='material-icons'>first_page</i>",
                    previous:   "<i class='material-icons'>chevron_left</i>",
                    next:       "<i class='material-icons'>chevron_right</i>",
                    last:       "<i class='material-icons'>last_page</i>"
                },
                "aria": {
                    sortAscending:  ": ordenar columna en forma ascendente",
                    sortDescending: ": ordenar columna en forma descendente"
                }
            }
        });
});