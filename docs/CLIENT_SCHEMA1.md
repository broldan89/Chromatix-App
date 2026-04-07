# 📋 Chromatix — Documentación del Schema de Cliente

> Documento de referencia para desarrolladores y diseñadores de UI.
> Los schemas técnicos (JSON) viven en `/src/data/`. Este documento explica el modelo de datos en lenguaje humano.

---

## Modelo de datos: dos entidades separadas

Chromatix divide la información de cada clienta en dos entidades distintas que no deben mezclarse:

| Entidad | Archivo | Cuándo se crea | Cuándo se actualiza |
|---|---|---|---|
| `client_profile` | `client_profile_schema.json` | Al dar de alta a la clienta (primera visita) | Cuando cambian sus datos, salud, cabello o rutina |
| `service_record` | `service_record_schema.json` | Al iniciar cada visita | Al finalizar el servicio (agregar feedback) |

Un `client_profile` puede tener muchos `service_record` vinculados. La relación es: `service_record.client_id → client_profile.id`.

---

## client_profile — Ficha persistente

### Bloque 1: Datos personales
| Campo | Tipo | Requerido | Notas |
|---|---|---|---|
| `id` | UUID string | ✅ | Generado automáticamente |
| `personal_data.full_name` | string | ✅ | |
| `personal_data.phone` | string | ✅ | |
| `personal_data.birth_date` | date | — | |
| `personal_data.email` | email | — | |
| `personal_data.instagram` | string | — | Handle sin @ |
| `personal_data.notes` | string | — | Notas privadas del estilista |
| `referral_source` | enum | — | recommendation / instagram / google / walk_in / other |
| `assigned_stylist_id` | string | — | ID del profesional |

### Bloque 2: Perfil del cabello
| Campo | Tipo | Requerido | Valores posibles |
|---|---|---|---|
| `hair_profile.hair_type` | enum | ✅ | straight / wavy / curly / coily |
| `hair_profile.texture` | enum | ✅ | fine / medium / thick |
| `hair_profile.density` | enum | ✅ | low / medium / high |
| `hair_profile.length` | enum | ✅ | short / medium / long / extra_long |
| `hair_profile.porosity` | enum | ✅ | low / medium / high |
| `hair_profile.overall_condition` | enum | ✅ | virgin / healthy_processed / processed / highly_processed / damaged |
| `hair_profile.gray_profile.percentage` | integer 0-100 | — | % estimado de canas |
| `hair_profile.gray_profile.distribution` | enum | — | none / uniform / concentrated_temples / concentrated_crown / scattered |
| `hair_profile.gray_profile.gray_type` | enum | — | standard / resistant |
| `hair_profile.active_treatments` | array | — | Ver valores en schema |
| `hair_profile.previous_chemical_history.bleaching_count` | integer | — | Decoloraciones acumuladas en la fibra actual |
| `hair_profile.previous_chemical_history.current_base_level` | integer 1-10 | — | Nivel real actual |

### Bloque 3: Perfil del cuero cabelludo
| Campo | Tipo | Requerido | Valores posibles |
|---|---|---|---|
| `scalp_profile.scalp_type` | enum | ✅ | normal / oily / dry / mixed |
| `scalp_profile.sensitivity` | enum | ✅ | low / medium / high |
| `scalp_profile.conditions` | array enum | — | dandruff / seborrheic_dermatitis / psoriasis / folliculitis / alopecia / irritation / none |
| `scalp_profile.hair_loss_concern` | boolean | — | |

### Bloque 4: Perfil de salud ⚠️ Confidencial
| Campo | Tipo | Requerido | Notas |
|---|---|---|---|
| `health_profile.allergies` | array | — | Cada ítem: allergen + severity + notes |
| `health_profile.patch_test.performed` | boolean | — | |
| `health_profile.patch_test.result` | enum | — | negative / mild_reaction / positive |
| `health_profile.strand_test.elasticity_result` | enum | — | good / low / very_low |
| `health_profile.current_medications` | array | — | Ver tipos en schema |
| `health_profile.hormonal_status` | enum | — | none / pregnant / breastfeeding / menopause / hormonal_treatment |
| `health_profile.medical_conditions` | array | — | Ver tipos en schema |

