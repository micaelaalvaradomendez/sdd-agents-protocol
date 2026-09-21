# Lista de Verificación: Pre-Release (PRE-RELEASE)

Lista de control para despliegues a entornos compartidos (staging/producción) o publicación de versiones etiquetadas.

## Requisitos de Entrega
- [ ] **CI en Verde**: Todas las suites de integración continua (`lint-skills.yml`, tests automáticos, linters) aprobadas.
- [ ] **Constitución Sincronizada**: `./scripts/sync-constitution.sh` ejecutado y sin cambios pendientes.
- [ ] **ADRs Consolidados**: Todas las decisiones técnicas del sprint registradas y enlazadas en `DECISIONS-INDEX.md`.
- [ ] **SESSION_LOCK Limpio**: Sin bloqueos huérfanos activos en `SESSION_LOCK.md`.
- [ ] **Changelog Actualizado**: Registro de cambios publicado con notas claras de nuevas características o parches.
- [ ] **Zero Data Leakage**: Verificado que ningún commit contiene secretos ni credenciales privadas.

