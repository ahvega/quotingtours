from django import template

register = template.Library()


@register.filter
def porciento(numero):
    return format(numero, "%")


register.simple_tag(porciento, takes_context=True)


def identidad(value):
    numeroid = '%s-%s-%s' % (value[0:4], value[4:8], value[8:13])
    return numeroid


register.filter('identidad', identidad)


def tel2de4(value):
    tel = '%s-%s' % (value[0:4], value[4:8])
    return tel


register.filter('tel2de4', tel2de4)
