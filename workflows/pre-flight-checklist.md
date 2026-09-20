# Procedimiento de Pre-Vuelo (Pre-Flight Protocol)

Protocolo de verificación previa a la consolidación de cambios (*merge* o *release*) generados o asistidos por agentes de IA.

## Objetivos
Garantizar que ningún código generado por IA degrade la calidad arquitectónica, viole políticas de seguridad o carezca de pruebas.

## 10 Puntos Críticos del Pre-Vuelo
1. **Manifiesto y Esquema**: Si hubo cambios en entidades o persistencia, el manifiesto de base de datos está 100% sincronizado.
2. **Índices con Justificación**: Cada nuevo índice añadido a la base de datos cuenta con una consulta justificada que lo requiera.
3. **Contratos Tipados**: Interfaces de clientes de red y DTOs tipados estrictamente sin tipos comodín inseguros.
4. **Validación de Compilación y Linters**: Código compilando sin advertencias y linters pasando en verde.
5. **Atribución de IA**: Todo bloque generado marcado explícitamente con `// @ai-gen` o `/* @ai-gen */`.
6. **Auditoría Transaccional**: Toda escritura que requiera consistencia eventual incluye registro outbox.
7. **Cero Secretos**: Ningún token, contraseña o clave privada en el diff.
8. **Fixtures y Seeds**: Si se crearon nuevas entidades, se proveyeron fixtures o migraciones de seed correspondientes.
9. **Respeto a Zonas Core**: Ninguna modificación no autorizada sobre el núcleo del sistema o middlewares de seguridad.
10. **Pruebas de Lógica al 100%**: Cobertura de tests unitarios sobre toda la lógica de negocio introducida.
