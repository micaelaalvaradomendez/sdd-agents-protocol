# Patrón de Migración de Contexto (docs/patterns/context-migration.md)

Cómo transformar notas dispersas, archivos markdown desestructurados y fragmentos de documentación suelta en un marco formal de contexto gobernado (`contexto/`).

---

## 1. El Problema del Contexto Desestructurado
En proyectos que inician rápidamente con asistentes de IA, es común acumular archivos de texto gigantescos (e.g. `apuntes.md`, `notas-reunion.txt`, `prompt-maestro.txt`) con cientos de líneas que mezclan:
- Requisitos de negocio.
- Fragmentos de consultas SQL obsoletas.
- Claves de prueba o contraseñas.
- Dudas sin resolver.

Al alimentar este archivo completo a los agentes, se satura la ventana de contexto (*context degradation*), aumenta el costo de tokens y se incrementa el riesgo de alucinaciones.

---

## 2. El Proceso de Migración en 4 Fases

```mermaid
flowchart LR
    Raw["Notas Desestructuradas / Prompts Sueltos"] --> Sanitize["1. Sanitización de Secretos & PII"]
    Sanitize --> Chunk["2. Modularización Atómica (SDS-500)"]
    Chunk --> Classify["3. Asignación a contexto/ (01..06)"]
    Classify --> Constitution["4. Vinculación con Skills & Roles"]
```

### Fase 1: Sanitización Rigurosa
Antes de cualquier migración, escanear en busca de claves de API, contraseñas, nombres institucionales privados o rutas locales absolutas. Reemplazar por identificadores genéricos y configuraciones basadas en variables de entorno.

### Fase 2: Modularización Atómica
Dividir el documento en secciones cohesivas de menos de 500 líneas (estándar SDS-500).

### Fase 3: Asignación por Categoría
Clasificar cada segmento en la estructura normalizada de `contexto/`:
- `01-negocio.md`: Objetivos y modelos de negocio.
- `02-datos-sensibles.md`: Reglas de confidencialidad y PII.
- `03-integraciones.md`: Contratos de red y servicios externos.
- `04-regulaciones.md`: Normas de cumplimiento y auditoría.
- `05-audiencias.md`: Arquetipos de usuario.
- `06-estandares-frontend.md`: Convenciones visuales y accesibilidad.

### Fase 4: Vinculación con Perfiles de Agentes
Configurar en cada archivo de `agentes/*.md` cuáles de estos archivos de contexto son mandatorios para su especialidad, evitando la carga indiscriminada del resto.

