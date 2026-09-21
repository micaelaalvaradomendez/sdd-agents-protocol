# Plantilla de Agente Compuesto: [Nombre del Agente]
Version: 1.0.0 | Status: Draft | Domain: [Dominio]

## 1. Identidad y Propósito
Definición del rol técnico asumido por el agente, objetivos primarios dentro del ciclo de vida de desarrollo y alcance de su especialización.

## 2. Contexto Requerido
- **Archivos Obligatorios**: Esquemas, manifiestos o índices que deben cargarse antes de iniciar (`AGENTS.md`, `CONSTITUCION.md`, etc.).
- **Variables de Entorno / Estado**: Configuración del entorno requerida.

## 3. Modos Operativos Soportados y Quality Gates
| Modo | Soportado (Sí/No) | Calidad Mínima Requerida (Quality Gate) |
| :--- | :--- | :--- |
| `VALIDATE` | Sí | Cero violaciones críticas (🔴). |
| `GENERATE` | Sí | Código con tipos estrictos, tests unitarios pasando, `@ai-gen` presente. |
| `EXPLAIN` | Sí | Referencias a estándares y skills declaradas. |
| `ARCH-REVIEW` | Sí | Conclusión formal con propuesta de ADR en `DECISIONS/`. |

## 4. Habilidades (Skills)
- **Habilidades Permitidas**: Lista de identificadores de skills habilitadas para este rol.
- **Habilidades Bloqueadas**: Habilidades explícitamente vedadas para evitar extralimitación de funciones.

## 5. Restricciones e Invariantes
- Invariantes de dominio (D0 - D4) de estricto cumplimiento para este agente.

## 6. Límites de Autoridad y Decisiones Autónomas
- **Decisiones Autónomas**: Qué cambios puede aplicar directamente sin intervención humana.
- **Decisiones Bloqueadas**: Qué modificaciones requieren aprobación explícita de un arquitecto o tech lead.

## 7. Protocolo de Escalado
Procedimiento a seguir cuando el agente detecte bloqueos, violaciones de invariantes insalvables o dependencias rotas.

## 8. Interfaces de Comunicación
- Formato de entrada esperado (comandos, tickets, peticiones de revisión).
- Estructura de salida y reportes.

## 9. Ciclo de Vida y Sesión
- Procedimiento para adquirir bloqueo en `SESSION_LOCK.md`.
- Procedimiento de liberación y cierre mediante SOP v2.

## 10. Monitoreo y Métricas
- Indicadores de éxito de la sesión (tasa de tests aprobados, ausencia de regresiones, cobertura de `@ai-gen`).

## 11. Integración con Otros Agentes
- Roles con los que colabora y puntos de transferencia de responsabilidad (*handoff*).

## 12. Ejemplos de Interacción
```markdown
### Ejemplo de Consulta y Respuesta
Usuario: ...
Agente: ...
```

## 13. Historial de Cambios (Changelog)
- **v1.0.0 (YYYY-MM-DD)**: Creación inicial del perfil del agente.

