# 🌿 Chromatix — Estrategia de Ramas (Git Strategy)

## Modelo de Ramas

```
main
└── develop
    ├── feature/client-profile
    ├── feature/service-record
    ├── feature/guardian-engine
    ├── feature/retention-loop
    └── feature/notifications
```

---

## Descripción de cada rama

| Rama | Propósito | Estado |
|---|---|---|
| `main` | Código estable y listo para producción. Solo recibe merges desde `develop` cuando una versión está completa y testeada. Nunca se trabaja directo acá. | Protegida |
| `develop` | Rama de integración continua. Todo feature terminado se mergea acá primero. Es el "estado actual del proyecto en desarrollo". | Activa |
| `feature/client-profile` | Módulo de ficha clínica del cliente: alta, edición, visualización del perfil persistente. | En desarrollo |
| `feature/service-record` | Módulo de registro de cada visita: fórmula usada, resultado real, feedback post-servicio. | Pendiente |
| `feature/guardian-engine` | Módulo de validación y alertas de seguridad. Lee `client_profile` antes de aprobar cualquier fórmula. | Pendiente |
| `feature/retention-loop` | Módulo de cálculo dinámico de próximo service y notificaciones de re-agenda. | Pendiente |
| `feature/notifications` | Integración de notificaciones push locales (MVP) y WhatsApp (v2.0). | Pendiente |

---

## Reglas de trabajo

### Crear una rama de feature
```bash
git checkout develop
git pull origin develop
git checkout -b feature/nombre-del-modulo
```

### Mergear un feature terminado a develop
```bash
git checkout develop
git pull origin develop
git merge --no-ff feature/nombre-del-modulo
git push origin develop
```

### Nunca hacer push directo a `main`
`main` solo se actualiza cuando una versión completa está lista:
```bash
git checkout main
git merge --no-ff develop
git tag -a v1.0.0 -m "MVP completo"
git push origin main --tags
```

---

## Convención de commits

Usar prefijos descriptivos para mantener el historial limpio:

| Prefijo | Uso |
|---|---|
| `feat:` | Nueva funcionalidad |
| `fix:` | Corrección de bug |
| `docs:` | Cambios en documentación |
| `schema:` | Cambios en archivos JSON de datos o schemas |
| `refactor:` | Reorganización de código sin cambio de comportamiento |
| `test:` | Agregado o modificación de tests |
| `chore:` | Tareas de mantenimiento (dependencias, configuración) |

**Ejemplos:**
```
feat: agregar formulario de alta de cliente
schema: agregar campo gray_distribution a client_profile
fix: corregir cálculo de oxidante para cabello sensibilizado
docs: actualizar roadmap con criterios de completitud v1.2
```

---

## Flujo completo de una feature (ejemplo)

```bash
# 1. Partir siempre desde develop actualizado
git checkout develop && git pull origin develop

# 2. Crear la rama
git checkout -b feature/client-profile

# 3. Trabajar, commitear frecuente
git add .
git commit -m "feat: estructura base del formulario de alta de cliente"
git commit -m "schema: agregar campos de historial médico al client_profile"

# 4. Cuando está lista, mergear a develop
git checkout develop
git merge --no-ff feature/client-profile
git push origin develop

# 5. Borrar la rama local (opcional, mantiene el repo limpio)
git branch -d feature/client-profile
```
