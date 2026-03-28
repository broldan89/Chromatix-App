# 📖 Diccionario de Datos - Motor Chromatix

Este documento define la estructura y lógica de los archivos CSV que alimentan el motor de colorimetría de Chromatix. Es la referencia técnica para asegurar que el desarrollo de software interprete correctamente las reglas de la marca (Yellow Professional).

---

## 👩‍🦱 1. Tabla: `niveles_naturales.csv`
Es la base del diagnóstico. Define qué sucede físicamente con el cabello al ser aclarado.

- **`Nivel`**: Escala numérica internacional (1 al 10) que define la oscuridad/claridad natural.
- **`Fondo_Revelado`**: El pigmento subyacente que aparece al aclarar (ej: Rojo, Naranja, Amarillo).
- **`Neutralizante_Sugerido`**: El reflejo teórico necesario para contrarrestar el fondo revelado.

## 🎨 2. Tabla: `reflejos_logic.csv`
Define el comportamiento de los pigmentos de la carta de color.

- **`Codigo`**: El número comercial del tinte (ej: .21, .11, .1).
- **`Pigmento_Base`**: El color físico del reflejo (Azul, Violeta, Verde, etc.).
- **`Neutraliza_A`**: El color de fondo que este código específico está diseñado para eliminar.
- **`Potencia`**: Clasifica la intensidad del pigmento (Alta, Normal o Suave).

## ⏱️ 3. Tabla: `tiempos_y_volumenes.csv`
Determina la fuerza química necesaria para alcanzar el objetivo.

- **`Aclarado_Deseado`**: La diferencia en niveles (saltos) entre la base natural y el objetivo (1, 2, 3 o 4 tonos).
- **`Volumen_Ox`**: El volumen de agua oxigenada recomendado (10, 20, 30 o 40 Vol).
- **`Tiempo_Min`**: El tiempo de exposición sugerido en minutos para una reacción completa.

## 📏 4. Tabla: `mezclas_ratio.csv`
Define las proporciones exactas para la preparación del producto.

- **`Tipo_Servicio`**: Categoría del trabajo (Coloración, Tonalización, Superaclarante).
- **`Ratio`**: Relación Tinte:Oxidante (ej: 1:1.5 significa que por cada 60g de tinte se usan 90ml de oxidante).

---

## 🛠️ Notas de Implementación para el Desarrollador
El flujo lógico del algoritmo debe seguir este orden:
1. **Entrada:** `Nivel_Actual` + `Nivel_Deseado`.
2. **Cálculo de Salto:** Restar niveles para consultar `tiempos_volumenes.csv`.
3. **Identificación de Fondo:** Consultar `niveles_naturales.csv` para saber qué color neutralizar.
4. **Sugerencia de Reflejo:** Buscar en `reflejos_logic.csv` el código que coincida con el fondo identificado.
5. **Cálculo de Mezcla:** Aplicar el `Ratio` según el tipo de servicio seleccionado.
