# Reglas Duras Inquebrantables (RULES)

Este directorio contiene las **reglas inquebrantables** del sistema. A diferencia de las sugerencias de estilo o buenas prácticas, estas reglas son de cumplimiento mandatorio e indiscutible por parte de cualquier agente o desarrollador.

## Convención de Formato
Toda regla dura debe documentarse bajo el bloque de alerta `[!CAUTION]` con el siguiente estándar:

```markdown
> [!CAUTION]
> **REGLA {ID} — {TÍTULO} (INQUEBRANTABLE)**
> - **Exige**: {Comportamiento o condición obligatoria}
> - **Prohíbe**: {Acciones o patrones terminantemente vetados}
> - **Acción ante violación**: {Reversión inmediata y remediación en la misma sesión}
```

## Categorías
- `DB-RULES.md`: Invariantes de persistencia, manifiesto de tablas y transacciones.
- `SECURITY-RULES.md`: Políticas de secretos, autenticación y defensa perimetral.
- `AI-USAGE-RULES.md`: Atribución de código, contexto mandatorio y gobierno de IA.
