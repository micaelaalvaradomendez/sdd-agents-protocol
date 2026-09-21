---
name: atlas-topografia-sistema
description: Topografía arquitectónica viva y mapa de dependencias entre módulos del sistema.
domain: routing
scope: global
criticality: high
---

# Atlas de Arquitectura del Sistema

Este mapa topográfico representa el estado vivo del sistema y define las fronteras entre subsistemas, protocolos de comunicación y dependencias de persistencia.

---

## 1. Diagrama de Arquitectura de Alto Nivel

```mermaid
flowchart TD
    subgraph ClientLayer ["Capa de Clientes"]
        WebApp["Web App (Svelte / React)"]
        MobileApp["Mobile / API Consumers"]
    end

    subgraph GatewayLayer ["Puerta de Enlace / API Gateway"]
        Gateway["Traefik / Nginx / Reverse Proxy"]
        AuthMiddleware["Middleware Auth & RBAC"]
    end

    subgraph ServiceLayer ["Capa de Servicios de Dominio"]
        OrderService["Servicio de Órdenes"]
        UserService["Servicio de Usuarios"]
        AuditWorker["Worker de Auditoría Asíncrona"]
    end

    subgraph PersistenceLayer ["Capa de Persistencia"]
        PrimaryDB[("PostgreSQL Master (Transaccional)")]
        OutboxQueue[("Tabla sys_audit_outbox")]
        CacheStore[("Redis (Sesiones y Caché)")]
    end

    WebApp --> Gateway
    MobileApp --> Gateway
    Gateway --> AuthMiddleware
    AuthMiddleware --> OrderService
    AuthMiddleware --> UserService

    OrderService --> PrimaryDB
    OrderService --> OutboxQueue
    UserService --> PrimaryDB

    OutboxQueue -.-> AuditWorker
    AuditWorker --> CacheStore
```

---

## 2. Mapa de Dependencias entre Módulos

```mermaid
flowchart LR
    subgraph Core ["Núcleo / Compartido"]
        Config["config"]
        Security["security / auth"]
        Database["database / manifest"]
    end

    subgraph Domains ["Módulos de Negocio"]
        Orders["orders"]
        Catalog["catalog"]
        Billing["billing"]
    end

    Orders --> Database
    Orders --> Security
    Catalog --> Database
    Billing --> Database
    Billing --> Security
```

---

## 3. Matriz de Propiedad de Tablas y Esquemas

| Tabla / Entidad | Dominio Propietario | Prefijo | Restricciones Específicas |
| :--- | :--- | :--- | :--- |
| `sys_users` | `security` | `sys_` | Password hash argon2id, UUIDv7 |
| `sys_audit_outbox` | `audit` | `sys_` | Append-Only, procesado por worker |
| `mov_orders` | `orders` | `mov_` | Transacción estricta, soft-delete |
| `cfg_system_params`| `config` | `cfg_` | Caché en Redis con TTL |

---

## 4. Política de Mantenimiento
- Este archivo se actualiza obligatoriamente en el paso 4 (*Closing*) del SOP v2 cuando se añade un nuevo módulo o se altera la interacción entre subsistemas.

