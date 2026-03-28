# 🖱️ Lógica de Interfaz (UI Logic) - Chromatix

Este documento define el comportamiento funcional de los componentes visuales y su interacción con los datos maestros (.csv).

---

## 1. Pantalla de Inicio (Dashboard)
- **Botón "Nuevo Diagnóstico":** Inicia el algoritmo de cálculo.
- **Botón "Calculadora Libre":** Acceso rápido a ratios de mezcla (`mezclas_ratio.csv`).
- **Sección "Trabajos Recientes":** Lista las últimas 3 entradas del historial de clientes.

## 2. Flujo de Diagnóstico (Input)
- **Selector de Nivel Natural (1-10):** Define el `Fondo_Revelado` inicial.
- **Selector de Nivel Deseado (1-10):** Calcula el salto de niveles ($Deseado - Natural$).
- **Switch de Canas (Sí/No):** Si es "Sí", el sistema prioriza la serie natural (.0) para cobertura.

## 3. Reglas de Asistencia Técnica (Cuidado de la Fibra) 🛡️
El sistema debe disparar sugerencias automáticas de productos aditivos según el riesgo químico:

| Condición Técnica | Sugerencia Automática | Producto Recomendado |
| :--- | :--- | :--- |
| Si `Volumen_Ox` >= 30 Vol | "Proteger estructura capilar" | **Bond Hero** (5ml por mezcla) |
| Si `Salto_Niveles` > 3 | "Reforzar enlaces de queratina" | **Bond Hero** |
| Si `Tipo_Servicio` == "Decoloración" | "Protección de piel sensible" | **Scalp Protector** |
| Si `Fondo_Revelado` == Amarillo/Naranja | "Matización de alta potencia" | **Reflejo .21 (Irisado Ceniza)** |

## 4. Pantalla de Resultados (Output)
- **Tarjeta de Fórmula:** Muestra Tono Sugerido + Volumen de Oxidante.
- **Módulo de Mezcla:** Gramaje exacto basado en el `Ratio`.
- **🛒 Botón "Confirmar & Descontar":** - Al presionar, se restan los gramos/ml del inventario local.
    - Si el stock de un tinte o aditivo baja del 20%, genera una alerta en la **Smart Shopping List**.

## 5. Módulo de Pedidos (Supply Chain)
- **Lógica:** Si un producto sugerido (ej. Bond Hero) no está en stock según el inventario del salón, mostrar botón: **"Pedir a Distribuidora ahora"**.

---

## 🛠️ Notas para el Desarrollador
- **Prioridad de Seguridad:** El sistema nunca debe sugerir 40 Vol en cabellos declarados como "Sensibilizados" por el usuario.
- **Interconectividad:** La sugerencia de Bond Hero debe aparecer como un "Pop-up" antes de mostrar la fórmula final para fomentar el upselling técnico.
