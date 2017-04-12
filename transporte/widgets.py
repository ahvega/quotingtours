from functools import partial

from django import forms

DateInput = partial(forms.DateInput, {'class': 'ui-datepicker'})


class DateRangeForm(forms.Form):
    fecha_desde = forms.DateField(widget=DateInput())
    fecha_hasta = forms.DateField(widget=DateInput())
