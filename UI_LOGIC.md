# 🖱️ Lógica de Interfaz (UI Logic) - Chromatix

Este documento define el comportamiento funcional de los componentes visuales y su interacción con los datos maestros (.csv).

---

## 1. Pantalla de Inicio (Dashboard)
- **Botón "Nuevo Diagnóstico":** Inicia el flujo de cálculo.
- **Botón "Calculadora Libre":** Acceso rápido a ratios de mezcla (`mezclas_ratio.csv`).
- **Sección "Trabajos Recientes":** Lista las últimas 3 entradas del historial de clientes.

## 2. Flujo de Diagnóstico (Input)
### A. Parámetros de Color
- **Selector de Nivel Natural (1-10):** Define el `Fondo_Revelado` inicial.
- **Selector de Nivel Deseado (1-10):** Calcula el salto de niveles ($Deseado - Natural$).
- **Switch de Canas (Sí/No):** Si es "Sí", prioriza serie natural (.0).

### B. Estructura Capilar (Nuevo ⚖️)
- **Selector de Largo:** Corto, Medio, Largo.
- **Selector de Densidad:** Baja, Media, Alta.
- **Estado de Fibra:** Saludable, Sensibilizado, Poroso.

## 3. Inteligencia de Bifurcación (Tinte vs. Decoloración) 🧠
- **Regla:** Si `Salto_Niveles` > 4, el sistema oculta el resultado de tinte y muestra: *"⚠️ Salto extremo detectado. Se recomienda pasar al Módulo de Decoloración"*.
- **Selección de Bleach:** - Si "Sensibilizado" -> Sugerir **Bleach 7**.
    - Si "Base < 4" + "Deseado > 8" -> Sugerir **Bleach 9**.

## 4. Reglas de Asistencia Técnica (Cuidado & Upselling) 🛡️
| Condición Técnica | Sugerencia Automática | Producto Recomendado |
| :--- | :--- | :--- |
| Si `Volumen_Ox` >= 30 Vol | "Proteger estructura capilar" | **Bond Hero** (5ml) |
| Si `Tipo_Servicio` == "Decoloración" | "Protección de piel sensible" | **Scalp Protector** |
| Si `Porosidad` == "Alta" | "Ajuste de absorción" | **+10% mezcla adicional** |
| Si `Fondo` == Amarillo/Naranja | "Matización de alta potencia" | **Reflejo .21 (Irisado)** |

## 5. Pantalla de Resultados (Output)
- **Tarjeta de Fórmula:** Muestra Tono Sugerido + Volumen de Oxidante + Tiempo de Exposición.
- **Dosificación Exacta:** Basada en `consumo_insumos.csv`, muestra gramos/ml precisos según Largo y Densidad.
- **🛒 Botón "Confirmar & Descontar":** Al presionar, descuenta stock del inventario local.
- **Botón "Pedir Stock":** Aparece si el producto sugerido no tiene existencia.

---

## 🛠️ Notas para el Desarrollador
- **Cálculo de Mezcla:** El sistema debe multiplicar el `Gramos_Tinte` o `Gramos_Polvo` de la tabla de consumos por el `Ratio` correspondiente.
- **Interconectividad:** La sugerencia de Bond Hero debe ser un paso obligatorio (Pop-up) antes de ver la mezcla final.
