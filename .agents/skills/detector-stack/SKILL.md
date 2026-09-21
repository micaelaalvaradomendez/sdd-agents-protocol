---
name: detector-stack
description: Inspecciona el árbol de directorios de un repositorio para identificar el stack tecnológico, gestores de paquetes y patrones de arquitectura activos.
domain: routing
scope: global
depends_on: []
criticality: medium
---

# Habilidad: Detector de Stack Tecnológico

## 1. Descripción y Propósito
Esta habilidad permite a los agentes inspeccionar de forma agnóstica cualquier repositorio para determinar con certeza los lenguajes, frameworks, motores de bases de datos y herramientas de construcción presentes. Evita asumir convenciones erróneas y adapta las recomendaciones y calidad de código al ecosistema real del proyecto.

## 2. Entradas Requeridas
- **Ruta Raíz del Repositorio**: Directorio base a explorar.
- **Matriz de Detección Agnóstica**: Archivo `data/tech-stack-detection.json`.

## 3. Proceso Operativo (Paso a Paso)
1. **Ejecución Automática**: Invocar `./scripts/sdd detect [ruta]` o inspeccionar `data/tech-stack-detection.json`.
2. **Inspección de Archivos Indicadores**:
   - `package.json` / `pnpm-lock.yaml` -> Ecosistema JavaScript / TypeScript / Node.js.
   - `go.mod` / `go.sum` -> Ecosistema Go.
   - `requirements.txt` / `pyproject.toml` / `Pipfile` -> Ecosistema Python.
   - `Cargo.toml` -> Ecosistema Rust.
   - `pom.xml` / `build.gradle` -> Ecosistema Java / Kotlin.
   - `composer.json` -> Ecosistema PHP.
   - `Dockerfile` / `docker-compose.yml` -> Infraestructura de contenedores y servicios dependientes.
2. **Extracción de Dependencias Clave**:
   - Framework web (Express, Fastify, Gin, Echo, FastAPI, Django, Spring Boot, etc.).
   - Driver o ORM de persistencia (pg, GORM, sqlx, SQLAlchemy, Prisma, Hibernate, etc.).
   - Framework de testing (Jest, Vitest, testing package Go, pytest, JUnit).
3. **Mapeo de Patrones**:
   - Consultar la matriz agnóstica de patrones `patterns[TIPO][STACK]` para seleccionar las directivas adecuadas de diseño y formateo.
4. **Generación de Salida Estructurada**:
   - Consolidar los hallazgos en un payload normalizado JSON.

## 4. Salida Esperada
- Objeto JSON con el desglose tecnológico:
```json
{
  "primary_language": "Go",
  "runtime_version": "1.22",
  "framework": "standard library / chi",
  "database": "PostgreSQL",
  "orm_or_driver": "pgx / sqlc",
  "test_runner": "go test",
  "containerized": true
}
```

## 5. Límites y Restricciones (Qué NO hace)
- No instala herramientas ni ejecuta comandos que descarguen binarios durante la inspección pasiva.
- No modifica archivos de configuración del repositorio.

## 6. Dependencias e Interacciones
- Servida como paso previo para `revisor-codigo` y agentes ejecutores (`agente-desarrollador`).

## 7. Permisos y Accesos
- Lectura exclusiva sobre archivos de configuración e índices del proyecto.

## 8. Manejo de Errores y Excepciones
- Si no se encuentra ningún indicador estándar, reportar `stack: unknown` y solicitar confirmación al usuario antes de asumir herramientas.

## 9. Auditoría y Trazabilidad
- El resultado de la detección se cachea en la memoria de la sesión para evitar re-escaneos redundantes.

## 10. Ejemplos de Uso
Invocación al iniciar una sesión sobre un repositorio recién clonado:
```bash
# Análisis pasivo de indicadores
find . -maxdepth 2 -name "package.json" -o -name "go.mod" -o -name "pyproject.toml"
```

## 11. Lista de Verificación (Checklist de Finalización)
- [ ] Archivos indicadores rastreados.
- [ ] Dependencias primarias identificadas.
- [ ] Payload JSON normalizado emitido.

