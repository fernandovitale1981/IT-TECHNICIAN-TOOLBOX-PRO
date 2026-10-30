# IT Technician Toolbox Pro v15.0

**A PowerShell toolkit for Windows IT support, system administration, network diagnostics, hardware checks, maintenance, and troubleshooting.**

[English](#english) · [Español](#español) · [Português](#português)

> **Project:** IT Technician Toolbox Pro  
> **Version:** 15.0  
> **Platform:** Windows 10 / Windows 11  
> **Language options:** English · Español · Português  
> **Main script:** `ITToolbox_Multilingual_CustomWindowSize.ps1`

---

## English

### Overview

IT Technician Toolbox Pro is an interactive PowerShell toolkit that brings a collection of common Windows support and administration tasks together in one console-based application. It is intended for IT technicians, help-desk teams, system administrators, and Windows power users.

At startup, the script displays a language selector with English, Spanish, and Portuguese options. The console width and height can also be adjusted by editing two settings near the beginning of the `.ps1` file.

### Main tool categories

- **Network diagnostics and repair:** DNS configuration and lookup, ping and packet-loss tests, internet download-speed testing, network reset and repair, active connection inspection, and port-related diagnostics.
- **Hardware diagnostics:** disk health and SMART information, battery details, and RAM-related checks.
- **Windows repair and recovery:** system integrity checks using SFC/DISM and System Restore point management.
- **Security and credential utilities:** local Windows account auditing and management, saved Wi-Fi profile inspection and management, Windows OEM/BIOS product-key lookup, and file hashing.
- **Maintenance and optimization:** installed-software inventory, startup-program inspection, service management, temporary-file cleanup, and user-folder backup utilities.
- **Administrative shortcuts:** access to built-in Windows management consoles and advanced restart/recovery options.
- **OSINT and infrastructure reconnaissance:** DNS record queries, common subdomain checks, HTTP header inspection, and browser-profile inspection.
- **System reporting:** generation of a technical system report in plain-text format.

The exact tools available may depend on the Windows version, PowerShell host, permissions, and system configuration.

### Requirements

- Windows 10 or Windows 11.
- Windows PowerShell 5.1 or a compatible PowerShell environment.
- Administrator privileges for certain system-level operations.
- Internet access for online network tests and lookup features.

### Download and run

1. Download or clone this repository.
2. Open PowerShell and navigate to the folder containing the script.
3. Run:

```powershell
.\ITToolbox_Multilingual_CustomWindowSize.ps1
```

4. Choose a language from the startup menu.
5. Select a tool from the main menu.

Some operations require an elevated PowerShell session. If a feature needs administrator permissions, close the current terminal and reopen PowerShell using **Run as administrator**.

### Customize the console dimensions

Open the `.ps1` file in Notepad and edit the following values near the top:

```powershell
$script:ITToolboxWindowWidth  = 100
$script:ITToolboxWindowHeight = 30
```

- `WindowWidth` controls the console width in columns.
- `WindowHeight` controls the console height in rows.

Save the file and run it again. Resizing support depends on the PowerShell host. Windows Terminal and some integrated terminals may manage the outer window size separately or ignore console resize requests.

### Safety and privacy

This toolkit includes administrative functions that can change system or network settings and manage Windows resources. Some utilities may display sensitive information, such as saved wireless-network credentials or a Windows product key.

- Use the toolkit only on devices and networks you own or are authorized to administer.
- Review an operation and its effects before confirming it.
- Do not publish generated reports or screenshots if they contain passwords, product keys, usernames, IP addresses, or other private information.
- Back up important data before performing maintenance or configuration changes.

### Troubleshooting

- **Script execution is blocked:** review your organization's PowerShell execution policy and Windows security settings. Do not weaken security controls on a managed device without authorization.
- **A feature is unavailable:** check the Windows version, required permissions, and whether the relevant hardware or service exists.
- **The console does not resize:** use a compatible console host or adjust the terminal window manually.
- **Network tests fail:** verify connectivity and remember that remote hosts or firewalls may block ICMP or other diagnostic traffic.

### Contributing

Bug reports, suggestions, and improvements are welcome. When reporting an issue, include the Windows version, PowerShell version, the selected interface language, and the relevant error message. Remove passwords, product keys, and other sensitive data before sharing logs.

### Disclaimer

This project is provided for educational, diagnostic, and authorized IT-administration purposes. The author is not responsible for damage, data loss, service interruptions, or unauthorized use resulting from the operation of this software. Use it at your own risk and verify potentially disruptive actions before proceeding.

### Author

**Fernando Vitale**

---

## Español

### Descripción

IT Technician Toolbox Pro es un conjunto interactivo de herramientas desarrollado en PowerShell que reúne tareas habituales de soporte técnico y administración de Windows en una sola aplicación de consola. Está orientado a técnicos informáticos, equipos de soporte, administradores de sistemas y usuarios avanzados de Windows.

Al iniciar, el script muestra un selector de idioma con opciones en inglés, español y portugués. También permite ajustar el ancho y el alto de la consola editando dos valores al comienzo del archivo `.ps1`.

### Categorías principales

- **Diagnóstico y reparación de redes:** configuración y consulta de DNS, pruebas de ping y pérdida de paquetes, medición de velocidad de descarga, restablecimiento y reparación de red, inspección de conexiones activas y diagnósticos relacionados con puertos.
- **Diagnóstico de hardware:** estado de discos e información SMART, datos de batería y comprobaciones relacionadas con la memoria RAM.
- **Reparación y recuperación de Windows:** comprobaciones de integridad del sistema mediante SFC/DISM y administración de puntos de restauración.
- **Seguridad y credenciales:** auditoría y administración de cuentas locales de Windows, consulta y administración de perfiles Wi-Fi guardados, consulta de claves de producto OEM/BIOS de Windows y generación de hashes de archivos.
- **Mantenimiento y optimización:** inventario de programas instalados, inspección de programas de inicio, administración de servicios, limpieza de archivos temporales y utilidades de copia de seguridad de carpetas de usuario.
- **Accesos administrativos:** acceso a consolas de administración integradas de Windows y opciones avanzadas de reinicio y recuperación.
- **OSINT y reconocimiento de infraestructura:** consultas de registros DNS, búsqueda de subdominios comunes, inspección de encabezados HTTP e inspección de perfiles de navegadores.
- **Informes del sistema:** generación de un informe técnico del sistema en formato de texto plano.

Las herramientas disponibles pueden variar según la versión de Windows, la consola de PowerShell, los permisos y la configuración del equipo.

### Requisitos

- Windows 10 o Windows 11.
- Windows PowerShell 5.1 o un entorno PowerShell compatible.
- Permisos de administrador para determinadas operaciones del sistema.
- Acceso a Internet para las pruebas de red y las consultas en línea.

### Descarga y ejecución

1. Descargá o cloná este repositorio.
2. Abrí PowerShell y ubicá la carpeta donde se encuentra el script.
3. Ejecutá:

```powershell
.\ITToolbox_Multilingual_CustomWindowSize.ps1
```

4. Elegí un idioma en el menú inicial.
5. Seleccioná una herramienta del menú principal.

Algunas operaciones requieren una sesión de PowerShell con permisos elevados. Si una función necesita permisos de administrador, cerrá la terminal actual y volvé a abrir PowerShell con la opción **Ejecutar como administrador**.

### Personalizar el tamaño de la consola

Abrí el archivo `.ps1` con el Bloc de notas y modificá estos valores, ubicados cerca del comienzo:

```powershell
$script:ITToolboxWindowWidth  = 100
$script:ITToolboxWindowHeight = 30
```

- `WindowWidth` controla el ancho de la consola en columnas.
- `WindowHeight` controla el alto de la consola en filas.

Guardá el archivo y volvé a ejecutarlo. La posibilidad de cambiar el tamaño depende de la consola utilizada. Windows Terminal y algunas terminales integradas pueden administrar el tamaño exterior de la ventana por separado o ignorar las solicitudes de redimensionamiento.

### Seguridad y privacidad

Esta herramienta incluye funciones administrativas que pueden modificar la configuración del sistema o de la red y administrar recursos de Windows. Algunas utilidades pueden mostrar información sensible, como credenciales de redes inalámbricas guardadas o una clave de producto de Windows.

- Utilizá la herramienta únicamente en equipos y redes propios o que tengas autorización para administrar.
- Revisá cada operación y sus posibles efectos antes de confirmarla.
- No publiques informes ni capturas si contienen contraseñas, claves de producto, nombres de usuario, direcciones IP u otros datos privados.
- Realizá copias de seguridad de los datos importantes antes de ejecutar tareas de mantenimiento o cambiar configuraciones.

### Solución de problemas

- **Windows bloquea la ejecución del script:** revisá la directiva de ejecución de PowerShell y la configuración de seguridad de Windows. No reduzcas las protecciones de un equipo administrado sin autorización.
- **Una función no está disponible:** comprobá la versión de Windows, los permisos necesarios y la disponibilidad del hardware o servicio correspondiente.
- **La consola no cambia de tamaño:** utilizá una consola compatible o ajustá manualmente el tamaño de la ventana del terminal.
- **Fallan las pruebas de red:** verificá la conexión y tené en cuenta que los equipos remotos o los firewalls pueden bloquear ICMP u otro tráfico de diagnóstico.

### Contribuciones

Son bienvenidos los informes de errores, las sugerencias y las mejoras. Al informar un problema, incluí la versión de Windows, la versión de PowerShell, el idioma seleccionado y el mensaje de error correspondiente. Eliminá contraseñas, claves de producto y otros datos sensibles antes de compartir registros.

### Descargo de responsabilidad

Este proyecto se proporciona con fines educativos, de diagnóstico y administración informática autorizada. El autor no se responsabiliza por daños, pérdida de datos, interrupciones de servicios ni usos no autorizados derivados de la ejecución del software. Utilizalo bajo tu propia responsabilidad y verificá las acciones que puedan generar cambios importantes antes de continuar.

### Autor

**Fernando Vitale**

---

## Português

### Visão geral

IT Technician Toolbox Pro é um conjunto interativo de ferramentas desenvolvido em PowerShell que reúne tarefas comuns de suporte técnico e administração do Windows em um único aplicativo de console. É destinado a técnicos de informática, equipes de suporte, administradores de sistemas e usuários avançados do Windows.

Ao iniciar, o script apresenta um seletor de idioma com opções em inglês, espanhol e português. Também permite ajustar a largura e a altura do console editando dois valores no início do arquivo `.ps1`.

### Principais categorias de ferramentas

- **Diagnóstico e reparo de rede:** configuração e consulta de DNS, testes de ping e perda de pacotes, medição da velocidade de download, redefinição e reparo de rede, inspeção de conexões ativas e diagnósticos relacionados a portas.
- **Diagnóstico de hardware:** estado dos discos e informações SMART, dados da bateria e verificações relacionadas à memória RAM.
- **Reparo e recuperação do Windows:** verificações de integridade do sistema usando SFC/DISM e gerenciamento de pontos de restauração.
- **Segurança e credenciais:** auditoria e gerenciamento de contas locais do Windows, consulta e gerenciamento de perfis Wi-Fi salvos, consulta da chave de produto OEM/BIOS do Windows e geração de hashes de arquivos.
- **Manutenção e otimização:** inventário de programas instalados, inspeção de programas de inicialização, gerenciamento de serviços, limpeza de arquivos temporários e utilitários de backup de pastas do usuário.
- **Atalhos administrativos:** acesso aos consoles de gerenciamento integrados do Windows e às opções avançadas de reinicialização e recuperação.
- **OSINT e reconhecimento de infraestrutura:** consultas de registros DNS, busca de subdomínios comuns, inspeção de cabeçalhos HTTP e inspeção de perfis de navegadores.
- **Relatórios do sistema:** geração de um relatório técnico do sistema em formato de texto simples.

As ferramentas disponíveis podem variar de acordo com a versão do Windows, o terminal PowerShell, as permissões e a configuração do computador.

### Requisitos

- Windows 10 ou Windows 11.
- Windows PowerShell 5.1 ou um ambiente PowerShell compatível.
- Privilégios de administrador para determinadas operações do sistema.
- Acesso à Internet para testes de rede e consultas online.

### Download e execução

1. Baixe ou clone este repositório.
2. Abra o PowerShell e navegue até a pasta onde o script está localizado.
3. Execute:

```powershell
.\ITToolbox_Multilingual_CustomWindowSize.ps1
```

4. Escolha um idioma no menu inicial.
5. Selecione uma ferramenta no menu principal.

Algumas operações exigem uma sessão do PowerShell com privilégios elevados. Se uma função precisar de permissões de administrador, feche o terminal atual e abra o PowerShell novamente usando **Executar como administrador**.

### Personalizar o tamanho do console

Abra o arquivo `.ps1` no Bloco de Notas e edite os valores abaixo, localizados próximo ao início do arquivo:

```powershell
$script:ITToolboxWindowWidth  = 100
$script:ITToolboxWindowHeight = 30
```

- `WindowWidth` controla a largura do console em colunas.
- `WindowHeight` controla a altura do console em linhas.

Salve o arquivo e execute-o novamente. A possibilidade de redimensionamento depende do terminal utilizado. O Windows Terminal e alguns terminais integrados podem controlar o tamanho externo da janela separadamente ou ignorar solicitações de redimensionamento.

### Segurança e privacidade

Esta ferramenta inclui funções administrativas que podem alterar configurações do sistema ou da rede e gerenciar recursos do Windows. Alguns utilitários podem exibir informações confidenciais, como credenciais de redes sem fio salvas ou uma chave de produto do Windows.

- Utilize a ferramenta somente em computadores e redes próprios ou para os quais você tenha autorização para administrar.
- Revise cada operação e seus possíveis efeitos antes de confirmá-la.
- Não publique relatórios ou capturas de tela que contenham senhas, chaves de produto, nomes de usuário, endereços IP ou outras informações privadas.
- Faça backup dos dados importantes antes de executar tarefas de manutenção ou alterar configurações.

### Solução de problemas

- **A execução do script está bloqueada:** verifique a política de execução do PowerShell e as configurações de segurança do Windows. Não reduza as proteções de um dispositivo gerenciado sem autorização.
- **Um recurso não está disponível:** confira a versão do Windows, as permissões necessárias e a disponibilidade do hardware ou serviço correspondente.
- **O console não redimensiona:** utilize um terminal compatível ou ajuste manualmente o tamanho da janela.
- **Os testes de rede falham:** verifique a conexão e lembre-se de que hosts remotos ou firewalls podem bloquear ICMP ou outro tráfego de diagnóstico.

### Contribuições

Relatórios de bugs, sugestões e melhorias são bem-vindos. Ao relatar um problema, informe a versão do Windows, a versão do PowerShell, o idioma selecionado e a mensagem de erro relevante. Remova senhas, chaves de produto e outras informações confidenciais antes de compartilhar registros.

### Isenção de responsabilidade

Este projeto é fornecido para fins educacionais, de diagnóstico e administração de TI autorizada. O autor não se responsabiliza por danos, perda de dados, interrupções de serviços ou uso não autorizado decorrentes da execução deste software. Utilize-o por sua conta e risco e verifique ações que possam causar alterações importantes antes de prosseguir.

### Autor

**Fernando Vitale**
