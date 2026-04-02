# 🛠️ Brief Técnico: Chromatix MVP (v1.0)

## 1. Stack Tecnológico Recomendado
- **Framework:** React Native (Expo) o Flutter.
- **Base de Datos:** Local (SQLite) + Sincronización en la nube (Firebase/Supabase) para el Multimarca.
- **Gestión de Datos:** Procesamiento de archivos `.csv` o conversión a `JSON`.

## 2. El Algoritmo "Corazón" (Core Logic)
El sistema debe realizar una intersección de 3 ejes:
1. **Salto de Tonos:** (Deseado - Natural) -> Consulta `tiempos_volumenes.csv`.
2. **Neutralización:** Identificar `Fondo_Revelado` en `niveles_naturales.csv` -> Sugerir `Codigo` en `reflejos_logic.csv`.
3. **Dosificación:** Consultar `consumo_insumos.csv` según el Input de Largo/Densidad.

## 3. Flujo de Pantallas (User Journey)
- **Splash Screen:** Logo de Chromatix (Carga de marca por defecto: Yellow Professional).
- **Home:** Botón "Nuevo Diagnóstico" + Historial rápido.
- **Wizard de Diagnóstico:** - Paso 1: Selección de Niveles (1-10).
    - Paso 2: Atributos de Fibra (Canas, Porosidad, Largo).
- **Resultado Final:** Tarjeta con Fórmula + Volumen Ox + Gramajes + Timer de exposición.

## 4. Reglas de Negocio Innegociables
- **Seguridad:** Bloquear mezclas con 40 Vol si el estado es "Sensibilizado".
- **Upselling:** Mostrar sugerencia de "Bond Hero" como pop-up obligatorio antes del resultado final si el Vol >= 30.
- **Multimarca:** La lógica de cálculo debe estar separada de los datos (Agnóstica).
