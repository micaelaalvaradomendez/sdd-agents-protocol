# Plantilla de Contexto Global de Dominio: [Nombre del Proyecto]

Este documento sirve como modelo para proveer a los agentes de contexto de negocio claro y acotado, minimizando la carga cognitiva y evitando el desbordamiento de contexto (*prompt bloat*).

## 1. Visión y Objetivos de Negocio
- **Organización / Proyecto**: [Nombre]
- **Misión del Software**: [Qué resuelve en 2 oraciones]
- **Usuarios Primarios**: [Roles y audiencias principales]

## 2. Invariantes Fundamentales de Negocio
- Regla 1: [Ejemplo: Una orden pagada no puede ser modificada directamente]
- Regla 2: [Ejemplo: Los reportes deben basarse en datos inmutables]

## 3. Límites del Sistema y Fronteras de Dominio
- **Dentro del Alcance**: Módulos administrados por este repositorio.
- **Fuera del Alcance**: Servicios externos o APIs de terceros gestionadas por otros equipos.

## 4. Clasificación de Datos y Restricciones
- **Datos Públicos**: Catálogo, descripciones generales.
- **Datos Confidenciales / PII**: Información de contacto, identidades, transacciones financieras (requieren cifrado y anonimización).

## 5. Integraciones Críticas
- Servicios externos y contratos de comunicación.

