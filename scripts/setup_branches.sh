#!/bin/bash

# =============================================================
# Chromatix — Script de setup de estructura de ramas
# Ejecutar UNA SOLA VEZ después de clonar el repo
# =============================================================

echo "🌈 Chromatix — Configurando estructura de ramas..."

# Verificar que estamos en el repo correcto
if [ ! -f "README.md" ]; then
  echo "❌ Error: ejecutá este script desde la raíz del repo Chromatix-App"
  exit 1
fi

# -----------------------------------------------
# 1. Asegurar que main está actualizado
# -----------------------------------------------
echo ""
echo "📌 Actualizando main..."
git checkout main
git pull origin main

# -----------------------------------------------
# 2. Crear rama develop desde main (si no existe)
# -----------------------------------------------
echo ""
echo "🔀 Creando rama develop..."
git checkout -b develop 2>/dev/null || git checkout develop
git push -u origin develop

# -----------------------------------------------
# 3. Subir los archivos nuevos a develop
# -----------------------------------------------
echo ""
echo "📁 Subiendo archivos nuevos a develop..."
git checkout develop

# Copiar archivos al repo (asumir que están en el mismo directorio que este script)
# Los archivos ya deberían estar en sus carpetas correctas dentro del repo

git add docs/GIT_STRATEGY.md
git add docs/CLIENT_SCHEMA.md
git add docs/TECHNICAL_BRIEF.md
git add src/data/client_profile_schema.json
git add src/data/service_record_schema.json
git add src/data/guardian_rules.json
git add src/data/retention_logic.json

git commit -m "docs: agregar estrategia de ramas, schemas completos y technical brief v1.2

- docs/GIT_STRATEGY.md: modelo de ramas y convención de commits
- docs/CLIENT_SCHEMA.md: documentación legible del modelo de datos
- docs/TECHNICAL_BRIEF.md: brief técnico actualizado a v1.2
- src/data/client_profile_schema.json: schema completo del perfil persistente
- src/data/service_record_schema.json: schema de registro de visita
- src/data/guardian_rules.json: reglas de validación y alertas de seguridad
- src/data/retention_logic.json: lógica del retention loop dinámico"

git push origin develop

# -----------------------------------------------
# 4. Crear ramas de feature desde develop
# -----------------------------------------------
echo ""
echo "🌿 Creando ramas de feature..."

branches=(
  "feature/client-profile"
  "feature/service-record"
  "feature/guardian-engine"
  "feature/retention-loop"
  "feature/notifications"
)

for branch in "${branches[@]}"; do
  git checkout develop
  git checkout -b "$branch" 2>/dev/null && git push -u origin "$branch" && echo "  ✅ $branch" || echo "  ⚠️  $branch ya existe"
done

# -----------------------------------------------
# 5. Volver a develop
# -----------------------------------------------
git checkout develop

echo ""
echo "✅ Estructura lista. Resumen de ramas:"
git branch -a | grep -v HEAD

echo ""
echo "📋 Próximos pasos:"
echo "  1. Trabajar siempre desde una rama feature/"
echo "  2. Mergear a develop cuando el feature esté completo"
echo "  3. Nunca hacer push directo a main"
echo "  4. Ver docs/GIT_STRATEGY.md para el flujo completo"
