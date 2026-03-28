# 🐾 Análisis del Proyecto — CodeBone (Veterinaria)

<div align="center">

![Estado](https://img.shields.io/badge/Estado-En%20Desarrollo-yellow?style=for-the-badge)
![Versión](https://img.shields.io/badge/Versión-2.0-blue?style=for-the-badge)
![Plataforma](https://img.shields.io/badge/Plataforma-.NET%20MAUI-purple?style=for-the-badge&logo=dotnet)
![BD](https://img.shields.io/badge/Base%20de%20Datos-SQL%20Server-red?style=for-the-badge&logo=microsoftsqlserver)

</div>

---

## 📋 Resumen Ejecutivo

**CodeBone** es un sistema de gestión de clínica veterinaria que está transitando de una aplicación Windows Forms en VB.NET (v1.0) hacia una aplicación **cross-platform con .NET MAUI** (v2.0).

El proyecto está bien documentado conceptualmente y tiene una base de datos sólida, pero la implementación de la interfaz en la versión 2.0 se encuentra en etapa inicial.

---

## 📁 Estructura del Repositorio

```
01Veterinaria/
├── BDVeterinaria/                  → Proyecto SQL (SQL Server Data Tools)
│   └── dbo/
│       ├── Tables/                 → 9 tablas definidas
│       └── Stored Procedures/      → 8 Stored Procedures
├── CodeBone_App/                   → App .NET MAUI (v2.0) ← FOCO PRINCIPAL
├── Documentacion/                  → Specs, guías y análisis
├── Veterinaria version 1.0 2025/   → App VB.NET Windows Forms (legada)
├── Prototipo de CodeBone.png       → Imagen del prototipo
└── README.md                       → Descripción general
```

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología | Estado |
|------|-----------|--------|
| **Frontend** | .NET MAUI (C# + XAML) | 🟡 Iniciado — solo plantilla base |
| **Base de Datos** | SQL Server (SSDT `.sqlproj`) | 🟢 Definido — 9 tablas + 8 SPs |
| **Legacy (v1.0)** | VB.NET Windows Forms | 🟢 Funcional (almacenamiento en XML) |
| **Target Platforms** | Windows, Android, iOS, macOS | 🟡 Configurado, no implementado |

---

## 🗄️ Base de Datos — Estado Actual

### Tablas Implementadas

| # | Tabla | Descripción | Dependencias |
|---|-------|-------------|--------------|
| 1 | `Provinces` | Provincias / ubicaciones | Ninguna |
| 2 | `Roles` | Roles del sistema | Ninguna |
| 3 | `Race` | Razas de animales | Ninguna |
| 4 | `Medicine` | Catálogo de medicinas | Ninguna |
| 5 | `Categories` | Categorías de productos | Ninguna |
| 6 | `Users` | Usuarios del sistema | Provinces, Roles |
| 7 | `Pets` | Mascotas / pacientes | Race, Users |
| 8 | `Treatments` | Tratamientos aplicados | Pets, Medicine |
| 9 | `Products` | Productos / inventario | Categories |

### Stored Procedures Implementados

| Stored Procedure | Operaciones |
|-----------------|-------------|
| `SPCatalogoPets` | Insert · Update · Delete (lógico) |
| `SPCatalogoRazas` | Insert · Update · Delete (lógico) |
| `SPCatalogoRoles` | Insert · Update · Delete (lógico) |
| `SPCatalogoUsers` | Insert · Update · Delete (lógico) |
| `SPViewRaces` | Listado de razas |
| `SPViewRoles` | Listado de roles |
| `GenerarClaseCSharp` | Generador de clases C# desde BD |
| `GenerarClaseVBNet` | Generador de clases VB.NET desde BD |

### ⚠️ Tablas Pendientes

| Tabla | Prioridad | Justificación |
|-------|-----------|---------------|
| `Species` (Especies) | 🔴 Alta | Requerida para el dashboard del prototipo |
| `Visits` (Consultas) | 🔴 Alta | Módulo core del sistema |
| `Configuraciones` | 🟡 Media | Parámetros del sistema |
| `Inventories` | 🟢 Baja | Módulo futuro |
| `Purchases` | 🟢 Baja | Módulo futuro |

---

## 📱 Aplicación MAUI — Estado Actual

> ⚠️ **En estado de plantilla genérica.** Aún no tiene ninguna pantalla veterinaria implementada.

### Archivos presentes

| Archivo | Descripción |
|---------|-------------|
| `App.xaml` / `App.xaml.cs` | Configuración base de la app |
| `AppShell.xaml` | Shell con una sola ruta (`MainPage`) |
| `MainPage.xaml` | Plantilla "Hello World" por defecto |
| `MauiProgram.cs` | Registro de servicios (sin DI configurada aún) |

### Plataformas configuradas en el `.csproj`

| Plataforma | Target Framework |
|-----------|-----------------|
| ✅ Windows | `net10.0-windows10.0.19041.0` |
| ✅ Android | `net10.0-android` |
| ✅ iOS | `net10.0-ios` |
| ✅ macOS | `net10.0-maccatalyst` |

---

## 🏛️ Versión 1.0 — VB.NET Windows Forms (Legada)

La v1.0 está en `Veterinaria version 1.0 2025/` con arquitectura en 3 capas:

```
├── CapaDatos/      → Acceso a XML
├── CapaEntidades/  → Modelos
├── Negocios/       → Lógica de negocio
└── Veterinaria/    → UI Windows Forms (VB.NET)
    ├── FrmInicio               → Pantalla principal con menú
    ├── frmClientesNuevos       → Registro de clientes
    ├── frmClientesRegistrados  → Listado de clientes
    └── frmAcercaDE             → Información del sistema
```

> Los datos se almacenaban en **archivos XML** locales, sin base de datos.

---

## 🎨 Diseño y Prototipo

### Paleta de Colores (CodeBone)

| Color | Hex | Uso |
|-------|-----|-----|
| 🟦 Azul Oscuro | `#191D88` | Fondo principal, sidebar |
| 🔵 Azul Medio | `#1450A3` | Elementos primarios |
| 🩵 Azul Claro | `#337CCF` | Acentos, hover |
| 🟡 Dorado | `#FFC436` | Llamadas a acción, íconos destacados |

### Módulos del Prototipo (Figma)

- 📊 Dashboard: Consultas por Especie, Análisis por Especie, Pacientes Recientes
- 🐾 Módulo de Mascotas
- 🧬 Módulo de Razas
- 👤 Módulo de Roles / Usuarios

---

## 🔍 Hallazgos

### ✅ Fortalezas

- Base de datos con **auditoría completa** en cada tabla (`Create`, `Update`, `Delete`, `Status`)
- **Códigos automáticos** generados por los SPs (`P0001`, `U0001`)
- **Documentación clara** con guía paso a paso de dependencias
- Arquitectura **cross-platform** lista desde el `.csproj`
- Paleta de colores y wireframes definidos en **Figma**

### ⚠️ Áreas de Mejora

| Hallazgo | Impacto |
|----------|---------|
| App MAUI sin implementar | 🔴 Alto — no hay ninguna pantalla veterinaria |
| Sin capa de conexión BD-App | 🔴 Alto — repositorios y servicios pendientes |
| Tablas `Species` y `Visits` faltantes | 🔴 Alto — bloquean el dashboard |
| `Users.UserPhone` es `INT` | 🟡 Medio — debería ser `VARCHAR` para formatos internacionales |
| SPs mezclan Insert/Update/Delete en uno | 🟡 Medio — dificulta la legibilidad |
| `Treatments.TreatmentAge` — nombre confuso | 🟢 Bajo — ¿edad del tratamiento o de la mascota? |

---

## 🗺️ Próximos Pasos

```
Fase 1 — Fundación
  ├─ Crear estructura MVVM en el proyecto MAUI
  ├─ Configurar conexión a SQL Server
  └─ Implementar pantalla de Login

Fase 2 — Módulos Core
  ├─ Dashboard con estadísticas
  ├─ CRUD de Mascotas
  └─ CRUD de Usuarios

Fase 3 — Módulos Operativos
  ├─ Consultas / Visitas
  ├─ Tratamientos
  └─ Productos / Inventario

Fase 4 — Avanzado
  ├─ Reportes y análisis
  ├─ Modo offline (SQLite ↔ SQL Server)
  └─ Auditoría y logs
```

---

## 👤 Autor

**Andrey Sanchez Zuniga**
- 📧 [andreyszcr@gmail.com](mailto:andreyszcr@gmail.com)
- 💼 [LinkedIn](https://www.linkedin.com/in/andreysz/)
- 🌐 [Sitio Web](https://andreyszcr.netlify.app/)

---

## 📄 Licencia

MIT Public License v1.0
