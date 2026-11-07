#!/usr/bin/env bash
# Hormiguero: compila el APK en Linux. Uso: bash build_apk.sh
set -e
cd "$(dirname "$0")"
command -v flutter >/dev/null || { echo "No encuentro Flutter en el PATH."; exit 1; }
echo "[1/5] Creando la parte Android del proyecto..."
flutter create --org cl.hormiguero --project-name hormiguero --platforms android .
echo "[2/5] Descargando paquetes..."
flutter pub get
echo "[3/5] Poniendo nombre, icono y firma..."
dart run tool/setup.dart
echo "[4/5] Compilando (la primera vez tarda unos minutos)..."
flutter build apk --release
cp build/app/outputs/flutter-apk/app-release.apk Hormiguero.apk
echo "[5/5] Listo: $(pwd)/Hormiguero.apk"
