# 🚀 Technical Brief: Chromatix Engine v1.2

> Versión actualizada. Los cambios respecto a v1.1 están marcados con 🆕.

---

## 1. Visión General

Chromatix no es una calculadora de color; es un **Sistema Operativo de Colorimetría (Color OS)**. Su objetivo es estandarizar el diagnóstico profesional y automatizar la creación de fórmulas químicas exactas, eliminando el error humano y optimizando el inventario del salón.

---

## 2. Pilares de la Arquitectura

El sistema se divide en cuatro capas de ejecución:

1. **The Engine (Cerebro):** Basado en el archivo `yellow_engine.json`. Procesa leyes de colorimetría universal y reglas específicas de la marca (Yellow Professional). Calcula fórmulas, tiempos y gramajes exactos.

2. **The Guardian (Seguridad):** Módulo de restricción que lee el `client_profile` antes de ejecutar el engine. Bloquea o modifica la fórmula según el estado de salud y el diagnóstico. Reglas completas en `guardian_rules.json`.

3. **The Service Log (Ficha Clínica):** Historial de servicios por cliente. Cada visita genera un `service_record` vinculado al `client_profile`. Los datos del resultado retroalimentan la próxima fórmula.

4. **🆕 The Retention Loop (Fidelización):** Motor de cálculo del próximo service. Ajusta el intervalo base según la rutina y el estilo de vida de la clienta. Reglas en `retention_logic.json`.

---

## 3. Modelo de Datos

El modelo de datos se divide en dos entidades. Ver documentación completa en `/docs/CLIENT_SCHEMA.md`.

- **`client_profile`** (`src/data/client_profile_schema.json`): Perfil persistente de la clienta. Datos personales, perfil del cabello, cuero cabelludo, salud y rutina en casa.
- **`service_record`** (`src/data/service_record_schema.json`): Registro de cada visita. Diagnóstico del momento, validación del Guardian, fórmula aplicada, resultado real y cálculo de retención.

---

## 4. Lógica de Negocio Crítica

### A. Cobertura de Canas Inteligente

El sistema calcula automáticamente la proporción Base Natural / Reflejo según el porcentaje y tipo de canas:

| % de Canas | Estrategia | Serie |
|---|---|---|
| < 30% | 100% Reflejo | — |
| 30–50% | 25% Base + 75% Reflejo | .0 o .013 según reflejo |
| > 50% | 50% Base + 50% Reflejo | .0 o .013 según reflejo |

**🆕 Distribución de canas:** La distribución (`uniform`, `concentrated_temples`, `concentrated_crown`) y el tipo (`standard` / `resistant`) modifican la técnica de aplicación. Las canas rebeldes (`resistant`) requieren mayor tiempo de exposición y pueden necesitar pre-pigmentación.

**Serie .013 (Natural Bahía):** Si el reflejo es cálido, el motor debe sugerir la serie `.013` para mantener la vibración del color.

### B. 🆕 Inputs Estructurados del Diagnóstico

El profesional debe proveer los siguientes campos para que el Guardian y el Engine funcionen correctamente:

| Campo | Tipo | Descripción |
|---|---|---|
| `current_base_level` | integer 1–10 | Nivel real observado en raíz |
| `target_level` | integer 1–10 | Nivel objetivo |
| `fiber_integrity` | enum | virgin / healthy_processed / processed / highly_processed / damaged |
| `scalp_condition` | enum | normal / sensitive / irritated / with_wounds / with_pathology |
| `porosity_at_service` | enum | low / medium / high |
| `active_treatments_at_service` | array | Tratamientos activos en la fibra |
| `gray_percentage_observed` | integer 0–100 | % de canas visible en esta visita |

### C. Protocolos de Seguridad (Guardian Rules)

Reglas completas en `src/data/guardian_rules.json`. Resumen ejecutivo:

**Hard Stops (no permiten override):**
- Alergia confirmada a PPD o resorcinol → servicio bloqueado
- Heridas abiertas en el cuero cabelludo → servicio bloqueado
- Embarazo (1er trimestre) + decoloración o tinte con amoniaco → bloqueado
- Quimioterapia activa → todos los químicos bloqueados

**Warnings (el profesional puede continuar bajo su responsabilidad):**
- Fibra muy procesada o dañada → oxidante limitado a 20 Vol + Bond Hero obligatorio
- Cuero sensible o irritado → Scalp Protector recomendado
- Salto de nivel > 4 en fibra procesada → derivar a módulo de Decoloración Controlada
- Tratamiento activo incompatible → alerta de conflicto
- Patch test no realizado o vencido → solicitar nuevo test

### D. 🆕 Modificadores de Porosidad

La porosidad afecta directamente el tiempo de exposición y el volumen de oxidante:

| Porosidad | Modificador de Tiempo | Recomendación Oxidante |
|---|---|---|
| Baja | +10% al tiempo base | Puede subir un nivel |
| Media | Sin modificación | Estándar |
| Alta | -15% al tiempo base | Bajar un nivel si es posible |

