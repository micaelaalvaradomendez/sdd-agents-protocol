---
name: nombre-habilidad-kebab-case
description: Descripción precisa de la capacidad técnica que otorga esta skill y su condición de activación.
domain: persistence # routing | persistence | security | messaging | frontend | knowledge
scope: global # global | module | agent
depends_on: []
criticality: medium # high | medium | low
---

# Habilidad: Nombre de la Habilidad

## 1. Descripción y Propósito
Explicación detallada de la responsabilidad de esta habilidad, qué problema resuelve y cuándo debe ser invocada por el agente.

## 2. Entradas Requeridas
- **Parámetros**: Lista de argumentos, tipos y obligatoriedad.
- **Contexto Previo**: Archivos, esquemas o variables de entorno que deben cargarse antes de ejecutar.

## 3. Proceso Operativo (Paso a Paso)
1. **Fase de Inspección**: Verificación de precondiciones y restricciones.
2. **Fase de Transformación**: Lógica técnica, mutaciones o generación.
3. **Fase de Validación**: Control de calidad contra invariantes y anti-patrones.

## 4. Salida Esperada
- **Artefactos Producidos**: Archivos creados, modificados o reportes emitidos.
- **Formato Estructurado**: Esquema JSON o estructura markdown esperada.

## 5. Límites y Restricciones (Qué NO hace)
- Límites explícitos de autoridad.
- Acciones que requieren escalado o supervisión humana.

## 6. Dependencias e Interacciones
- Skills previas o posteriores requeridas en la cadena de valor.

## 7. Permisos y Accesos
- Nivel de acceso al sistema de archivos, red o bases de datos requerido.

## 8. Manejo de Errores y Excepciones
- Procedimiento de contingencia ante datos faltantes, fallos de compilación o violaciones de invariantes.

## 9. Auditoría y Trazabilidad
- Requisitos de registro transaccional (`sys_audit_outbox`) y etiquetado `@ai-gen`.

## 10. Ejemplos de Uso
### Caso Típico
Descripción del escenario y snippet de invocación/resultado.

## 11. Lista de Verificación (Checklist de Finalización)
- [ ] Precondiciones verificadas.
- [ ] Invariantes de dominio cumplidos.
- [ ] Código o artefacto etiquetado con `// @ai-gen`.
- [ ] Tests automáticos ejecutados y en verde.

