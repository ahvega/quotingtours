$(document).ready(function () {
    $('#tabladedatos').dataTable(
        {
            "iDisplayLength": 10,
            "pageLength": 10,
            "lengthMenu":[[10,20,30,50,-1],[10,20,30,50,"todos"]],
            "language": {
                columns:        "Columnas...",
                processing:     "En proceso...",
                search:         "Buscar&nbsp;:",
                lengthMenu:    "Mostrar _MENU_ elementos",
                info:           "Mostrando de _START_ a _END_ de _TOTAL_ elementos totales",
                infoEmpty:      "Mostrando de 0 a 0 de 0 elementos totales",
                infoFiltered:   "(Filtrado de _MAX_ elementos en total)",
                infoPostFix:    "",
                loadingRecords: "Cargando...",
                zeroRecords:    "No se encontraron registros",
                emptyTable:     "No hay datos en esta tabla",
                paginate: {
                    first:      "Primero",
                    previous:   "Anterior",
                    next:       "Siguiente",
                    last:       "Ultimo"
                },
                "aria": {
                    sortAscending:  ": ordenar columna en forma ascendente",
                    sortDescending: ": ordenar columna en forma descendente"
                }
            }
        });
});