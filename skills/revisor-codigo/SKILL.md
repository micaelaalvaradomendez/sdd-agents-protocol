---
name: revisor-codigo
description: Inspecciona código fuente, esquemas y migraciones para asegurar el cumplimiento de invariantes, tipado estricto y ausencia de anti-patrones.
domain: routing
scope: global
depends_on: []
criticality: high
---

# Habilidad: Revisor de Código

## 1. Descripción y Propósito
Esta habilidad faculta al agente para auditar cambios de código propuestos o existentes. Evalúa la adhesión a los invariantes globales (D0 a D4), detecta anti-patrones catalogados (`AP-01` a `AP-15`) y asegura la presencia de marcas `@ai-gen` y pruebas automatizadas.

## 2. Entradas Requeridas
- **Diff o Archivos a Revisar**: Rutas a los ficheros modificados.
- **Contexto del Módulo**: Reglas duras aplicables (`RULES/`) y catálogo de anti-patrones (`ANTI-PATTERNS.md`).

## 3. Proceso Operativo (Paso a Paso)
1. **Inspección de Invariantes Críticos**:
   - Verificar ausencia de secretos expuestos (`AP-06` / `SEC-SECRETS-01`).
   - Verificar transaccionalidad en escrituras de base de datos (`DB-TX-01`).
   - Verificar que no existan `DELETE` directos en tablas de negocio (`AP-05` / `DB-SOFT-01`).
2. **Auditoría de Buenas Prácticas y Rendimiento**:
   - Chequear consultas N+1 en bucles (`AP-03`).
   - Chequear filtros `LIKE '%...%'` no indexados (`AP-04`).
3. **Verificación de Atribución y Calidad**:
   - Confirmar etiquetado `// @ai-gen` en todo bloque nuevo o modificado (`AI-ATTR-01`).
   - Confirmar tipado estricto sin conversiones inseguras o `any` indiscriminado.
   - Confirmar existencia de pruebas unitarias asociadas.
4. **Emisión de Dictamen**:
   - Generar reporte estructurado clasificando hallazgos por severidad: 🔴 Crítica, 🟡 Advertencia, 💡 Sugerencia.

## 4. Salida Esperada
- Reporte Markdown con lista de observaciones, ID de anti-patrón infringido y propuesta concreta de corrección.

## 5. Límites y Restricciones (Qué NO hace)
- No aprueba código que contenga alucinaciones de paquetes o secretos embebidos.
- No muta el código directamente en modo `VALIDATE`; solo reporta.

## 6. Dependencias e Interacciones
- Requiere consulta activa de `RULES/` y `ANTI-PATTERNS.md`.

## 7. Permisos y Accesos
- Lectura de archivos de código fuente, esquemas y pruebas en el repositorio.

## 8. Manejo de Errores y Excepciones
- Si se detecta una violación 🔴 Crítica, emitir de inmediato una recomendación de bloqueo de commit/PR.

## 9. Auditoría y Trazabilidad
- El reporte de revisión debe quedar registrado en el log de la sesión o como comentario de PR.

## 10. Ejemplos de Uso
Ejemplo de reporte emitido:
```markdown
### Reporte de Revisión de Código
- [🔴 AP-06] Clave de API encontrada en `config/gateway.go:14`. Acción requerida: Mover a variable de entorno.
- [🟡 AP-10] Falta etiqueta `// @ai-gen` en la función `CalculateMetrics`. Acción requerida: Agregar cabecera.
```

## 11. Lista de Verificación (Checklist de Finalización)
- [ ] Reglas duras evaluadas.
- [ ] Anti-patrones contrastados contra `ANTI-PATTERNS.md`.
- [ ] Tag `@ai-gen` verificado en archivos intervenidos.
- [ ] Reporte entregado con IDs y soluciones unívocas.
