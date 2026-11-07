# Hormiguero

App para anotar **gastos hormiga** en dos toques: marcas el monto, tocas la categoría y queda guardado.
Lleva la cuenta contra un **tope mensual**, muestra boletas por día, gráfico, categorías y cuánto sumarías en un año.

## Descargar el APK

1. Entra a **[Releases](../../releases/latest)** (columna derecha del repo).
2. Descarga **`Hormiguero.apk`** desde el teléfono.
3. Ábrelo y acepta *instalar apps de esta fuente* cuando Android lo pida.

**Para actualizar** instala el APK nuevo encima del anterior: tus gastos se mantienen.
No desinstales la app, porque al desinstalar Android borra los gastos guardados.

## Cómo se compila

Cada vez que se sube un cambio a `main`, **GitHub Actions** compila el APK solo
(pestaña **Actions → Compilar APK**) y publica una versión nueva en **Releases** (`v1.0.N`).
También se puede lanzar a mano con **Run workflow**.

Para compilarlo en el PC (necesita Flutter): `build_apk.bat` en Windows o `bash build_apk.sh` en Linux.

## Qué hay en el repo

| Ruta | Qué es |
|---|---|
| `assets/hormiguero.html` | La app completa. Funciona sin internet; también se abre en el PC con doble clic |
| `lib/main.dart` | La envuelve en una app Android (Flutter + WebView) |
| `tool/setup.dart` | Pone nombre, ícono y firma a la parte Android que genera `flutter create` |
| `icons/` | Ícono verde con la hormiga |
| `signing/hormiguero.keystore` | Llave con que se firman **todos** los APK (ver abajo) |
| `.github/workflows/apk.yml` | La receta que compila y publica el APK |

## La firma (no borrar `signing/`)

Android solo deja instalar una versión nueva encima de la anterior si las dos vienen firmadas con la misma llave.
Por eso todos los APK se firman con `signing/hormiguero.keystore`, y la compilación revisa la huella antes de publicar.
Si esa llave se pierde o cambia, habría que desinstalar la app (y perder los gastos) para instalar la nueva.

El repo es privado. Si algún día lo haces público, mueve la llave a un *secret* de GitHub primero.

## Respaldo de los gastos

Los gastos viven en el teléfono. En **Resumen → Ajustes → Copiar como CSV** puedes sacar una copia
y pegarla en una planilla, un correo o WhatsApp.
