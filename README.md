# BankAPP

**BankAPP** es una aplicación móvil desarrollada en Flutter que permite a los usuarios:

* Registrarse mediante un formulario personalizado.
* Iniciar sesión con Firebase Authentication.
* Visualizar y gestionar su saldo y movimientos en tiempo real con Cloud Firestore.
* Retirar y depositar dinero simulando transacciones bancarias (Nequi, Bancolombia, Daviplata).
* Un administrador puede aprobar o eliminar solicitudes de registro y consultar el historial de usuarios.

---

## 🛠 Tecnologías y dependencias

* **Flutter & Dart**: Framework y lenguaje principal.
* **Firebase Auth**: Autenticación de usuarios.
* **Cloud Firestore**: Base de datos en tiempo real.
* **intl**: Formateo de fechas y números.
* **shadcn/ui, lucide-react, recharts**: (opcional para futuras mejoras UI/UX).

---

## 🚀 Configuración del proyecto

1. Clona este repositorio:

   ```bash
   git clone https://github.com/tu-usuario/BankApp.git
   cd BankApp
   ```
2. Instala las dependencias:

   ```bash
   flutter pub get
   ```
3. Configura Firebase:

   * Crea un proyecto en Firebase Console.
   * Añade la plataforma Android e iOS.
   * Descarga `google-services.json` (Android) y `GoogleService-Info.plist` (iOS) y colócalos en `android/app` y `ios/Runner` respectivamente.
   * Actualiza `firebase_options.dart` si usas FlutterFire CLI.
4. Ejecuta la app en tu emulador o dispositivo:

   ```bash
   flutter run
   ```

---

## 📂 Estructura de carpetas

```
lib/
├── src/
│   ├── core/
│   │   ├── controllers/       # Lógica de negocio (LoginController)
│   │   ├── services/          # Integración con Firebase (Auth, Firestore)
│   │   └── models/            # Modelos de datos (User, Movement, Registration)
│   ├── layouts/               # Widgets reutilizables (Cards, Modals, Colores)
│   └── screen/                # Pantallas (Login, Home, Withdraw, Deposit, Admin)
├── main.dart                  # Punto de entrada de la app
└── firebase_options.dart      # Configuración generada por FlutterFire CLI (opcional)
```

---

## ✨ Características principales

* **Autenticación**: Registro, login y logout con Firebase Auth.
* **Saldo y Movimientos**: Visualizar saldo formateado, historial de depósitos y retiros.
* **Transacciones**: Retiros y depósitos simulados con selección de banco.
* **Roles**: Usuario normal y administrador con vista de solicitudes de registro.
* **UI responsiva**: Uso de `SafeArea`, modales `showModalBottomSheet`, y diseño adaptativo.

---

## 📌 Uso

1. **Registro**: Completar formulario y enviar. Aparecerá un modal de confirmación.
2. **Login**: Ingresa tu email y contraseña. Usuario administrador: `admin123@gmail.com / 12345`.
3. **Home**: Visualiza tu saldo, retira, deposita o revisa historial.
4. **Administrador**: Accede a pantalla de solicitudes, aprueba o elimínalas.

---

## 🤝 Contribuciones

Si quieres colaborar, haz un *fork*, crea una rama de feature (`git checkout -b feature/nombre`), realiza tus cambios (`git commit -m 'feat: descripción'`), *push* a tu rama y abre un *pull request*.

---

## 📄 Licencia

MIT License © 2025 tu-usuario