### E. Retención Dinámica (Retention Loop)

El intervalo de retención se calcula a partir de un valor base ajustado por factores de rutina:

**Intervalos base:**
- Retoque de raíz / canas: 21–28 días (default: 25)
- Color global: 40–50 días (default: 45)
- Mechas / Balayage: 60–120 días
- Keratina: 90–120 días

**🆕 Factores de ajuste:**
- Frecuencia de lavado alta (> 4 veces/semana): −5 días
- Exposición solar alta: −7 días
- Exposición a pileta o mar: −7 días
- Uso diario de calor: −5 días
- Alta porosidad: −5 días adicionales
- Uso de protector térmico y lavados poco frecuentes: hasta +8 días

Ver lógica completa en `src/data/retention_logic.json`.

### F. 🆕 Feedback Loop del Resultado

Cada `service_record` incluye un bloque `result_feedback` que se completa al finalizar el servicio:
- Nivel real obtenido vs. nivel objetivo
- Desviación del color (más cálido, más frío, desparejo, etc.)
- Resultado de cobertura de canas
- Flag de corrección para la próxima fórmula

Este feedback debe ser consultado por el Engine al generar la siguiente fórmula para esa clienta.

---

## 5. Flujo de Datos (Data Flow)

```
1. INPUT
   Profesional ingresa: Base Actual + Objetivo + Diagnóstico estructurado

2. LECTURA DE PERFIL
   El sistema carga el client_profile de la clienta
   (alergias, salud, tratamientos activos, historial)

3. GUARDIAN VALIDATION
   Cruza el diagnóstico + perfil de salud contra guardian_rules.json
   → Hard Stop: bloquea el servicio
   → Warning: alerta al profesional, puede continuar
   → OK: pasa al engine

4. ENGINE CALCULATION
   Cruza datos con yellow_engine.json
   Aplica modificadores de porosidad
   Calcula cobertura de canas
   Genera fórmula exacta (gramos + oxidante + aditivos + timer)

5. OUTPUT
   Fórmula presentada al profesional
   Consentimiento informado registrado

6. POST-SERVICIO
   Profesional completa result_feedback
   Retention Loop calcula next_service_suggested_date
   Notificación programada

7. STORAGE
   service_record guardado y vinculado al client_profile
   Inventario de productos descontado
```

---

## 6. 🆕 Privacidad y Modelo de Acceso a Datos

**MVP (almacenamiento local):**
- Los datos del `client_profile` y `service_record` se almacenan localmente en el dispositivo del profesional.
- No hay sincronización en la nube en el MVP.
- Si se desinstala la app o se cambia el dispositivo, los datos no son recuperables sin backup manual.
- **Decisión tomada:** En el MVP, el profesional es el responsable del backup de sus datos.

**Datos de salud:**
- El `health_profile` contiene datos sensibles (alergias, medicamentos, condiciones médicas).
- La UI debe tratar estos campos como confidenciales: no mostrarlos en listados generales, solo en la vista de ficha individual.
- En v2.0 (nube), se requerirá autenticación de usuario y cifrado en tránsito y en reposo.

**Retención de datos del cliente:**
- El profesional puede eliminar la ficha de una clienta. Esta acción elimina también todos sus `service_record` vinculados.
- No hay exportación de datos en el MVP.

---

## 7. Roadmap de Implementación

### MVP — Criterios de completitud
- [ ] Alta, edición y visualización del `client_profile` completo
- [ ] Carga del diagnóstico y generación de fórmula básica via engine
- [ ] Guardian ejecutando todas las reglas de `guardian_rules.json`
- [ ] `service_record` creado y guardado por cada visita
- [ ] `result_feedback` completable al finalizar el servicio
- [ ] Almacenamiento local funcional y estable
- [ ] UI de carga de ficha testeada con al menos 10 clientas reales

### v1.2 — Criterios de completitud
> Requiere MVP completo y estable.

- [ ] Retention Loop dinámico activo con todos los factores
- [ ] Notificaciones push locales para reagendado
- [ ] Módulo de home-care: recomendaciones personalizadas por tipo de servicio
- [ ] Feedback loop: el engine consulta `result_feedback` anterior al calcular nueva fórmula
- [ ] Módulo de inventario: descuento automático de productos usados

### v2.0 — Criterios de completitud
> Requiere v1.2 completo. Implica infraestructura nueva.

- [ ] Autenticación de usuarios (profesional/salón)
- [ ] Sincronización en la nube (definir proveedor: Firebase / Supabase / custom)
- [ ] Migración de datos locales a cloud para usuarios existentes
- [ ] Notificaciones por WhatsApp Business API
- [ ] Soporte multi-profesional por salón
- [ ] Motor agnóstico activado para segunda marca (post-Yellow Professional)

---

*Documento de propiedad técnica de Chromatix — v1.2 — 2026*
