# Desktop App Scaffolding Guide

## Overview
This guide tells the DevOps agent how to scaffold a desktop application based on
the tech stack selected by the Architect agent.

## Common Desktop App Structures

### Electron / Tauri (Web Tech → Desktop)
```
src/
├── main/                      # Main process (Node.js / Rust)
│   ├── index.[ext]            # Entry point
│   ├── ipc/                   # IPC handlers (main ↔ renderer communication)
│   ├── services/              # Native services (file system, OS integration)
│   ├── menu/                  # Application menu definitions
│   └── windows/               # Window management
├── renderer/                  # Renderer process (web UI)
│   ├── src/
│   │   ├── components/        # UI components
│   │   ├── pages/             # Application views
│   │   ├── hooks/             # Custom hooks
│   │   ├── services/          # IPC client / data services
│   │   ├── store/             # State management
│   │   └── App.[ext]          # Root component
│   └── index.html             # HTML entry point
├── shared/                    # Shared types/constants between processes
└── resources/                 # App icons, native assets
```

### Native Framework (Qt, WPF, SwiftUI, GTK)
```
src/
├── main.[ext]                 # Application entry point
├── ui/                        # UI definitions
│   ├── windows/               # Window/form definitions
│   ├── dialogs/               # Dialog definitions
│   ├── widgets/               # Custom widgets/controls
│   └── resources/             # UI resources (icons, images, styles)
├── models/                    # Data models
├── services/                  # Business logic and services
│   ├── file_service.[ext]     # File system operations
│   ├── data_service.[ext]     # Data persistence
│   └── [domain]_service.[ext] # Domain-specific services
├── utils/                     # Utility functions
└── config/                    # Application configuration
```

### Cross-Platform (.NET MAUI, Flutter, React Native Desktop)
```
src/
├── lib/ or src/               # Application source
│   ├── screens/               # Screen/page definitions
│   ├── widgets/ or components/# Reusable UI elements
│   ├── models/                # Data models
│   ├── services/              # Business logic
│   ├── providers/             # State management
│   └── utils/                 # Utilities
├── platform/                  # Platform-specific code
│   ├── windows/
│   ├── macos/
│   └── linux/
├── assets/                    # Images, fonts, resources
└── test/                      # Tests
```

## Configuration Files to Generate

### Electron
- `package.json` — dependencies and scripts
- `electron-builder.yml` — build/packaging config
- `forge.config.js` — Electron Forge config (alternative)
- Dev server config for renderer

### Tauri
- `Cargo.toml` — Rust dependencies
- `tauri.conf.json` — Tauri configuration
- `package.json` — Frontend dependencies

### Qt (C++)
- `CMakeLists.txt` or `.pro` — build config
- `.clang-format` — code formatter

### .NET (WPF/MAUI)
- `*.csproj` — project file
- `*.sln` — solution file
- `Directory.Build.props` — shared build properties

## Desktop-Specific Considerations
- **File system access**: Plan for file dialogs, read/write permissions
- **Native menus**: Application menu bar, context menus, system tray
- **Window management**: Multiple windows, dialog boxes, modal/modeless
- **Auto-updates**: Plan the update mechanism early
- **Packaging**: Installer generation (MSI, DMG, AppImage, etc.)
- **Code signing**: Required for distribution on macOS and Windows
- **Offline-first**: Desktop apps often need to work without internet

## Testing Structure
```
tests/
├── unit/                      # Unit tests for business logic
├── integration/               # Component integration tests
├── ui/                        # UI automation tests
└── fixtures/                  # Test data
```
