📋 Especificación Técnica del Schema de Cliente
Este documento define la estructura de datos para la persistencia de información en Chromatix. Se divide en dos entidades: Perfil Permanente (estático) y Registro de Servicio (dinámico/log).

1. Perfil del Cliente (client_profile)
Datos de salud, identidad y características base que persisten entre visitas.

Campo	Tipo	Valores / Ejemplo	Descripción
id	UUID	550e8400-e29b...	Identificador único del cliente.
name	String	"Lucía Pérez"	Nombre completo.
phone	String	"+54 9 341 123456"	Contacto principal.
birth_date	Date	1990-05-15	Para cálculo de edad y fidelización.
Alertas Médicas	Object		
allergies	Array	["PPD", "Látex"]	Dispara alertas críticas en la mezcla.
medications	String	"Levotiroxina"	Medicamentos que afectan la porosidad/fijación.
hormonal_status	Enum	none, pregnancy, lactation, menopause	Factores de alteración química.
ADN Capilar	Object		
natural_base	Number	4, 5, 6	Altura de tono natural base.
scalp_type	Enum	normal, oily, dry, sensitive	Alimenta al Guardian.
active_treatments	Array	["keratin", "straightening"]	Procesos vigentes en la fibra.
2. Registro de Servicio (service_record)
Historial de visitas (Service Log) con Feedback Loop.

A. Diagnóstico de Entrada (Inputs del Profesional)

Estos campos son obligatorios para que el Yellow_engine calcule los modificadores dinámicos:

fiber_integrity: (virgin, processed, damaged, critically_damaged).

porosity: (low, medium, high).

gray_hair:

percentage: 0 a 100.

type: (standard, resistant).

distribution: (uniform, temples, crown, scattered).

B. Ejecución Técnica

formula_calculated: Objeto con gramos de tinte, vol de oxidante y aditivos.

timer_result: Tiempo final (Base +/- Modificadores).

informed_consent: Boolean. Registro de que el profesional comunicó los riesgos detectados por el Guardian.

C. Feedback Loop (Cierre del Círculo)

Al finalizar, el profesional debe registrar el resultado real para ajustar futuras fórmulas:

achieved_level: Altura de tono alcanzada realmente.

tone_deviation: (perfect, too_warm, too_cool, uneven).

coverage_result: (complete, partial, failed).

observations: Texto libre (ej: "Saturar más en zona de sienes").

3. Lógica de Retención Dinámica (retention_loop)
El intervalo para la próxima cita se calcula cruzando el service_record con los hábitos del cliente:

Input de Hábito	Impacto en Fecha
wash_frequency	daily (-7 días) / standard (0)
sun_exposure	high (-5 días)
pool_sea_exposure	yes (-10 días)
Fórmula de cálculo:
Fecha_Hoy + Intervalo_Base(28/45) + Modificadores_Hábitos = Fecha_Sugerida_Retorno

4. Privacidad y Seguridad (Data Privacy)
Almacenamiento Local (MVP): Los datos se guardan cifrados en el dispositivo del profesional (SQLite / EncryptedStorage).

Propiedad: El profesional es el custodio de los datos de salud bajo su responsabilidad técnica.

Migración: El paso a Cloud requerirá encriptación End-to-End (E2EE) para cumplimiento de normativas de datos de salud.
