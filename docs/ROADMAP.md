# 🗺️ Chromatix — Roadmap

## Estado actual: MVP en construcción

```
main ──────────────────────────────────────────────────────▶ producción
        │                          │                    │
       v1.0 (MVP)               v1.2                 v2.0
```

---

## MVP — v1.0

**Objetivo:** Un profesional puede dar de alta una clienta, generar una fórmula segura y registrar el servicio.

### Features
- [ ] Alta y edición de `client_profile` completo
- [ ] Pantalla de diagnóstico (inputs estructurados del profesional)
- [ ] Engine: cálculo de fórmula con Yellow Professional
- [ ] Guardian: todas las reglas de `guardian_rules.json` activas
- [ ] Registro del `service_record` por visita
- [ ] `result_feedback` completable al finalizar
- [ ] Almacenamiento local (dispositivo del profesional)

### Rama de trabajo
`feature/client-profile` → `feature/service-record` → `feature/guardian-engine`

### Criterio de salida al v1.2
Todas las features de arriba testeadas con al menos 10 clientas reales en condiciones de salón.

---

## v1.2

**Objetivo:** El sistema retiene a las clientas activamente y aprende de cada servicio.

**Depende de:** MVP completo y estable.

### Features
- [ ] Retention Loop dinámico con todos los factores de rutina
- [ ] Notificaciones push locales para reagendado
- [ ] Feedback loop: el engine consulta el `result_feedback` anterior al calcular nueva fórmula
- [ ] Módulo de home-care: recomendaciones personalizadas por tipo de servicio
- [ ] Módulo de inventario: descuento automático de productos usados por servicio

### Ramas de trabajo
`feature/retention-loop` → `feature/notifications`

### Criterio de salida al v2.0
Retention Loop con datos reales de al menos 30 dias de uso. Tasa de reagendado medible.

---

## v2.0

**Objetivo:** El sistema escala a múltiples profesionales y salones con sincronización en la nube.

**Depende de:** v1.2 completo + infraestructura de autenticación y cloud definida.

### Features
- [ ] Autenticación de usuarios (cuenta por profesional o por salón)
- [ ] Sincronización en la nube (Firebase / Supabase — a definir)
- [ ] Migración de datos locales del MVP a cloud
- [ ] Notificaciones por WhatsApp Business API
- [ ] Soporte multi-profesional por salón (con permisos diferenciados)
- [ ] Motor agnóstico: segunda marca habilitada post-Yellow Professional

### Decisiones técnicas pendientes para v2.0
- [ ] Definir proveedor cloud (Firebase vs Supabase vs custom)
- [ ] Definir modelo de autenticación (email/password, Google, número de teléfono)
- [ ] Definir modelo de datos multi-tenant (un salón = múltiples profesionales)
- [ ] Definir política de migración de datos locales a cloud
- [ ] Definir integración WhatsApp Business API

---

## Dependencias entre fases

```
client_profile UI
      ↓
service_record + engine
      ↓
guardian_engine (puede desarrollarse en paralelo con engine)
      ↓
MVP completo
      ↓
retention_loop
      ↓
notifications
      ↓
v1.2 completo
      ↓
auth + cloud infra
      ↓
v2.0
```

---

*Última actualización: 2026 — Chromatix*
