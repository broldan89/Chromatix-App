# 📋 Esquema Universal de Ficha Clínica: Chromatix

Este documento define la estructura de datos obligatoria para el registro de clientes. El objetivo es transformar la atención convencional en un **Service de Ingeniería Capilar**, garantizando trazabilidad técnica y seguridad legal.

---

## 1. Identidad y Fidelización (Personal Data)
*Datos para la gestión del cliente y marketing.*
- **Perfil:** Nombre, edad y contacto.
- **Origen:** Canal por el cual llegó (Recomendación, Instagram, Google). Permite medir el ROI del marketing del salón.
- **Estilo de Comunicación:** Notas sobre si la clienta es detallista, prefiere rapidez o busca asesoramiento profundo.

## 2. Alertas Críticas (Medical & Safety)
*El "Seguro de Vida" del profesional.*
- **Alergias:** Registro obligatorio de reacciones a parafenilendiamina (PPD), látex o fragancias.
- **Estado Hormonal:** Registro de embarazo, lactancia o tratamientos de tiroides (factores que alteran la fijación del color).
- **Consentimiento Informado:** Confirmación de firma digital para servicios de alto impacto químico.

## 3. ADN de la Fibra (Hair Baseline)
*Diagnóstico físico inicial.*
- **Arquitectura:** Tipo (liso/afro), textura (fino/grueso) y densidad.
- **Porosidad:** Nivel de absorción de la cutícula (Baja, Media, Alta).
- **Cuero Cabelludo:** Dermatología básica (Graso, sensible, presencia de caspa o descamación).

## 4. Legado Químico (Chemical History)
*Lo que el cabello "recuerda" de procesos anteriores.*
- **Historial de Color:** Marcas y tonos usados previamente.
- **Procesos Térmicos/Químicos:** Keratinas, alisados y cantidad de decoloraciones acumuladas.
- **Prueba de Hebra:** Resultado de elasticidad y resistencia antes de proceder.

## 5. Rutina de Mantenimiento (Home Care)
*Análisis de hábitos para potenciar la venta de insumos.*
- **Frecuencia de Lavado:** Impacta directamente en la duración del reflejo.
- **Herramientas de Calor:** Uso de planchas y secadores (¿Usa protector térmico?).
- **Inventario Personal:** Qué productos usa actualmente (Oportunidad de reemplazo por productos profesionales).

## 6. Registro del Service (Technical Log)
*La "Caja Negra" de cada visita.*
- **Diagnóstico del Día:** Motivo de consulta y expectativas reales.
- **Ejecución Técnica:**
  - **Fórmula:** Cruzada con el `yellow_engine.json`.
  - **Oxidante:** Volumen y técnica de aplicación.
  - **Aditivos:** Uso de Bond Hero o Scalp Protector.
- **Resultados:** Observaciones del profesional sobre cómo respondió la fibra y registro fotográfico (Antes/Después).

## 7. Retención y Seguimiento (Post-Service)
*El "Service Vehicular" (Próximo Cambio de Aceite).*
- **Gap de Venta:** Productos recomendados vs. Productos comprados.
- **Ciclo de Retorno:** Cálculo automático de días para el próximo retoque (Canas: 21-28 días | Color: 35-45 días).
- **Restricciones:** Cuidados inmediatos (ej. no lavar por 48hs).

---
> **Nota para el Desarrollador:** Todos los campos marcados como "Medical" deben disparar alertas visuales (Rojo/Amarillo) en la interfaz de mezcla si presentan condiciones de riesgo.
