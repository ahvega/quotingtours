from transporte.models import Parametro


def get_all_fields(self):
    """Returns a list of all field names on the instance."""
    parametros = []
    for f in Parametro._meta.fields:
        fname = f.name
        # resolve picklists/choices, with get_xyz_display() function
        get_choice = 'get_' + fname + '_display'
        if hasattr(self, get_choice):
            value = getattr(self, get_choice)()
        else:
            try:
                value = getattr(self, fname)
            except AttributeError:
                value = None
        # only display fields with values and skip some fields entirely
        if f.editable and value and f.name not in ('id', 'unidad', 'orden', 'slug', 'creado', 'actualizado'):
            parametros.append(
                {
                    'annio': f.annio,
                    'name': f.nombre,
                    'value': f.valor,
                }
            )
    return parametros


params = get_all_fields(Parametro)

