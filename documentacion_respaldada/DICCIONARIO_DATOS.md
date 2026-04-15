# 📖 Diccionario de Datos - Motor Chromatix

Este documento define la estructura y lógica de los archivos CSV que alimentan el motor de colorimetría de Chromatix. Es la referencia técnica para asegurar la interpretación correcta de las reglas de Yellow Professional.

---

## 👩‍🦱 1. Tabla: `niveles_naturales.csv`
Base del diagnóstico. Define la biología del cabello.
- **`Nivel`**: Escala 1-10.
- **`Fondo_Revelado`**: Pigmento subyacente (ej. Rojo, Naranja).
- **`Neutralizante_Sugerido`**: Reflejo teórico para contrarrestar el fondo.

## 🎨 2. Tabla: `reflejos_logic.csv`
Comportamiento de los pigmentos de la carta de color.
- **`Codigo`**: Nomenclatura comercial (ej. .21, .1).
- **`Neutraliza_A`**: Color de fondo que elimina.
- **`Potencia`**: Intensidad (Alta, Normal, Suave).

## ⏱️ 3. Tabla: `tiempos_volumenes.csv`
Fuerza química necesaria según el objetivo.
- **`Aclarado_Deseado`**: Salto en niveles (1 a 4).
- **`Volumen_Ox`**: 10, 20, 30 o 40 Vol.
- **`Tiempo_Min`**: Tiempo sugerido de exposición.

## 📏 4. Tabla: `mezclas_ratio.csv`
Proporciones técnicas de mezcla.
- **`Tipo_Servicio`**: Coloración, Tonalización, Superaclarante.
- **`Ratio`**: Relación Tinte:Oxidante (1:1.5, 1:2, etc.).

## 🧪 5. Tabla: `decoloracion_logic.csv` (Nuevo ✨)
Estrategia para aclarados extremos (Salto > 4 niveles).
- **`Producto`**: Bleach 7 (Seguridad) o Bleach 9 (Potencia).
- **`Fondo_Objetivo`**: Nivel de aclarado deseado (8, 9 o 10).
- **`Uso_Recomendado`**: Contexto (Cabello sensibilizado vs. Resistente).

## ⚖️ 6. Tabla: `consumo_insumos.csv` (Nuevo ✨)
Dosificación física según la estructura capilar para evitar desperdicio.
- **`Largo_Cabello`**: Corto, Medio, Largo.
- **`Densidad`**: Baja o Alta.
- **`Gramos_Tinte_Color` / `Gramos_Polvo_Deco`**: Cantidad de producto seco.

---

## 🛠️ Notas de Implementación para el Desarrollador
El algoritmo debe ejecutar la lógica en este orden de prioridades:

1. **Bifurcación Inicial:** Calcular `Salto`. Si `Salto` > 4 -> Derivar a `decoloracion_logic.csv`.
2. **Selección de Producto:** Cruzar `Estado_Fibra` (Input) con `Uso_Recomendado` (CSV 5).
3. **Cálculo de Mezcla:** - Buscar `Gramos` en `consumo_insumos.csv` según Largo/Densidad.
   - Multiplicar `Gramos` por el `Ratio` de la tabla correspondiente para obtener el `ML_Oxidante`.
4. **Sugerencias de Seguridad:** Si `Volumen_Ox` >= 30, disparar alerta de **Bond Hero**.
