# IT Technician Toolbox Pro v15.0

**A multilingual PowerShell toolkit for Windows system administration, IT support, network diagnostics, security auditing, and troubleshooting.**

[English](#english) | [Español](#español) | [Português](#português)

---

# English

## Overview

IT Technician Toolbox Pro is an interactive PowerShell toolkit designed to help IT technicians and system administrators manage, diagnose, maintain, and troubleshoot Windows systems.

The application includes a language selector at startup, allowing users to choose between English, Spanish, and Portuguese.

## Features

### Network Management
- DNS server configuration and management.
- Network adapter information.
- Latency and packet loss testing.
- Internet download speed testing.
- Network repair and cleanup.
- Active network connections and port scanning.

### Security and Auditing
- Saved Wi-Fi network profile management.
- Wi-Fi credential inspection.
- Windows OEM product key retrieval.
- File hash generation (SHA-256).
- Windows user account auditing.
- Startup program inspection.
- Anti-ransomware monitoring utilities.

### Hardware Diagnostics
- Physical disk health information.
- SMART status inspection.
- Battery information.
- RAM diagnostics.

### Windows Maintenance
- System integrity checks (SFC/DISM).
- System restore point management.
- Installed software inventory.
- Windows service management.
- Temporary file cleanup.
- User profile backup utilities.

### Additional Tools
- Windows administrative consoles (MSC).
- Advanced restart options.
- BIOS, Safe Mode, and Windows Recovery Environment shortcuts.
- DNS reconnaissance.
- Subdomain discovery.
- HTTP header inspection.
- Technical system report generation in TXT format.

## Multilingual Support

Select your preferred language when launching the application:

- English
- Español
- Português

## Custom Console Window Size

The console dimensions can be customized directly in the PowerShell script using Notepad.

```powershell
$script:ITToolboxWindowWidth  = 100
$script:ITToolboxWindowHeight = 30
```

- `WindowWidth`: Console width in columns.
- `WindowHeight`: Console height in rows.

Save the script after changing the values.

Note: Actual resizing depends on the PowerShell host. Windows Terminal may handle its outer window dimensions separately.

## Requirements

- Windows 10 or Windows 11.
- Windows PowerShell 5.1 or compatible PowerShell.
- Administrator privileges for certain operations.
- Internet connection for online network tests.

## Installation and Usage

1. Download or clone this repository.
2. Open PowerShell.
3. Navigate to the directory containing the script.
4. Run:

```powershell
.\ITToolbox_Multilingual_CustomWindowSize.ps1
```

5. Select your preferred language.
6. Choose the desired tool from the main menu.

## Security Notice

This toolkit includes administrative operations that may modify network settings, Windows services, restore points, and stored Wi-Fi profiles.

Some features can display sensitive information, including saved Wi-Fi credentials and Windows product keys.

Use this software only on computers and networks you own or are explicitly authorized to manage.

Review each operation before confirming it.

## Disclaimer

This project is provided for educational, diagnostic, and legitimate IT administration purposes.

The author is not responsible for misuse, data loss, system configuration changes, or damages resulting from improper use.

## Author

Fernando Vitale

## Version

15.0

---

# Español

## Descripción

IT Technician Toolbox Pro es un conjunto de herramientas interactivas desarrollado en PowerShell para ayudar a técnicos informáticos y administradores de sistemas a gestionar, diagnosticar, mantener y solucionar problemas en equipos Windows.

La aplicación incluye un selector de idioma al iniciar, que permite elegir entre inglés, español y portugués.

## Funcionalidades

### Administración de redes
- Configuración y administración de servidores DNS.
- Información de adaptadores de red.
- Pruebas de latencia y pérdida de paquetes.
- Medición de velocidad de descarga de Internet.
- Reparación y limpieza de red.
- Conexiones de red activas y escaneo de puertos.

### Seguridad y auditoría
- Administración de perfiles de redes Wi-Fi guardadas.
- Consulta de credenciales Wi-Fi.
- Recuperación de claves OEM de Windows.
- Generación de hashes de archivos (SHA-256).
- Auditoría de cuentas de usuario de Windows.
- Inspección de programas de inicio.
- Herramientas de monitoreo anti-ransomware.

### Diagnóstico de hardware
- Información sobre el estado de los discos físicos.
- Consulta del estado SMART.
- Información de batería.
- Diagnóstico de memoria RAM.

### Mantenimiento de Windows
- Comprobación de integridad del sistema (SFC/DISM).
- Administración de puntos de restauración.
- Inventario de software instalado.
- Administración de servicios de Windows.
- Limpieza de archivos temporales.
- Herramientas de respaldo de perfiles de usuario.

### Herramientas adicionales
- Consolas administrativas de Windows (MSC).
- Opciones avanzadas de reinicio.
- Accesos a BIOS, Modo Seguro y Entorno de Recuperación de Windows.
- Reconocimiento DNS.
- Búsqueda de subdominios.
- Inspección de encabezados HTTP.
- Generación de informes técnicos del sistema en formato TXT.

## Soporte multilingüe

Al ejecutar la aplicación, podés seleccionar el idioma que prefieras:

- English
- Español
- Português

## Personalización del tamaño de la ventana

El tamaño de la consola se puede modificar directamente desde el script utilizando el Bloc de notas.

```powershell
$script:ITToolboxWindowWidth  = 100
$script:ITToolboxWindowHeight = 30
```

- `WindowWidth`: ancho de la consola en columnas.
- `WindowHeight`: alto de la consola en filas.

Guardá el archivo después de modificar los valores.

Nota: La posibilidad de cambiar el tamaño depende de la consola de PowerShell utilizada. Windows Terminal puede administrar el tamaño exterior de la ventana por separado.

## Requisitos

- Windows 10 o Windows 11.
- Windows PowerShell 5.1 o una versión compatible de PowerShell.
- Permisos de administrador para determinadas operaciones.
- Conexión a Internet para las pruebas de red online.

## Instalación y uso

1. Descargá o cloná este repositorio.
2. Abrí PowerShell.
3. Navegá hasta la carpeta donde se encuentra el script.
4. Ejecutá:

```powershell
.\ITToolbox_Multilingual_CustomWindowSize.ps1
```

5. Seleccioná el idioma deseado.
6. Elegí la herramienta que quieras utilizar desde el menú principal.

## Aviso de seguridad

Esta herramienta incluye operaciones administrativas que pueden modificar la configuración de red, los servicios de Windows, los puntos de restauración y los perfiles Wi-Fi almacenados.

Algunas funciones permiten visualizar información sensible, como contraseñas Wi-Fi guardadas y claves de producto de Windows.

Utilizá el programa únicamente en equipos y redes propios o para los que tengas autorización explícita.

Revisá cada operación antes de confirmarla.

## Descargo de responsabilidad

Este proyecto se proporciona con fines educativos, de diagnóstico y administración legítima de sistemas informáticos.

El autor no se responsabiliza por el uso indebido, la pérdida de datos, los cambios de configuración del sistema ni los daños derivados de un uso incorrecto.

## Autor

Fernando Vitale

## Versión

15.0

---

# Português

## Visão geral

IT Technician Toolbox Pro é um conjunto interativo de ferramentas desenvolvido em PowerShell para auxiliar técnicos de informática e administradores de sistemas no gerenciamento, diagnóstico, manutenção e solução de problemas em sistemas Windows.

O aplicativo possui um seletor de idioma na inicialização, permitindo escolher entre inglês, espanhol e português.

## Funcionalidades

### Gerenciamento de rede
- Configuração e gerenciamento de servidores DNS.
- Informações sobre adaptadores de rede.
- Testes de latência e perda de pacotes.
- Teste de velocidade de download da Internet.
- Reparo e limpeza de rede.
- Conexões de rede ativas e verificação de portas.

### Segurança e auditoria
- Gerenciamento de perfis de redes Wi-Fi salvas.
- Consulta de credenciais Wi-Fi.
- Recuperação da chave OEM do Windows.
- Geração de hashes de arquivos (SHA-256).
- Auditoria de contas de usuários do Windows.
- Inspeção de programas de inicialização.
- Ferramentas de monitoramento anti-ransomware.

### Diagnóstico de hardware
- Informações sobre a integridade dos discos físicos.
- Verificação do status SMART.
- Informações sobre a bateria.
- Diagnóstico da memória RAM.

### Manutenção do Windows
- Verificação da integridade do sistema (SFC/DISM).
- Gerenciamento de pontos de restauração.
- Inventário de softwares instalados.
- Gerenciamento de serviços do Windows.
- Limpeza de arquivos temporários.
- Ferramentas de backup de perfis de usuários.

### Ferramentas adicionais
- Consoles administrativos do Windows (MSC).
- Opções avançadas de reinicialização.
- Atalhos para BIOS, Modo de Segurança e Ambiente de Recuperação do Windows.
- Reconhecimento DNS.
- Descoberta de subdomínios.
- Inspeção de cabeçalhos HTTP.
- Geração de relatórios técnicos do sistema em formato TXT.

## Suporte multilíngue

Ao iniciar o aplicativo, selecione o idioma desejado:

- English
- Español
- Português

## Personalização do tamanho da janela

As dimensões do console podem ser personalizadas diretamente no script utilizando o Bloco de Notas.

```powershell
$script:ITToolboxWindowWidth  = 100
$script:ITToolboxWindowHeight = 30
```

- `WindowWidth`: largura do console em colunas.
- `WindowHeight`: altura do console em linhas.

Salve o arquivo após alterar os valores.

Observação: A alteração do tamanho depende do terminal PowerShell utilizado. O Windows Terminal pode controlar as dimensões externas da janela separadamente.

## Requisitos

- Windows 10 ou Windows 11.
- Windows PowerShell 5.1 ou PowerShell compatível.
- Privilégios de administrador para determinadas operações.
- Conexão com a Internet para testes de rede online.

## Instalação e utilização

1. Baixe ou clone este repositório.
2. Abra o PowerShell.
3. Navegue até a pasta onde o script está localizado.
4. Execute:

```powershell
.\ITToolbox_Multilingual_CustomWindowSize.ps1
```

5. Selecione o idioma desejado.
6. Escolha a ferramenta que deseja utilizar no menu principal.

## Aviso de segurança

Esta ferramenta inclui operações administrativas que podem modificar as configurações de rede, os serviços do Windows, os pontos de restauração e os perfis Wi-Fi armazenados.

Algumas funcionalidades permitem visualizar informações sensíveis, incluindo senhas Wi-Fi salvas e chaves de produto do Windows.

Utilize este software somente em computadores e redes próprios ou para os quais você tenha autorização explícita.

Revise cada operação antes de confirmá-la.

## Isenção de responsabilidade

Este projeto é disponibilizado para fins educacionais, de diagnóstico e administração legítima de sistemas.

O autor não se responsabiliza pelo uso indevido, perda de dados, alterações na configuração do sistema ou danos decorrentes do uso incorreto.

## Autor

Fernando Vitale

## Versão

15.0
