# Protección Lista de Precios

Extensión para **Microsoft Dynamics 365 Business Central** que bloquea la eliminación accidental de listas de precios activas.

## Descripción

Cuando un usuario intenta eliminar una lista de precios con estado **Activo**, el sistema lanza un error informativo indicando que primero debe cambiarla a estado **Borrador**. Esto evita pérdidas de datos en escenarios donde se elimina una lista de precios que sigue siendo utilizada en procesos de venta o compra.

## Funcionamiento

La extensión se engancha al evento `OnBeforeDeleteEvent` de la tabla `Price List Header`. Si el registro está en estado `Active`, se bloquea la eliminación y se muestra el mensaje:

```
No se puede eliminar la lista de precios "<Descripción>" porque está en estado Activo.
Si realmente necesitas eliminarla, cambia a estado Borrador.
```

## Requisitos

| Parámetro | Valor |
|-----------|-------|
| Business Central | 24.0 o superior |
| Runtime AL | 14.0 |
| Target | Cloud (SaaS) |
| Rango de IDs | 50200 – 50299 |

## Instalación

1. Compilar el proyecto desde VS Code con la extensión AL Language.
2. Publicar el archivo `.app` generado en el entorno de Business Central correspondiente.

## Información

| Campo | Valor |
|-------|-------|
| Publisher | Global Food Link |
| Versión | 1.0.0.0 |
