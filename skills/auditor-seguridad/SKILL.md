---
name: auditor-seguridad
description: Habilidad vertical para detectar vulnerabilidades en dependencias y código, mapear vectores de ataque, generar parches correctivos y verificar remediaciones.
domain: security
scope: global
depends_on: [revisor-codigo]
criticality: high
---

# Habilidad: Auditor de Seguridad

## 1. Descripción y Propósito
Esta habilidad ejecuta un ciclo completo de auditoría y remediación de vulnerabilidades de seguridad (SAST, SCA y revisión de dependencias). Permite analizar árboles de dependencias, detectar versiones obsoletas con CVEs conocidos, proponer parches de código mitigantes y emitir registros de verificación transaccionales.

## 2. Entradas Requeridas
- **Manifiesto del Proyecto**: Archivo de dependencias (`package.json`, `go.mod`, `requirements.txt`, etc.).
- **Código o Configuración Objetivo**: Ficheros fuente o manifiestos de despliegue a inspeccionar.
- **Base de Firmas / Vulnerabilidades**: Catálogo de CVEs o advisory de seguridad.

## 3. Proceso Operativo (Paso a Paso)
1. **Fase de Detección**:
   - Escanear dependencias y contrastar versiones contra bases de vulnerabilidades conocidas.
   - Analizar patrones de código estático en busca de inyecciones SQL, XSS, deserialización insegura o exposición de endpoints sin autenticación.
2. **Fase de Diagnóstico**:
   - Asignar severidad (Crítica, Alta, Media, Baja) y vector de impacto CVSS.
   - Determinar si la vulnerabilidad es explotable en el contexto específico de la aplicación.
3. **Fase de Remediación (Generación de Parche)**:
   - Proponer actualización de versión mínima no vulnerable en el archivo de dependencias.
   - Generar refactor de código seguro (ej: reemplazo de queries concatenadas por queries parametrizadas o saneamiento de cabeceras).
   - Marcar el parche con `// @ai-gen`.
4. **Fase de Verificación**:
   - Ejecutar pruebas automatizadas para confirmar que la funcionalidad no se degrade (*no regressions*).
   - Validar que el exploit o vector reportado ya no sea reproducible.

## 4. Salida Esperada
- Informe técnico de vulnerabilidad (CVE, severidad, archivo afectado, vector).
- Parche propuesto (`git diff` o código modificado).
- Registro de auditoría en la bitácora de seguridad.

## 5. Límites y Restricciones (Qué NO hace)
- No ejecuta pruebas de penetración activas destructivas sobre entornos productivos en línea.
- No almacena ni divulga payloads de explotación contra infraestructura real.

## 6. Dependencias e Interacciones
- Interactúa con `revisor-codigo` para asegurar que el parche cumpla los estándares globales de calidad.

## 7. Permisos y Accesos
- Lectura de árbol de directorios y dependencias. Escritura de parches sobre archivos de código y lockfiles.

## 8. Manejo de Errores y Excepciones
- Si la actualización de una dependencia introduce cambios incompatibles (*breaking changes*), documentar la necesidad de un refactor más profundo antes de forzar el upgrade.

## 9. Auditoría y Trazabilidad
- Toda remediación de seguridad aplicada debe asociarse a una entrada en el log de auditoría o checklist de pre-release.

## 10. Ejemplos de Uso
Detección y saneamiento de inyección de cabeceras HTTP:
```diff
// @ai-gen
- w.Header().Set("X-Custom-Redirect", userInput)
+ sanitized := strings.ReplaceAll(strings.ReplaceAll(userInput, "\r", ""), "\n", "")
+ w.Header().Set("X-Custom-Redirect", sanitized)
```

## 11. Lista de Verificación (Checklist de Finalización)
- [ ] Detección realizada con ID de vulnerabilidad/CVE asignado.
- [ ] Parche generado sin efectos secundarios colaterales.
- [ ] Pruebas unitarias de regresión superadas.
- [ ] Etiquetado `// @ai-gen` aplicado.