### Bloque 5: Rutina en casa
Afecta directamente el **Retention Loop** (cálculo del próximo service).

| Campo | Tipo | Notas |
|---|---|---|
| `home_care_routine.wash_frequency_per_week` | integer | Lavados por semana |
| `home_care_routine.heat_tools_use` | enum | never / occasionally / frequent / daily |
| `home_care_routine.sun_exposure` | enum | low / medium / high |
| `home_care_routine.pool_sea_exposure` | boolean | |

### Bloque 6: Consentimiento
| Campo | Tipo | Requerido |
|---|---|---|
| `consent.health_declaration_completed` | boolean | ✅ |
| `consent.data_processing_accepted` | boolean | ✅ |

---

## service_record — Registro de visita

### Campos clave
| Campo | Tipo | Requerido | Notas |
|---|---|---|---|
| `client_id` | string | ✅ | Vincula al client_profile |
| `service_date` | datetime | ✅ | |
| `service_type` | enum | ✅ | Ver schema para valores |
| `client_request` | string | — | Qué pidió la clienta |

### diagnosis — Diagnóstico al momento del servicio
> Puede diferir del client_profile si el cabello cambió desde la última visita.

| Campo | Requerido | Impacto en el engine |
|---|---|---|
| `current_base_level` | ✅ | Punto de partida del cálculo |
| `target_level` | ✅ | Nivel objetivo |
| `level_jump` | Calculado | Dispara W-004 si > 4 |
| `fiber_integrity` | ✅ | Limita oxidante (W-001) y activa Bond Hero (W-002) |
| `scalp_condition` | ✅ | Activa Scalp Protector (W-003) o hard stop (HS-002) |
| `porosity_at_service` | ✅ | Modifica tiempo de exposición |
| `active_treatments_at_service` | — | Activa alerta W-005 |

### guardian_validation — Resultado del Guardian
El Guardian corre automáticamente antes de generar la fórmula. Sus resultados quedan registrados en el service_record:
- `alerts_triggered`: lista de alertas activadas
- `service_blocked`: true si hubo un hard_stop
- `override_by_stylist`: true si el profesional continuó a pesar de una advertencia

### formula — Fórmula generada
| Campo | Notas |
|---|---|
| `components` | Array con cada producto: tipo, marca, referencia, gramos |
| `oxidant_volume` | 10 / 20 / 30 / 40 Vol. Limitado por guardian si la fibra está dañada |
| `exposure_time_minutes` | Ya incluye el modificador de porosidad |
| `porosity_modifier_applied` | Factor aplicado. Ej: 0.85 = -15% |
| `gray_coverage_strategy` | Base % + Reflejo % + serie usada (.0 o .013) |

### result_feedback — Feedback post-servicio
Se completa al finalizar el servicio. Alimenta la corrección de fórmulas futuras.

| Campo | Notas |
|---|---|
| `achieved_level` | Nivel real obtenido |
| `color_deviation` | as_expected / warmer / cooler / uneven / insufficient_lift / over_lifted |
| `coverage_result` | Resultado de cobertura de canas |
| `formula_correction_flag` | Si true → próxima fórmula debe ajustarse |
| `correction_notes` | Qué ajustar la próxima vez |

### retention — Próximo service
| Campo | Notas |
|---|---|
| `base_interval_days` | Según tipo de servicio (ver retention_logic.json) |
| `adjusted_interval_days` | Base + factores de rutina de vida |
| `next_service_suggested_date` | Fecha calculada |
| `retention_factors_applied` | Lista de factores que modificaron el intervalo |

---

## Flujo de datos entre módulos

```
client_profile
    ↓ (lee health_profile + hair_profile)
Guardian Validation
    ↓ (si no hay hard_stop)
Engine (yellow_engine.json)
    ↓ (lee diagnosis + porosity + gray_profile)
Formula generada
    ↓
service_record creado (formula + guardian_validation)
    ↓
result_feedback completado al finalizar
    ↓
Retention Loop calcula next_service_suggested_date
    ↓
Notificación programada
```

---

*Versión 1.0.0 — Chromatix 2026*
