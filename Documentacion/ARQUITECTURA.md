# 🏗️ Arquitectura y Patrón de Diseño — CodeBone App

<div align="center">

![Patrón](https://img.shields.io/badge/Patrón-MVVM-blueviolet?style=for-the-badge)
![Arquitectura](https://img.shields.io/badge/Arquitectura-Clean%20Architecture-blue?style=for-the-badge)
![Framework](https://img.shields.io/badge/Framework-.NET%20MAUI-purple?style=for-the-badge&logo=dotnet)
![SSDT](https://img.shields.io/badge/BD-SQL%20Server-red?style=for-the-badge&logo=microsoftsqlserver)

</div>

---

## 🎯 Decisión de Arquitectura

Para el proyecto **CodeBone** se adopta la combinación de:

> **MVVM + Clean Architecture Simplificada en 3 capas**

| ¿Por qué MVVM? | ¿Por qué Clean Architecture? |
|----------------|-------------------------------|
| Es el patrón **nativo de .NET MAUI/XAML** | Permite agregar módulos sin romper los existentes |
| Separa completamente UI de lógica | Hace que cada capa sea testeable por separado |
| Habilita el **data binding bidireccional** | Permite cambiar la BD en el futuro sin tocar la UI |

---

## 🗂️ Capas del Sistema

```
┌─────────────────────────────────────────────────┐
│               PRESENTACIÓN (UI)                 │
│    Views (XAML pages)  ←binding→  ViewModels    │
│    Solo UI, sin lógica de negocio               │
├─────────────────────────────────────────────────┤
│             LÓGICA DE NEGOCIO                   │
│                  Services                       │
│    Valida reglas, orquesta operaciones          │
├─────────────────────────────────────────────────┤
│              ACCESO A DATOS                     │
│                Repositories                     │
│    Llama a los Stored Procedures de SQL Server  │
├─────────────────────────────────────────────────┤
│              BASE DE DATOS                      │
│         SQL Server + Stored Procedures          │
│              (Ya implementado ✅)               │
└─────────────────────────────────────────────────┘
```

---

## 📁 Estructura de Carpetas

```
CodeBone_App/
│
├── 📂 Models/                        ← Entidades del dominio
│   ├── Pet.cs
│   ├── User.cs
│   ├── Race.cs
│   ├── Role.cs
│   ├── Treatment.cs
│   ├── Medicine.cs
│   ├── Province.cs
│   └── Product.cs
│
├── 📂 Repositories/                  ← Acceso a datos (llaman SPs)
│   ├── Interfaces/
│   │   ├── IPetRepository.cs
│   │   ├── IUserRepository.cs
│   │   └── IRaceRepository.cs
│   └── Implementations/
│       ├── PetRepository.cs          → SPCatalogoPets
│       ├── UserRepository.cs         → SPCatalogoUsers
│       └── RaceRepository.cs         → SPCatalogoRazas
│
├── 📂 Services/                      ← Lógica de negocio y validaciones
│   ├── Interfaces/
│   │   ├── IPetService.cs
│   │   ├── IUserService.cs
│   │   └── IAuthService.cs
│   └── Implementations/
│       ├── PetService.cs
│       ├── UserService.cs
│       └── AuthService.cs
│
├── 📂 ViewModels/                    ← Lógica de presentación (MVVM)
│   ├── Base/
│   │   └── BaseViewModel.cs          → ObservableObject base
│   ├── Auth/
│   │   └── LoginViewModel.cs
│   ├── Dashboard/
│   │   └── DashboardViewModel.cs
│   ├── Pets/
│   │   ├── PetListViewModel.cs
│   │   └── PetFormViewModel.cs
│   └── Users/
│       ├── UserListViewModel.cs
│       └── UserFormViewModel.cs
│
├── 📂 Views/                         ← Páginas XAML (solo UI)
│   ├── Auth/
│   │   └── LoginPage.xaml
│   ├── Dashboard/
│   │   └── DashboardPage.xaml
│   ├── Pets/
│   │   ├── PetListPage.xaml
│   │   └── PetFormPage.xaml
│   └── Users/
│       ├── UserListPage.xaml
│       └── UserFormPage.xaml
│
├── 📂 Helpers/                       ← Utilidades transversales
│   ├── DatabaseHelper.cs             → Gestión de conexión SQL Server
│   ├── AppSettings.cs                → Connection string y configuración
│   └── Converters/
│       └── BoolToStatusConverter.cs
│
├── 📂 Resources/
│   ├── Styles/
│   │   ├── Colors.xaml               → Paleta CodeBone
│   │   └── Styles.xaml               → Estilos globales
│   ├── Fonts/
│   └── Images/
│
└── MauiProgram.cs                    ← Inyección de Dependencias (DI Container)
```

---

## 🔄 Flujo de Datos

Ejemplo: **Listar mascotas**

```
[ Usuario toca "Ver Mascotas" ]
           ↓
   PetListPage.xaml          ← View: solo UI, sin lógica
           ↓  binding
   PetListViewModel.cs       ← ViewModel: comanda y expone datos
           ↓  llama
   IPetService               ← Service: valida y orquesta
           ↓  llama
   IPetRepository            ← Repository: accede a la BD
           ↓  ejecuta SP
   SPViewPets (SQL Server)   ← Stored Procedure
           ↓  retorna filas
   List<Pet>                 ← Model
           ↑  sube por capas
   ObservableCollection<Pet> ← ViewModel actualiza la colección
           ↓  binding automático
   CollectionView en XAML    ← La UI se refresca sola
```

---

## 📦 Librerías NuGet

| Librería | Propósito | Prioridad |
|---------|-----------|-----------|
| `CommunityToolkit.Mvvm` | MVVM moderno sin boilerplate (`ObservableObject`, `RelayCommand`) | 🔴 Esencial |
| `Microsoft.Data.SqlClient` | Conexión a SQL Server desde .NET MAUI | 🔴 Esencial |
| `CommunityToolkit.Maui` | Controles UI extra (Snackbar, Popup, Toast) | 🟡 Importante |
| `Microsoft.Extensions.Configuration` | Manejo de `appsettings.json` | 🟡 Importante |

---

## 🧩 Inyección de Dependencias

Todo el sistema se registra en `MauiProgram.cs`:

```csharp
// MauiProgram.cs
public static MauiApp CreateMauiApp()
{
    var builder = MauiApp.CreateBuilder();
    builder.UseMauiApp<App>();

    // ─── Repositories ──────────────────────────────
    builder.Services.AddSingleton<IPetRepository,  PetRepository>();
    builder.Services.AddSingleton<IUserRepository, UserRepository>();
    builder.Services.AddSingleton<IRaceRepository, RaceRepository>();

    // ─── Services ──────────────────────────────────
    builder.Services.AddSingleton<IAuthService,    AuthService>();
    builder.Services.AddSingleton<IPetService,     PetService>();
    builder.Services.AddSingleton<IUserService,    UserService>();

    // ─── ViewModels ────────────────────────────────
    builder.Services.AddTransient<LoginViewModel>();
    builder.Services.AddTransient<DashboardViewModel>();
    builder.Services.AddTransient<PetListViewModel>();
    builder.Services.AddTransient<PetFormViewModel>();

    // ─── Pages ─────────────────────────────────────
    builder.Services.AddTransient<LoginPage>();
    builder.Services.AddTransient<DashboardPage>();
    builder.Services.AddTransient<PetListPage>();
    builder.Services.AddTransient<PetFormPage>();

    return builder.Build();
}
```

---

## 🗺️ Roadmap de Implementación (Step by Step)

### ⚙️ Paso 0 — Preparación del Proyecto
> Configurar las bases antes de escribir código funcional

- [ ] Instalar NuGet: `CommunityToolkit.Mvvm`
- [ ] Instalar NuGet: `Microsoft.Data.SqlClient`
- [ ] Instalar NuGet: `CommunityToolkit.Maui`
- [ ] Crear todas las carpetas de la estructura definida
- [ ] Definir `Colors.xaml` con la paleta CodeBone

---

### 🔌 Paso 1 — Infraestructura Base
> La app puede conectarse a la base de datos

- [ ] `DatabaseHelper.cs` → clase que abre/cierra conexión SQL Server
- [ ] `AppSettings.cs` → guarda el connection string de forma segura
- [ ] `BaseViewModel.cs` → clase base con `IsBusy`, `Title` y NavigationService
- [ ] `MauiProgram.cs` → registrar todos los servicios en el DI Container
- [ ] `Colors.xaml` → `#191D88`, `#1450A3`, `#337CCF`, `#FFC436`

---

### 🔐 Paso 2 — Autenticación
> El usuario puede iniciar sesión en el sistema

- [ ] `User.cs` — modelo de usuario
- [ ] `IUserRepository` + `UserRepository` → SP: `SPViewUsers`
- [ ] `IAuthService` + `AuthService` → valida credenciales
- [ ] `LoginViewModel` → propiedades `Email`, `Password`, `LoginCommand`
- [ ] `LoginPage.xaml` → diseño con paleta CodeBone
- [ ] `AppShell.xaml` → configurar navegación Login → Dashboard

---

### 📊 Paso 3 — Dashboard Principal
> Pantalla de inicio con estadísticas de la clínica

- [ ] SP nuevo para estadísticas (total mascotas, consultas, pacientes recientes)
- [ ] `DashboardViewModel` → `TotalPets`, `TotalUsers`, `RecentVisits`
- [ ] `DashboardPage.xaml` → cards de estadísticas, gráficas simples
- [ ] `AppShell.xaml` → agregar navegación lateral / flyout menu

---

### 🐾 Paso 4 — Módulo de Mascotas
> CRUD completo de mascotas (primer módulo operativo)

- [ ] `Pet.cs` + `Race.cs` — modelos
- [ ] `IPetRepository` + `PetRepository` → SPs: `SPCatalogoPets`, `SPViewPets`
- [ ] `IPetService` + `PetService` — lógica de negocio
- [ ] `PetListViewModel` + `PetFormViewModel`
- [ ] `PetListPage.xaml` + `PetFormPage.xaml`

---

### 👥 Paso 5 — Módulo de Usuarios / Clientes
> CRUD completo de usuarios del sistema

- [ ] `Role.cs` + `Province.cs` — catálogos
- [ ] `IRoleRepository` + `IProvinceRepository`
- [ ] `IUserService` + `UserService`
- [ ] `UserListViewModel` + `UserFormViewModel`
- [ ] `UserListPage.xaml` + `UserFormPage.xaml`

---

### 🏥 Paso 6 — Módulos Operativos
> Funcionalidad veterinaria avanzada

- [ ] Módulo de Tratamientos (`Treatments` + `Medicine`)
- [ ] Módulo de Consultas / Visitas (tabla `Visits` nueva)
- [ ] Módulo de Productos e Inventario
- [ ] Reportes y análisis por especie
- [ ] Modo offline: SQLite ↔ SQL Server

---

## 📐 Principios de Desarrollo

| Principio | Descripción |
|-----------|-------------|
| **Un ViewModel por Page** | `PetListPage` → `PetListViewModel`, nunca mezclar |
| **Views son "tontas"** | Solo binding en XAML, cero lógica de negocio |
| **Repositories solo leen/escriben BD** | No validan nada, solo ejecutan SPs |
| **Services son el cerebro** | Aquí van las validaciones y reglas de negocio |
| **DI para todo** | Nunca usar `new PetRepository()` directo, siempre inyección |
| **Interfaces para todo** | Permite cambiar implementaciones sin tocar el resto |

---

## 🏷️ Convención de Nombres

| Tipo | Convención | Ejemplo |
|------|-----------|---------|
| Modelo | `NombreEntidad.cs` | `Pet.cs` |
| Interfaz Repository | `I{Entidad}Repository` | `IPetRepository` |
| Implementación Repository | `{Entidad}Repository` | `PetRepository` |
| Interfaz Service | `I{Entidad}Service` | `IPetService` |
| Implementación Service | `{Entidad}Service` | `PetService` |
| ViewModel listado | `{Entidad}ListViewModel` | `PetListViewModel` |
| ViewModel formulario | `{Entidad}FormViewModel` | `PetFormViewModel` |
| Page listado | `{Entidad}ListPage.xaml` | `PetListPage.xaml` |
| Page formulario | `{Entidad}FormPage.xaml` | `PetFormPage.xaml` |

---

## 👤 Autor

**Andrey Sanchez Zuniga**
- 📧 [andreyszcr@gmail.com](mailto:andreyszcr@gmail.com)
- 💼 [LinkedIn](https://www.linkedin.com/in/andreysz/)
- 🌐 [Sitio Web](https://andreyszcr.netlify.app/)

---

## 📄 Licencia

MIT Public License v1.0
