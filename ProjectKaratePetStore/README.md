# Automatización API - PetStore con Karate DSL

Proyecto de automatización de servicios REST para la API de PetStore, implementado con **Karate DSL** para validar los casos de negocio solicitados.

## Repositorio del Proyecto

Puedes encontrar el código fuente y la documentación completa en:
https://github.com/pvbn11/ProjectKaratePetStore

## Requisitos
- Java JDK 17 o superior.
- Apache Maven.

## Estructura del Proyecto
- `src/test/java/features/apiPet/`: Contiene los escenarios (`.feature`) de prueba.
- `src/test/java/body/`: Archivos JSON con los payloads de las peticiones.
- `src/test/java/headers/`: Archivos JSON con la configuración de cabeceras.
- `karate-config.js`: Configuración de ambientes (dev, e2e).

## Ejecución
Ejecuta los tests mediante Maven:
```bash
mvn test