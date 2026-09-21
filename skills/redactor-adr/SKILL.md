---
name: redactor-adr
description: Facilita la redacción, evaluación de trade-offs y registro estructurado de Decisiones Arquitectónicas (ADR) según la jerarquía de precedencia.
domain: knowledge
scope: global
depends_on: []
criticality: medium
---

# Habilidad: Redactor de ADR (Architecture Decision Records)

## 1. Descripción y Propósito
Esta habilidad guía al agente en la formulación de registros de decisiones arquitectónicas formales (ADR). Interviene en modo `ARCH-REVIEW` o durante la fase *Closing* del SOP v2 cuando se adopta un nuevo estándar técnico, se rompe un patrón previo o se elige una tecnología/estrategia entre múltiples alternativas.

## 2. Entradas Requeridas
- **Título de la Decisión**: Frase concisa en lenguaje natural.
- **Contexto**: Problema de arquitectura o restricciones en conflicto.
- **Opciones Analizadas**: Mínimo 2 alternativas técnicas evaluadas.
- **Opción Elegida y Justificación**: Fundamento basado en la Jerarquía de Precedencia (Integridad > Atomicidad > Economía de Contexto).

## 3. Proceso Operativo (Paso a Paso)
1. **Verificación de Precedentes**: Revisar `DECISIONS-INDEX.md` para evitar contradecir decisiones vigentes sin derogarlas explícitamente.
2. **Generación del Fichero**: Invocar `./scripts/new-decision.sh "<Título>"` para inicializar la plantilla con fecha estandarizada `YYYY-MM-DD-slug.md`.
3. **Redacción del Contenido**:
   - Detallar el problema y las fuerzas en tensión en *Contexto*.
   - Describir las alternativas con sus pros y contras.
   - Formalizar la opción elegida y sus consecuencias (positivas y de deuda técnica asumida).
4. **Actualización de Índices**: Verificar que `DECISIONS-INDEX.md` contenga el enlace y estado `Propuesto` o `Aceptado`.

## 4. Salida Esperada
- Documento `DECISIONS/YYYY-MM-DD-slug.md` completado.
- Fila correspondiente actualizada en `DECISIONS-INDEX.md`.

## 5. Límites y Restricciones (Qué NO hace)
- No reemplaza la aprobación humana cuando una decisión altera invariantes de nivel D0 o D1.
- No emite decisiones sin haber explicitado las desventajas o trade-offs de la opción seleccionada.

## 6. Dependencias e Interacciones
- Utiliza el script `scripts/new-decision.sh` y la plantilla `templates/ADR-TEMPLATE.md`.

## 7. Permisos y Accesos
- Lectura y escritura en el directorio `DECISIONS/` y sobre `DECISIONS-INDEX.md`.

## 8. Manejo de Errores y Excepciones
- Si un archivo con la misma fecha y slug ya existe, ajustar el título o añadir sufijo numérico para evitar colisiones.

## 9. Auditoría y Trazabilidad
- Los ADRs constituyen la memoria histórica y legal de las decisiones de diseño del proyecto.

## 10. Ejemplos de Uso
Invocación tras debate técnico sobre particionamiento:
```bash
./scripts/new-decision.sh "Adopción de Particionamiento Mensual en Eventos"
```

## 11. Lista de Verificación (Checklist de Finalización)
- [ ] Script `./scripts/new-decision.sh` ejecutado.
- [ ] Contexto y alternativas exhaustivamente documentados.
- [ ] Consecuencias y compromisos técnicos declarados.
- [ ] `DECISIONS-INDEX.md` verificado.

