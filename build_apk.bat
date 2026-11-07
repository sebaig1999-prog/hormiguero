@echo off
setlocal
cd /d "%~dp0"
echo.
echo  === Hormiguero: compilando el APK ===
echo.
where flutter >nul 2>nul
if errorlevel 1 (
  echo No encuentro Flutter en el PATH. Abre esta carpeta desde la terminal donde usas Flutter.
  pause
  exit /b 1
)
echo [1/5] Creando la parte Android del proyecto...
call flutter create --org cl.hormiguero --project-name hormiguero --platforms android . || goto :err
echo [2/5] Descargando paquetes...
call flutter pub get || goto :err
echo [3/5] Poniendo nombre, icono y firma...
call dart run tool/setup.dart || goto :err
echo [4/5] Compilando (la primera vez tarda unos minutos)...
call flutter build apk --release || goto :err
copy /Y "build\app\outputs\flutter-apk\app-release.apk" "Hormiguero.apk" >nul
echo.
echo [5/5] Listo: %CD%\Hormiguero.apk
echo.
pause
exit /b 0
:err
echo.
echo Algo fallo. Copia el error de arriba y me lo mandas.
pause
exit /b 1
