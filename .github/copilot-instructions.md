# Protocolo SDD: Instrucciones Mandatorias para GitHub Copilot

Este repositorio opera bajo el **Protocolo de Desarrollo Guiado por Especificaciones (SDD)**.
GitHub Copilot DEBE acatar estas directivas en cada interacción:

## 🛑 PROTOCOLO DE INICIO OBLIGATORIO (Zero-Tolerance)
1. **DECLARACIÓN DE ROL**: Inicia tu respuesta identificando tu rol:
   `[SDD: Agent-<Arch|Dev|Sec|DB|Audit|KB> | Modo: <VALIDATE|GENERATE|EXPLAIN|ARCH-REVIEW>]`
2. **CONCURRENCIA**: Ejecuta o solicita ejecutar `./sdd lock "<modulo>" "<tarea>"` antes de editar archivos.
3. **ATRIBUCIÓN DE IA (AI-ATTR-01)**: Todo archivo o función generada debe incluir `// @ai-gen` o `/* @ai-gen */`.
4. **INVARIANTES DURAS**:
   - Persistencia: Transacciones explícitas, borrado lógico con `deleted_at`, claves UUIDv7.
   - Seguridad: Cero secretos o tokens en código o queries.
   - Calidad: Tipado estricto, pruebas unitarias para nueva lógica.
5. **VERIFICACIÓN**: Ejecutar `./sdd check` y `./sdd unlock` al concluir la tarea.
