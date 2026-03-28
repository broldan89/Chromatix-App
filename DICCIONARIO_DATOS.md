# 📖 Diccionario de Datos - Motor Chromatix

Este documento define la lógica de las columnas en los archivos CSV para asegurar una integración correcta en el desarrollo del software.

---

## 🎨 Tabla: `Reflejos_Logic.csv`
Define cómo se comportan los pigmentos de la marca (Yellow Professional).

- **`Codigo`**: El número comercial del tinte (ej. .21, .11).
- **`Pigmento_Base`**: El color físico del reflejo (Azul, Violeta, etc.).
- **`Neutraliza_A`**: El fondo de aclaración que este código debe eliminar.
- **`Potencia`**: 
  - **Alta**: Reflejos intensos (.11).
  - **Normal**: Reflejos estándar (.1).
  - **Suave**: Reflejos con 0 (.01).

## 📏 Tabla: `Mezclas_Ratio.csv`
Define las proporciones químicas para la preparación.

- **`Tipo_Servicio`**: Coloración, Tonalización o Súper Aclarante.
- **`Ratio`**: Relación Tinte:Oxidante (ej. 1:1.5 significa 60g de tinte + 90ml de agua oxigenada).

## ⏱️ Tabla: `Tiempos_Y_Volumenes.csv`
Determina la potencia del oxidante según el objetivo.

- **`Aclarado_Deseado`**: Cuántos niveles queremos subir (1, 2, 3 o 4 niveles).
- **`Volumen_Ox`**: El volumen de agua oxigenada sugerido (10, 20, 30, 40 Vol).
- **`Tiempo_Min`**: Tiempo de exposición en minutos para que la química haga efecto.

---
**Nota para el desarrollador:** El flujo lógico siempre debe ser: 
`Diagnóstico Inicial` -> `Cálculo de Aclarado` -> `Elección de Oxidante/Tiempo` -> `Identificación de Fondo` -> `Sugerencia de Reflejo`.
