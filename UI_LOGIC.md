# 🖱️ Lógica de Interfaz (UI Logic) - Chromatix

Este documento describe el comportamiento funcional de cada componente visual y su interacción con los conjuntos de datos (.csv).

---

## 1. Pantalla de Inicio (Dashboard)
Es el punto de entrada principal. El objetivo es minimizar la fricción del colorista.

- **Botón "Nuevo Diagnóstico" (Acción Primaria):** - **Función:** Inicia el algoritmo de cálculo. 
    - **Destino:** Pantalla de Entrada de Datos.
- **Botón "Calculadora Libre" (Acción Secundaria):** - **Función:** Abre un selector de ratios (1:1.5, 1:2) para mezclas manuales rápidas. 
    - **Referencia:** Consulta `Mezclas_Ratio.csv`.
- **Sección "Trabajos Recientes":** - **Función:** Lista las últimas 3 entradas de la base de datos de historial.
    - **Datos:** Muestra Nombre, Fórmula (ej. 8.21 + 40 Vol) y Tiempo transcurrido.

## 2. Flujo de Diagnóstico (Input)
El usuario ingresa las variables del cabello de la clienta.

- **Selector de Nivel Natural (1-10):** - **Componente:** Slider o Grid visual con fotos de referencia.
    - **Lógica:** Al seleccionar un número, el sistema identifica el `Fondo_Revelado` correspondiente en `Niveles_Naturales.csv`.
- **Selector de Nivel Deseado (1-10):** - **Lógica:** El sistema resta `Nivel_Deseado - Nivel_Natural` para calcular cuántos tonos se deben aclarar.
- **Switch de Canas (Sí/No):** - **Lógica:** Si es "Sí", el sistema debe priorizar la mezcla con serie natural (.0) para cobertura, según la lógica de Yellow.

## 3. Pantalla de Resultados (Output)
Muestra la "Receta" final calculada por el motor.

- **Tarjeta de Fórmula:** - **Cálculo:** Muestra el Tono Sugerido (neutralizador + base) y el Volumen de Oxidante. 
    - **Referencia:** Cruza datos de `Reflejos_Logic.csv` y `Tiempos_Y_Volumenes.csv`.
- **Módulo de Mezcla:** - **Lógica:** Calcula los gramos/mililitros exactos basándose en el ratio (ej: si el usuario pone 60g de tinte, mostrar 90ml de oxidante).
- **Temporizador (Timer):** - **Función:** Al presionar "Iniciar", comienza la cuenta regresiva basada en el tiempo sugerido en la tabla.

---

## 🛠️ Notas para el Desarrollador
- **Validación:** Si el sistema detecta que el aclarado solicitado es mayor a 4 niveles, debe mostrar una alerta de "Uso de Superaclarante requerido".
- **Agnosticismo:** Los componentes visuales deben ser genéricos para permitir cambiar de marca (Yellow a otra) simplemente actualizando los archivos `.csv`.
