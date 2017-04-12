from django.db import models
from tenant_schemas.models import TenantMixin


class Cliente(TenantMixin):
    nombre = models.CharField(max_length=100)
    pagado_hasta = models.DateField()
    en_prueba = models.BooleanField()
    creado = models.DateField(auto_now_add=True)

    # default true, schema will be automatically created and synced when it is saved
    auto_create_schema = True
