$(window).load( function()  {
    $('#id_fecha_adquirido').datepicker();

    $("#submit").click( function() {
        $("#laforma").submit();
    });
});