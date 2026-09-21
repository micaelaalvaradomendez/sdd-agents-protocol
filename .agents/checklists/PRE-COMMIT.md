# Lista de Verificación: Pre-Commit (PRE-COMMIT)

Lista de control ejecutable antes de realizar cualquier `git commit` en repositorios bajo protocolo SDD.

## Verificaciones Mandatorias
- [ ] **Sin Secretos**: Verificado con `git diff` que no existen API keys, contraseñas o URLs internas hardcodeadas (`SEC-SECRETS-01`).
- [ ] **Etiquetado `@ai-gen`**: Todo bloque nuevo o modificado por IA contiene `// @ai-gen` (`AI-ATTR-01`).
- [ ] **Tipado y Compilación**: El proyecto compila limpiamente sin errores de sintaxis ni de tipos (`VALIDATE`).
- [ ] **Pruebas Automatizadas**: Las pruebas unitarias locales corren y pasan al 100%.
- [ ] **Anti-Patrones**: Sin violaciones críticas de `ANTI-PATTERNS.md` (no hay N+1 evidentes, ni consultas destructivas directas).
- [ ] **Economía de Contexto**: Los archivos modificados se mantienen dentro de límites razonables de longitud y cohesión.

