$(window).load( function()  {
    $('#id_fecha_desde').datepicker();
    $('#id_fecha_hasta').datepicker();

    $("#submit").click( function() {
        $("#laforma").submit();
    });
});