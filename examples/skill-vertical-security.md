# Demostración de Skill Vertical de Seguridad (examples/skill-vertical-security.md)

Este ejemplo documenta la ejecución completa de una skill vertical de seguridad (`auditor-seguridad`), desde la detección estática de una vulnerabilidad hasta su remediación, verificación y persistencia en la base de conocimiento.

---

## 1. Detección de Vulnerabilidad (SAST)
Durante una revisión de código rutinaria, `Agent-Sec` analiza el siguiente controlador de descarga de comprobantes:

```go
// Archivo vulnerable: internal/handlers/documents.go
func ServeDocument(w http.ResponseWriter, r *http.Request) {
    fileName := r.URL.Query().Get("file")
    // VULNERABILIDAD: Path Traversal (CWE-22)
    data, err := os.ReadFile("/var/app/storage/" + fileName)
    if err != nil {
        http.Error(w, "File not found", 404)
        return
    }
    w.Write(data)
}
```

## 2. Diagnóstico y Clasificación
- **ID de Vulnerabilidad**: `SEC-VULN-2026-0042`
- **CWE**: CWE-22 (Improper Limitation of a Pathname to a Restricted Directory)
- **Severidad**: 🔴 Crítica (CVSS 8.6)
- **Impacto**: Un atacante podría suministrar `../../../../etc/passwd` y extraer archivos confidenciales del servidor.

## 3. Generación del Parche de Remediación
`Agent-Sec` activa la skill `revisor-codigo` y produce el siguiente parche atómico:

```diff
// internal/handlers/documents.go
+// @ai-gen
 func ServeDocument(w http.ResponseWriter, r *http.Request) {
     fileName := r.URL.Query().Get("file")
-    data, err := os.ReadFile("/var/app/storage/" + fileName)
+    // Limpieza de ruta y validación de límites
+    cleanFileName := filepath.Base(filepath.Clean(fileName))
+    safePath := filepath.Join("/var/app/storage", cleanFileName)
+    if !strings.HasPrefix(safePath, "/var/app/storage/") {
+        http.Error(w, "Acceso denegado", http.StatusForbidden)
+        return
+    }
+    data, err := os.ReadFile(safePath)
     if err != nil {
-        http.Error(w, "File not found", 404)
+        http.Error(w, "Documento no encontrado", http.StatusNotFound)
         return
     }
     w.Write(data)
 }
```

## 4. Verificación Automatizada (Test de Regresión)

```go
// internal/handlers/documents_test.go
// @ai-gen
func TestServeDocument_PreventsPathTraversal(t *testing.T) {
    req := httptest.NewRequest("GET", "/documents?file=../../../../etc/passwd", nil)
    rr := httptest.NewRecorder()

    ServeDocument(rr, req)

    if rr.Code != http.StatusForbidden && rr.Code != http.StatusNotFound {
        t.Fatalf("Esperado 403 o 404 ante path traversal, obtenido: %d", rr.Code)
    }
}
```

## 5. Cierre del Bucle (Knowledge Loop)
1. **Regla de Seguridad**: Se verifica que `SECURITY-RULES.md` contemple explícitamente el saneamiento de rutas en descargas de archivos.
2. **Quality Gate**: El test automatizado se incorpora a la suite de CI evitando regresiones futuras.
