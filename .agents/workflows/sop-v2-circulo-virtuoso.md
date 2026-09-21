# Procedimiento Operativo Estándar: SOP v2 — Círculo Virtuoso de Conocimiento

El SOP v2 es el protocolo secuencial que transforma el trabajo diario de los agentes supervisados en conocimiento acumulativo y estándares de arquitectura vivos.

---

```
  ┌─────────────────┐
  │  PASO 1: INIT   │  Registrar tarea en SESSION_LOCK
  │   (Alineación)  │  Declarar rol asumido y skills activadas
  └────────┬────────┘
           │
           ▼
  ┌─────────────────┐
  │PASO 2: DISCOVERY│  Consultar DECISIONS-INDEX (precedentes)
  │    (Lectura)    │  Cargar MAPS/ATLAS y CONSTITUCION
  └────────┬────────┘
           │
           ▼
  ┌─────────────────┐
  │PASO 3: EXECUTION│  Aplicar cambios con integridad transaccional
  │    (Acción)     │  Etiquetar bloques con // @ai-gen
  └────────┬────────┘  Superar Quality Gates del modo activo
           │
           ▼
  ┌─────────────────┐  A. Decisión: Redactar ADR si cambió estándar
  │ PASO 4: CLOSING │  B. Skills: Actualizar skills afectadas
  │  (Bucle de KB)  │  C. Constitución: Regenerar con ./scripts/sync-constitution.sh
  └─────────────────┘  D. Atlas: Actualizar topografía si varió estructura
                       E. Clean: Liberar registro en SESSION_LOCK
```

---

## Paso 1 — Init (Alineación Operativa)
1. **Adquisición de Concurrencia**: Invocar `./scripts/sdd lock "<modulo>" "<tarea>" "[agent-id]"`. El comando verifica colisiones y registra el inicio atómicamente en `SESSION_LOCK.md`.
2. **Declaración de Contexto**: Identificar el tipo de requerimiento y declarar en el primer turno de interacción:
   - `AgentID` asumido (e.g. `Agent-Dev`, `Agent-DB`, `Agent-Sec`).
   - Modo operativo (`VALIDATE`, `GENERATE`, `EXPLAIN`, `ARCH-REVIEW`).
   - Skills primarias cargadas.

## Paso 2 — Discovery (Acceso al Conocimiento Previo)
1. **Inspección de Precedentes**: Leer `DECISIONS-INDEX.md` para entender si existen restricciones o decisiones previas sobre el subsistema a tocar.
2. **Carga de Topografía**: Consultar `MAPS/` para ubicar las dependencias entre componentes.
3. **Carga de Normativa**: Consultar `CONSTITUCION.md`, las skills del rol y las reglas duras en `RULES/`.

## Paso 3 — Execution (Implementación Controlada)
1. **Prioridad Normativa**: Aplicar en todo momento la Jerarquía de Precedencia (Integridad de Dominio > Atomicidad > Economía de Contexto).
2. **Mutaciones Seguras**: Cualquier escritura en persistencia debe ser atómica (transaccional) y generar registro en outbox si corresponde.
3. **Atribución de IA**: Todo bloque generado o asistido debe llevar el comentario `// @ai-gen`.
4. **Verificación Continua**: Ejecutar `./scripts/sdd check` antes de dar la tarea por concluida.

## Paso 4 — Closing (Cierre y Bucle de Conocimiento)
Al finalizar la implementación técnica:
1. **A. Decisión**: Si se tomó una decisión arquitectónica no trivial o se resolvió un trade-off, crear un ADR mediante `./scripts/sdd adr "<Título>"`.
2. **B. Skills**: Si se descubrió una mejor práctica o se refactorizó un flujo común, actualizar la skill en `skills/`.
3. **C. Constitución**: Ejecutar `./scripts/sdd sync` para asegurar que `CONSTITUCION.md` esté al día.
4. **D. Atlas**: Actualizar los diagramas en `MAPS/` si la estructura del sistema cambió.
5. **E. Liberación**: Ejecutar `./scripts/sdd unlock` para liberar la sesión automáticamente.

