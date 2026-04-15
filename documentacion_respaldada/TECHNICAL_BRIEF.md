# 🚀 Technical Brief: Chromatix Engine v1.1

## 1. Visión General
Chromatix no es una calculadora de color; es un **Sistema Operativo de Colorimetría (Color OS)**. Su objetivo es estandarizar el diagnóstico profesional y automatizar la creación de fórmulas químicas exactas, eliminando el error humano y optimizando el inventario del salón.

## 2. Pilares de la Arquitectura
El sistema se divide en tres capas de ejecución:
1.  **The Engine (Cerebro):** Basado en el archivo `yellow_engine.json`. Procesa leyes de colorimetría universal y reglas específicas de la marca (Yellow Professional).
2.  **The Guardian (Seguridad):** Un módulo de restricción que bloquea o sugiere cambios en la fórmula según el estado de salud del cabello y cuero cabelludo.
3.  **The Service Log (Ficha Clínica):** Un historial de eventos tipo "Service Vehicular" que gestiona el ciclo de vida capilar de la clienta.

## 3. Lógica de Negocio Crítica

### A. Cobertura de Canas Inteligente (Opción B)
El sistema debe calcular automáticamente la proporción de Base Natural (.0 o .013) según el porcentaje de canas ingresado:
- **<30%:** Reflejo puro.
- **30-50%:** 25% Base + 75% Reflejo.
- **>50%:** 50% Base + 50% Reflejo (Relación 1:1).
*Nota: Si el reflejo es cálido, el motor debe sugerir la serie .013 (Natural Bahía) para mantener la vibración del color.*

### B. Protocolos de Seguridad (Hard-Stop Rules)
El software debe implementar restricciones lógicas basadas en el diagnóstico:
- **Cabello Sensibilizado:** Bloqueo de oxidantes de 30 y 40 Vol. Sugerencia mandatoria de **Bond Hero**.
- **Cuero Cabelludo Sensible:** Alerta visual y adición de **Scalp Protector** a la lista de insumos.
- **Riesgo de Rotura:** Si el salto de tono deseado es >4 en cabello procesado, la app debe derivar al módulo de "Decoloración Controlada" o sugerir "Tonalización".

### C. Retención (Retention Loop)
Cada servicio debe generar una fecha de "Próximo Service" basada en el desgaste técnico:
- **Retoque de raíz/canas:** 21-28 días.
- **Color global:** 45 días.
El sistema debe emitir notificaciones push al profesional para la re-agenda.

## 4. Flujo de Datos (Data Flow)
1.  **Input:** Profesional ingresa Base Actual + Objetivo + Estado del Pelo.
2.  **Consult:** El sistema cruza datos con `yellow_engine.json`.
3.  **Validation:** El Guardián chequea contraindicaciones.
4.  **Output:** Fórmula exacta en gramos (Tinte + Oxidante + Aditivos) + Timer de exposición.
5.  **Storage:** Los datos se guardan bajo el esquema de `client_record_schema.json`.

## 5. Roadmap de Implementación
- [ ] **MVP:** Interfaz de cálculo básica + Guardado local de fichas de clientes.
- [ ] **v1.2:** Módulo de alertas de seguridad activo y sugerencia de mantenimiento home-care.
- [ ] **v2.0:** Sincronización en la nube y recordatorios automáticos por WhatsApp.

---
*Documento de propiedad técnica de Chromatix - 2026*
