# =========================================================
# LANGUAGE SELECTION / LOCALIZATION
# =========================================================
# =========================================================
# CONSOLE WINDOW SIZE - EDIT THESE VALUES WITH NOTEPAD
# =========================================================
# Set the preferred console dimensions below.
# WindowWidth  = horizontal size (columns)
# WindowHeight = vertical size (rows)
# Save the file after editing these values.
$script:ITToolboxWindowWidth  = 90
$script:ITToolboxWindowHeight = 40

# Apply the dimensions where the current PowerShell host allows resizing.
# This changes the console viewport, not the Windows Terminal frame.
try {
    $rawUI = $Host.UI.RawUI
    $bufferSize = $rawUI.BufferSize
    $currentSize = $rawUI.WindowSize

    $targetWidth  = [Math]::Max(1, [Math]::Min($script:ITToolboxWindowWidth, $bufferSize.Width))
    $targetHeight = [Math]::Max(1, [Math]::Min($script:ITToolboxWindowHeight, $bufferSize.Height))

    $rawUI.WindowSize = New-Object System.Management.Automation.Host.Size($targetWidth, $targetHeight)
} catch {
    # Some hosts (for example, certain integrated terminals) do not allow resizing.
}

$script:ITToolboxLanguage = 'ES'
Clear-Host
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "             IT TECHNICIAN TOOLBOX PRO v15.0" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  SELECT LANGUAGE / SELECCIONAR IDIOMA / SELECIONE O IDIOMA" -ForegroundColor Cyan
Write-Host "  [1] English"
Write-Host "  [2] Español"
Write-Host "  [3] Português"
Write-Host ""
do { $languageChoice = Read-Host "Choose language / Elija idioma / Escolha o idioma (1-3)" } while ($languageChoice -notin @('1','2','3'))
switch ($languageChoice) {
    '1' { $script:ITToolboxLanguage = 'EN' }
    '2' { $script:ITToolboxLanguage = 'ES' }
    '3' { $script:ITToolboxLanguage = 'PT' }
}

# Translates console messages while preserving variables, command output and colors.
function Convert-ITToolboxText {
    param([AllowNull()][string]$Text)
    if ([string]::IsNullOrEmpty($Text) -or $script:ITToolboxLanguage -eq 'ES') { return $Text }
    $translations = @{
      'EN' = @{
        'MODO ADMINISTRADOR: OK'='ADMINISTRATOR MODE: OK'; 'CONSULTA DE SERVIDORES DNS ACTUALES'='CURRENT DNS SERVER CONFIGURATION';
        'No se encontraron adaptadores de red activos.'='No active network adapters were found.'; 'Adaptador:'='Adapter:';
        'Servidores DNS configurados:'='Configured DNS servers:'; 'Sin servidores asignados o configuracion automatica sin respuesta.'='No servers assigned or automatic configuration did not respond.';
        'SELECCION DE SERVIDORES DNS'='DNS SERVER SELECTION'; 'Rapido y enfocado en privacidad.'='Fast and privacy-focused.';
        'Alta disponibilidad y velocidad global.'='High availability and global speed.'; 'Bloqueo de dominios maliciosos.'='Blocks malicious domains.';
        'Fiabilidad y filtros de red.'='Reliability and network filtering.'; 'Bloqueo de publicidad y rastreadores.'='Blocks ads and trackers.';
        'Restaurar DNS a Automatico'='Restore DNS to Automatic'; 'Volver al menu de red'='Return to network menu';
        'Selecciona el proveedor DNS a aplicar (1-7)'='Select the DNS provider to apply (1-7)'; 'Opcion no valida.'='Invalid option.';
        'Aplicando configuracion DNS'='Applying DNS configuration'; 'ERROR: No se encontraron adaptadores de red activos'='ERROR: No active network adapters were found';
        '[EXITO]'='[SUCCESS]'; '[ADVERTENCIA]'='[WARNING]'; '[ERROR]'='[ERROR]'; 'No se pudo cambiar el DNS en este adaptador:'='Could not change DNS on this adapter:';
        'Presiona Enter para continuar...'='Press Enter to continue...'; 'PRUEBA DE LATENCIA (PING) Y PERDIDA DE PAQUETES'='LATENCY (PING) AND PACKET LOSS TEST';
        'Ingresa la IP o Dominio a evaluar [Presiona Enter para usar 8.8.8.8 (Google)]'='Enter the IP address or domain to test [Press Enter to use 8.8.8.8 (Google)]';
        'Enviando 10 paquetes ICMP a'='Sending 10 ICMP packets to'; 'Estadisticas de respuesta:'='Response statistics:';
        'Paquetes enviados:'='Packets sent:'; 'Recibidos:'='Received:'; 'Perdidos:'='Lost:'; 'perdida'='packet loss';
        'Tiempo minimo:'='Minimum time:'; 'Tiempo maximo:'='Maximum time:'; 'Promedio:'='Average:';
        'No se recibio respuesta de'='No response received from'; 'El host puede estar inalcanzable o bloqueando ICMP.'='The host may be unreachable or blocking ICMP.';
        'MEDIDA DE VELOCIDAD DE INTERNET'='INTERNET SPEED TEST'; 'Descargando archivo de prueba (100 MB) desde CDN... Por favor espera...'='Downloading a 100 MB test file from the CDN... Please wait...';
        'Resultado del test de velocidad de descarga:'='Download speed test results:'; 'Datos descargados:'='Downloaded data:';
        'Tiempo transcurrido:'='Elapsed time:'; 'segundos'='seconds'; 'Velocidad promedio:'='Average speed:';
        'El proceso fue demasiado rapido para medirlo con precision.'='The process completed too quickly to measure accurately.';
        'No se pudo completar la prueba de velocidad:'='Could not complete the speed test:';
        'REPARACION Y LIMPIEZA DE RED'='NETWORK REPAIR AND CLEANUP'; 'Vaciando cache DNS...'='Flushing DNS cache...';
        'Renovando asignacion IP...'='Renewing IP address...'; 'Restableciendo Winsock...'='Resetting Winsock...';
        'Pila de red restablecida correctamente.'='Network stack successfully reset.';
        'REDES WI-FI GUARDADAS Y CLAVES EN TEXTO CLARO'='SAVED WI-FI NETWORKS AND PASSWORDS';
        'No se encontraron perfiles Wi-Fi guardados en este equipo.'='No saved Wi-Fi profiles were found on this computer.';
        'CLAVE:'='PASSWORD:'; 'Sin clave / Red abierta / No disponible'='No password / Open network / Not available';
        'Reporte guardado automaticamente en:'='Report automatically saved to:';
        'ELIMINAR PERFIL DE RED WI-FI'='DELETE WI-FI NETWORK PROFILE'; 'No hay perfiles Wi-Fi guardados para eliminar.'='There are no saved Wi-Fi profiles to delete.';
        'Redes guardadas actualmente:'='Currently saved networks:'; 'Escribe el nombre exacto de la red que deseas borrar'='Enter the exact name of the network you want to delete';
        'ha sido eliminado correctamente.'='was successfully deleted.'; 'No se encontro ninguna red con el nombre'='No network was found with the name';
        'BORRADO MASIVO DE PERFILES WI-FI'='BULK DELETION OF WI-FI PROFILES'; 'Se encontraron'='Found'; 'perfiles Wi-Fi en el sistema.'='Wi-Fi profiles on the system.';
        'ADVERTENCIA: Esta accion borrara TODAS las credenciales Wi-Fi almacenadas.'='WARNING: This action will delete ALL stored Wi-Fi credentials.';
        'Deseas eliminar TODAS las redes? (Escribe S para confirmar)'='Do you want to delete ALL networks? (Type S to confirm)';
        'Todos los perfiles Wi-Fi han sido eliminados correctamente.'='All Wi-Fi profiles were successfully deleted.'; 'Operacion cancelada por el usuario.'='Operation cancelled by the user.';
        'CLAVE DE LICENCIA DE WINDOWS (OEM / BIOS)'='WINDOWS LICENSE KEY (OEM / BIOS)';
        'Clave de producto encontrada en la BIOS/UEFI:'='Product key found in BIOS/UEFI:'; 'No se encontro ninguna clave OEM registrada en la BIOS/UEFI.'='No OEM key was found in BIOS/UEFI.';
        'Error al consultar la clave del producto:'='Error retrieving the product key:';
        'Selecciona una opcion'='Select an option'; 'Volver al menu principal'='Return to the main menu';
        'SALIR'='EXIT'; 'Saliendo...'='Exiting...'; 'Generando informe exhaustivo...'='Generating comprehensive report...';
        'Informe generado en:'='Report generated at:'; 'INFORME TECNICO EXHAUSTIVO DE SISTEMA'='COMPREHENSIVE SYSTEM TECHNICAL REPORT';
        'PROTECCION Y RASTREO ANTI-RANSOMWARE'='ANTI-RANSOMWARE PROTECTION AND MONITORING';
        'DIAGNOSTICO Y SALUD DE HARDWARE'='HARDWARE DIAGNOSTICS AND HEALTH'; 'REPARACION DE WINDOWS Y RESTAURACION'='WINDOWS REPAIR AND RESTORE';
        'RED Y ESCANER DE PUERTOS'='NETWORK AND PORT SCANNER'; 'SEGURIDAD, CREDENCIALES Y HASHES'='SECURITY, CREDENTIALS AND HASHES';
        'MANTENIMIENTO Y OPTIMIZACION'='MAINTENANCE AND OPTIMIZATION'; 'HERRAMIENTAS DE GESTION Y CONSOLAS MSC'='MANAGEMENT TOOLS AND MSC CONSOLES';
        'OPCIONES DE REINICIO AVANZADO'='ADVANCED RESTART OPTIONS'; 'HERRAMIENTAS OSINT Y RECONOCIMIENTO'='OSINT AND RECONNAISSANCE TOOLS';
        'GENERAR INFORME TECNICO EXHAUSTIVO EN TEXTO (.TXT)'='GENERATE COMPREHENSIVE TEXT TECHNICAL REPORT (.TXT)';
        'Selecciona el proveedor DNS a aplicar'='Select the DNS provider to apply'; 'Rapido'='Fast'; 'Automatico'='Automatic';
        'Buscar subdominios activos'='Find active subdomains'; 'Analizando'='Analyzing'; 'Consultando'='Querying';
        'No se encontraron'='No'; ' correctamente.'=' successfully.'; 'Operacion cancelada.'='Operation cancelled.'
      }
      'PT' = @{
        'MODO ADMINISTRADOR: OK'='MODO ADMINISTRADOR: OK'; 'CONSULTA DE SERVIDORES DNS ACTUALES'='CONFIGURACAO DOS SERVIDORES DNS ATUAIS';
        'No se encontraron adaptadores de red activos.'='Nenhum adaptador de rede ativo foi encontrado.'; 'Adaptador:'='Adaptador:';
        'Servidores DNS configurados:'='Servidores DNS configurados:'; 'Sin servidores asignados o configuracion automatica sin respuesta.'='Nenhum servidor atribuido ou a configuracao automatica nao respondeu.';
        'SELECCION DE SERVIDORES DNS'='SELECAO DE SERVIDORES DNS'; 'Rapido y enfocado en privacidad.'='Rapido e focado em privacidade.';
        'Alta disponibilidad y velocidad global.'='Alta disponibilidade e velocidade global.'; 'Bloqueo de dominios maliciosos.'='Bloqueia dominios maliciosos.';
        'Fiabilidad y filtros de red.'='Confiabilidade e filtros de rede.'; 'Bloqueo de publicidad y rastreadores.'='Bloqueia anuncios e rastreadores.';
        'Restaurar DNS a Automatico'='Restaurar DNS para Automatico'; 'Volver al menu de red'='Voltar ao menu de rede';
        'Selecciona el proveedor DNS a aplicar (1-7)'='Selecione o provedor DNS a aplicar (1-7)'; 'Opcion no valida.'='Opcao invalida.';
        'Aplicando configuracion DNS'='Aplicando configuracao DNS'; 'ERROR: No se encontraron adaptadores de red activos'='ERRO: Nenhum adaptador de rede ativo foi encontrado';
        '[EXITO]'='[SUCESSO]'; '[ADVERTENCIA]'='[AVISO]'; '[ERROR]'='[ERRO]'; 'No se pudo cambiar el DNS en este adaptador:'='Nao foi possivel alterar o DNS neste adaptador:';
        'Presiona Enter para continuar...'='Pressione Enter para continuar...'; 'PRUEBA DE LATENCIA (PING) Y PERDIDA DE PAQUETES'='TESTE DE LATENCIA (PING) E PERDA DE PACOTES';
        'Ingresa la IP o Dominio a evaluar [Presiona Enter para usar 8.8.8.8 (Google)]'='Digite o IP ou dominio para testar [Pressione Enter para usar 8.8.8.8 (Google)]';
        'Enviando 10 paquetes ICMP a'='Enviando 10 pacotes ICMP para'; 'Estadisticas de respuesta:'='Estatisticas de resposta:';
        'Paquetes enviados:'='Pacotes enviados:'; 'Recibidos:'='Recebidos:'; 'Perdidos:'='Perdidos:'; 'perdida'='de perda';
        'Tiempo minimo:'='Tempo minimo:'; 'Tiempo maximo:'='Tempo maximo:'; 'Promedio:'='Media:';
        'No se recibio respuesta de'='Nenhuma resposta recebida de'; 'El host puede estar inalcanzable o bloqueando ICMP.'='O host pode estar inacessivel ou bloqueando ICMP.';
        'MEDIDA DE VELOCIDAD DE INTERNET'='TESTE DE VELOCIDADE DA INTERNET'; 'Descargando archivo de prueba (100 MB) desde CDN... Por favor espera...'='Baixando um arquivo de teste de 100 MB da CDN... Aguarde...';
        'Resultado del test de velocidad de descarga:'='Resultado do teste de velocidade de download:'; 'Datos descargados:'='Dados baixados:';
        'Tiempo transcurrido:'='Tempo decorrido:'; 'segundos'='segundos'; 'Velocidad promedio:'='Velocidade media:';
        'El proceso fue demasiado rapido para medirlo con precision.'='O processo foi rapido demais para medir com precisao.';
        'No se pudo completar la prueba de velocidad:'='Nao foi possivel concluir o teste de velocidade:';
        'REPARACION Y LIMPIEZA DE RED'='REPARO E LIMPEZA DE REDE'; 'Vaciando cache DNS...'='Limpando o cache DNS...';
        'Renovando asignacion IP...'='Renovando o endereco IP...'; 'Restableciendo Winsock...'='Redefinindo o Winsock...';
        'Pila de red restablecida correctamente.'='Pilha de rede redefinida com sucesso.';
        'REDES WI-FI GUARDADAS Y CLAVES EN TEXTO CLARO'='REDES WI-FI SALVAS E SENHAS';
        'No se encontraron perfiles Wi-Fi guardados en este equipo.'='Nenhum perfil Wi-Fi salvo foi encontrado neste computador.';
        'CLAVE:'='SENHA:'; 'Sin clave / Red abierta / No disponible'='Sem senha / Rede aberta / Indisponivel';
        'Reporte guardado automaticamente en:'='Relatorio salvo automaticamente em:';
        'ELIMINAR PERFIL DE RED WI-FI'='EXCLUIR PERFIL DE REDE WI-FI'; 'No hay perfiles Wi-Fi guardados para eliminar.'='Nao ha perfis Wi-Fi salvos para excluir.';
        'Redes guardadas actualmente:'='Redes salvas atualmente:'; 'Escribe el nombre exacto de la red que deseas borrar'='Digite o nome exato da rede que deseja excluir';
        'ha sido eliminado correctamente.'='foi excluido com sucesso.'; 'No se encontro ninguna red con el nombre'='Nenhuma rede foi encontrada com o nome';
        'BORRADO MASIVO DE PERFILES WI-FI'='EXCLUSAO EM MASSA DE PERFIS WI-FI'; 'Se encontraron'='Foram encontrados'; 'perfiles Wi-Fi en el sistema.'='perfis Wi-Fi no sistema.';
        'ADVERTENCIA: Esta accion borrara TODAS las credenciales Wi-Fi almacenadas.'='AVISO: Esta acao excluira TODAS as credenciais Wi-Fi armazenadas.';
        'Deseas eliminar TODAS las redes? (Escribe S para confirmar)'='Deseja excluir TODAS as redes? (Digite S para confirmar)';
        'Todos los perfiles Wi-Fi han sido eliminados correctamente.'='Todos os perfis Wi-Fi foram excluidos com sucesso.'; 'Operacion cancelada por el usuario.'='Operacao cancelada pelo usuario.';
        'CLAVE DE LICENCIA DE WINDOWS (OEM / BIOS)'='CHAVE DE LICENCA DO WINDOWS (OEM / BIOS)';
        'Clave de producto encontrada en la BIOS/UEFI:'='Chave do produto encontrada na BIOS/UEFI:'; 'No se encontro ninguna clave OEM registrada en la BIOS/UEFI.'='Nenhuma chave OEM foi encontrada na BIOS/UEFI.';
        'Error al consultar la clave del producto:'='Erro ao consultar a chave do produto:';
        'Selecciona una opcion'='Selecione uma opcao'; 'Volver al menu principal'='Voltar ao menu principal';
        'SALIR'='SAIR'; 'Saliendo...'='Saindo...'; 'Generando informe exhaustivo...'='Gerando relatorio completo...';
        'Informe generado en:'='Relatorio gerado em:'; 'INFORME TECNICO EXHAUSTIVO DE SISTEMA'='RELATORIO TECNICO COMPLETO DO SISTEMA';
        'PROTECCION Y RASTREO ANTI-RANSOMWARE'='PROTECAO E MONITORAMENTO ANTI-RANSOMWARE';
        'DIAGNOSTICO Y SALUD DE HARDWARE'='DIAGNOSTICO E SAUDE DO HARDWARE'; 'REPARACION DE WINDOWS Y RESTAURACION'='REPARO E RESTAURACAO DO WINDOWS';
        'RED Y ESCANER DE PUERTOS'='REDE E SCANNER DE PORTAS'; 'SEGURIDAD, CREDENCIALES Y HASHES'='SEGURANCA, CREDENCIAIS E HASHES';
        'MANTENIMIENTO Y OPTIMIZACION'='MANUTENCAO E OTIMIZACAO'; 'HERRAMIENTAS DE GESTION Y CONSOLAS MSC'='FERRAMENTAS DE GERENCIAMENTO E CONSOLES MSC';
        'OPCIONES DE REINICIO AVANZADO'='OPCOES AVANCADAS DE REINICIALIZACAO'; 'HERRAMIENTAS OSINT Y RECONOCIMIENTO'='FERRAMENTAS OSINT E RECONHECIMENTO';
        'GENERAR INFORME TECNICO EXHAUSTIVO EN TEXTO (.TXT)'='GERAR RELATORIO TECNICO COMPLETO EM TEXTO (.TXT)';
        'Selecciona el proveedor DNS a aplicar'='Selecione o provedor DNS a aplicar'; 'Rapido'='Rapido'; 'Automatico'='Automatico';
        'Analizando'='Analisando'; 'Consultando'='Consultando'; 'Operacion cancelada.'='Operacao cancelada.'
      }
    }
    $map = $translations[$script:ITToolboxLanguage]
    $additionalTranslations = @{}
    if ($script:ITToolboxLanguage -eq 'EN') {
        $additionalTranslations = @{
            'PROTECCION Y RASTREO ANTI-RANSOMWARE' = 'ANTI-RANSOMWARE PROTECTION AND MONITORING'
            'Herramientas de honeypot y deteccion por firmas sospechosas.' = 'Honeypot tools and suspicious-signature detection.'
            'DIAGNOSTICO Y SALUD DE HARDWARE' = 'HARDWARE DIAGNOSTICS AND HEALTH'
            'Analisis SMART de discos, bateria y estado de la memoria RAM.' = 'Disk SMART analysis, battery health, and RAM status.'
            'REPARACION DE WINDOWS Y RESTAURACION' = 'WINDOWS REPAIR AND RESTORE'
            'Integridad del sistema (SFC/DISM) y gestion de puntos de restauracion.' = 'System integrity (SFC/DISM) and restore point management.'
            'RED Y ESCANER DE PUERTOS' = 'NETWORK AND PORT SCANNER'
            'Consulta/cambio de DNS, IP publica, ping, test de velocidad y reset de red.' = 'DNS lookup/change, public IP, ping, speed test, and network reset.'
            'SEGURIDAD, CREDENCIALES Y HASHES' = 'SECURITY, CREDENTIALS AND HASHES'
            'Auditoria de usuarios, claves Wi-Fi, clave OEM, hashes y autostart.' = 'User auditing, Wi-Fi passwords, OEM key, hashes, and startup items.'
            'MANTENIMIENTO Y OPTIMIZACION' = 'MAINTENANCE AND OPTIMIZATION'
            'Limpieza, TRIM, inventario software, backups express y servicios.' = 'Cleanup, TRIM, software inventory, quick backups, and services.'
            'HERRAMIENTAS DE GESTION Y CONSOLAS MSC' = 'MANAGEMENT TOOLS AND MSC CONSOLES'
            'Accesos directos a las consolas administrativas integradas de Windows.' = 'Shortcuts to built-in Windows administrative consoles.'
            'OPCIONES DE REINICIO AVANZADO' = 'ADVANCED RESTART OPTIONS'
            'Accesos directos para reiniciar en BIOS, Modo Seguro o WinRE.' = 'Shortcuts to restart into BIOS, Safe Mode, or Windows Recovery Environment.'
            'HERRAMIENTAS OSINT Y RECONOCIMIENTO' = 'OSINT AND RECONNAISSANCE TOOLS'
            'Consultas DNS avanzadas, subdominios, cabeceras HTTP y perfiles web.' = 'Advanced DNS queries, subdomains, HTTP headers, and web profiles.'
            'GENERAR INFORME TECNICO EXHAUSTIVO EN TEXTO (.TXT)' = 'GENERATE COMPREHENSIVE TEXT TECHNICAL REPORT (.TXT)'
            'Exporta un reporte completo del sistema en el Escritorio.' = 'Exports a complete system report to the Desktop.'
            'Selecciona una opcion (0-10)' = 'Select an option (0-10)'
            'Saliendo...' = 'Exiting...'
        }
    } elseif ($script:ITToolboxLanguage -eq 'PT') {
        $additionalTranslations = @{
            'PROTECCION Y RASTREO ANTI-RANSOMWARE' = 'PROTECAO E MONITORAMENTO ANTI-RANSOMWARE'
            'Herramientas de honeypot y deteccion por firmas sospechosas.' = 'Ferramentas de honeypot e deteccao por assinaturas suspeitas.'
            'DIAGNOSTICO Y SALUD DE HARDWARE' = 'DIAGNOSTICO E SAUDE DO HARDWARE'
            'Analisis SMART de discos, bateria y estado de la memoria RAM.' = 'Analise SMART dos discos, bateria e estado da memoria RAM.'
            'REPARACION DE WINDOWS Y RESTAURACION' = 'REPARO E RESTAURACAO DO WINDOWS'
            'Integridad del sistema (SFC/DISM) y gestion de puntos de restauracion.' = 'Integridade do sistema (SFC/DISM) e gerenciamento de pontos de restauracao.'
            'RED Y ESCANER DE PUERTOS' = 'REDE E SCANNER DE PORTAS'
            'Consulta/cambio de DNS, IP publica, ping, test de velocidad y reset de red.' = 'Consulta/alteracao de DNS, IP publica, ping, teste de velocidade e redefinicao da rede.'
            'SEGURIDAD, CREDENCIALES Y HASHES' = 'SEGURANCA, CREDENCIAIS E HASHES'
            'Auditoria de usuarios, claves Wi-Fi, clave OEM, hashes y autostart.' = 'Auditoria de usuarios, senhas Wi-Fi, chave OEM, hashes e inicializacao automatica.'
            'MANTENIMIENTO Y OPTIMIZACION' = 'MANUTENCAO E OTIMIZACAO'
            'Limpieza, TRIM, inventario software, backups express y servicios.' = 'Limpeza, TRIM, inventario de software, backups rapidos e servicos.'
            'HERRAMIENTAS DE GESTION Y CONSOLAS MSC' = 'FERRAMENTAS DE GERENCIAMENTO E CONSOLES MSC'
            'Accesos directos a las consolas administrativas integradas de Windows.' = 'Atalhos para os consoles administrativos integrados do Windows.'
            'OPCIONES DE REINICIO AVANZADO' = 'OPCOES AVANCADAS DE REINICIALIZACAO'
            'Accesos directos para reiniciar en BIOS, Modo Seguro o WinRE.' = 'Atalhos para reiniciar no BIOS, Modo de Seguranca ou WinRE.'
            'HERRAMIENTAS OSINT Y RECONOCIMIENTO' = 'FERRAMENTAS OSINT E RECONHECIMENTO'
            'Consultas DNS avanzadas, subdominios, cabeceras HTTP y perfiles web.' = 'Consultas DNS avancadas, subdominios, cabecalhos HTTP e perfis da web.'
            'GENERAR INFORME TECNICO EXHAUSTIVO EN TEXTO (.TXT)' = 'GERAR RELATORIO TECNICO COMPLETO EM TEXTO (.TXT)'
            'Exporta un reporte completo del sistema en el Escritorio.' = 'Exporta um relatorio completo do sistema para a Area de Trabalho.'
            'Selecciona una opcion (0-10)' = 'Selecione uma opcao (0-10)'
            'Saliendo...' = 'Saindo...'
        }
    }
    foreach ($key in $additionalTranslations.Keys) { $map[$key] = $additionalTranslations[$key] }
    foreach ($source in ($map.Keys | Sort-Object Length -Descending)) {
        $Text = $Text.Replace($source, $map[$source])
    }
    return $Text
}

# Keep the native cmdlets available and localize only their displayed text.
function Write-Host {
    [CmdletBinding()]
    param(
      [Parameter(Position=0, ValueFromRemainingArguments=$true)][object[]]$Object,
      [switch]$NoNewline,
      [ConsoleColor]$ForegroundColor,
      [ConsoleColor]$BackgroundColor,
      [string]$Separator = ' '
    )
    $rendered = @($Object | ForEach-Object { if ($_ -is [string]) { Convert-ITToolboxText $_ } else { $_ } })
    $writeArgs = @{ Object = $rendered; Separator = $Separator }
    if ($NoNewline) { $writeArgs.NoNewline = $true }
    if ($PSBoundParameters.ContainsKey('ForegroundColor')) { $writeArgs.ForegroundColor = $ForegroundColor }
    if ($PSBoundParameters.ContainsKey('BackgroundColor')) { $writeArgs.BackgroundColor = $BackgroundColor }
    Microsoft.PowerShell.Utility\Write-Host @writeArgs
}
function Read-Host {
    [CmdletBinding()]
    param([string]$Prompt, [switch]$AsSecureString)
    $localizedPrompt = Convert-ITToolboxText $Prompt
    if ($AsSecureString) { Microsoft.PowerShell.Utility\Read-Host -Prompt $localizedPrompt -AsSecureString }
    else { Microsoft.PowerShell.Utility\Read-Host -Prompt $localizedPrompt }
}

# =========================================================
# FUNCIONES AUXILIARES Y BANNERS
# =========================================================
function Mostrar-Banner {
    Clear-Host
    Write-Host "========================================================================================================" -ForegroundColor Cyan
    Write-Host "             IT TECHNICIAN TOOLBOX PRO v15.0 - VISUAL ALERTS & ADVANCED DIAGNOSTICS                    " -ForegroundColor Yellow
    Write-Host "                                     by Fernando Vitale                                                 " -ForegroundColor DarkGray
    Write-Host "========================================================================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "      MODO ADMINISTRADOR: OK" -ForegroundColor Green
    Write-Host ""
}

function Ver-ConfiguracionDNS {
    Write-Host ""
    Write-Host "--- [ CONSULTA DE SERVIDORES DNS ACTUALES ] ---" -ForegroundColor Cyan
    Write-Host ""
    
    $adapters = Get-NetAdapter | Where-Object Status -eq 'Up'
    
    if (-not $adapters) {
        Write-Host "No se encontraron adaptadores de red activos." -ForegroundColor Yellow
        return
    }

    foreach ($adapter in $adapters) {
        Write-Host " Adaptador: " -NoNewline -ForegroundColor White
        Write-Host "$($adapter.Name) ($($adapter.InterfaceDescription))" -ForegroundColor Yellow
        
        $dnsAddresses = (Get-DnsClientServerAddress -InterfaceAlias $adapter.Name -ErrorAction SilentlyContinue).ServerAddresses
        
        if ($dnsAddresses) {
            Write-Host " Servidores DNS configurados:" -ForegroundColor White
            foreach ($dns in $dnsAddresses) {
                Write-Host "   -> $dns" -ForegroundColor Green
            }
        } else {
            Write-Host " Servidores DNS: Sin servidores asignados o configuracion automatica sin respuesta." -ForegroundColor DarkGray
        }
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
    }
    Write-Host ""
}

function Cambiar-ServidoresDNS {
    do {
        Mostrar-Banner
        Write-Host " [4.2] SELECCION DE SERVIDORES DNS" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Cloudflare DNS  (1.1.1.1 / 1.0.0.1)      -> Rapido y enfocado en privacidad." -ForegroundColor White
        Write-Host "  2. Google Public   (8.8.8.8 / 8.8.4.4)      -> Alta disponibilidad y velocidad global." -ForegroundColor White
        Write-Host "  3. Quad9           (9.9.9.9 / 149.112.112.112) -> Bloqueo de dominios maliciosos." -ForegroundColor White
        Write-Host "  4. OpenDNS         (208.67.222.222 / 208.67.220.220) -> Fiabilidad y filtros de red." -ForegroundColor White
        Write-Host "  5. AdGuard DNS     (94.140.14.14 / 94.140.15.15) -> Bloqueo de publicidad y rastreadores." -ForegroundColor White
        Write-Host "  6. Restaurar DNS a Automatico (DHCP)" -ForegroundColor Yellow
        Write-Host "  7. Volver al menu de red" -ForegroundColor Red
        Write-Host ""
        
        $dnsOp = Read-Host "Selecciona el proveedor DNS a aplicar (1-7)"
        
        $primaryDns = $null
        $secondaryDns = $null
        $isDhcp = $false
        $providerName = ""

        switch ($dnsOp) {
            "1" { $primaryDns = "1.1.1.1"; $secondaryDns = "1.0.0.1"; $providerName = "Cloudflare" }
            "2" { $primaryDns = "8.8.8.8"; $secondaryDns = "8.8.4.4"; $providerName = "Google" }
            "3" { $primaryDns = "9.9.9.9"; $secondaryDns = "149.112.112.112"; $providerName = "Quad9" }
            "4" { $primaryDns = "208.67.222.222"; $secondaryDns = "208.67.220.220"; $providerName = "OpenDNS" }
            "5" { $primaryDns = "94.140.14.14"; $secondaryDns = "94.140.15.15"; $providerName = "AdGuard" }
            "6" { $isDhcp = $true; $providerName = "Automatico (DHCP)" }
            "7" { break }
            default { Write-Host "Opcion no valida." -ForegroundColor Red; Start-Sleep -Seconds 1; continue }
        }

        if ($dnsOp -eq "7") { break }

        Write-Host ""
        Write-Host "Aplicando configuracion DNS ($providerName)..." -ForegroundColor Yellow

        $adapters = Get-NetAdapter | Where-Object Status -eq 'Up'
        
        if (-not $adapters) {
            Write-Host "ERROR: No se encontraron adaptadores de red activos (Status: Up)." -ForegroundColor Red
        } else {
            foreach ($adapter in $adapters) {
                Write-Host " -> Adaptador: $($adapter.Name) ($($adapter.InterfaceDescription))" -ForegroundColor Cyan
                
                try {
                    if ($isDhcp) {
                        Set-DnsClientServerAddress -InterfaceAlias $adapter.Name -ResetServerAddresses -ErrorAction Stop
                    } else {
                        Set-DnsClientServerAddress -InterfaceAlias $adapter.Name -ServerAddresses ($primaryDns, $secondaryDns) -ErrorAction Stop
                    }

                    $currentDns = (Get-DnsClientServerAddress -InterfaceAlias $adapter.Name -AddressFamily IPv4).ServerAddresses

                    if ($isDhcp) {
                        if (-not $currentDns) {
                            Write-Host "   [EXITO] DNS restablecidos a Automatico (DHCP) correctamente." -ForegroundColor Green
                        } else {
                            Write-Host "   [EXITO] DNS configurados por DHCP. Servidores actuales: $($currentDns -join ', ')" -ForegroundColor Green
                        }
                    } else {
                        if ($currentDns -contains $primaryDns) {
                            Write-Host "   [EXITO] DNS cambiado correctamente a $providerName ($($currentDns -join ', '))" -ForegroundColor Green
                        } else {
                            Write-Host "   [ADVERTENCIA] El comando se ejecuto pero no se pudo verificar la IP asignada." -ForegroundColor Yellow
                        }
                    }
                } catch {
                    Write-Host "   [ERROR] No se pudo cambiar el DNS en este adaptador: $_" -ForegroundColor Red
                }
            }
        }
        
        Write-Host ""
        Read-Host "Presiona Enter para continuar..."
    } while ($true)
}

function Test-LatenciaRed {
    Write-Host ""
    Write-Host "--- [ PRUEBA DE LATENCIA (PING) Y PERDIDA DE PAQUETES ] ---" -ForegroundColor Cyan
    Write-Host ""
    
    $target = Read-Host "Ingresa la IP o Dominio a evaluar [Presiona Enter para usar 8.8.8.8 (Google)]"
    if ([string]::IsNullOrWhiteSpace($target)) { $target = "8.8.8.8" }
    
    Write-Host ""
    Write-Host "Enviando 10 paquetes ICMP a $target..." -ForegroundColor Yellow
    Write-Host ""

    $pingResult = Test-Connection -ComputerName $target -Count 10 -ErrorAction SilentlyContinue

    if ($pingResult) {
        $times = $pingResult | Select-Object -ExpandProperty ResponseTime
        $avgTime = ($times | Measure-Object -Average).Average
        $maxTime = ($times | Measure-Object -Maximum).Maximum
        $minTime = ($times | Measure-Object -Minimum).Minimum
        $lossRate = ((10 - $pingResult.Count) / 10) * 100

        $colorPerdida = if ($lossRate -gt 0) { "Red" } else { "Green" }
        $paquetesPerdidos = 10 - $pingResult.Count

        Write-Host " Estadisticas de respuesta:" -ForegroundColor White
        Write-Host "  -> Paquetes enviados: 10 | Recibidos: $($pingResult.Count) | Perdidos: $paquetesPerdidos ($lossRate% perdida)" -ForegroundColor $colorPerdida
        Write-Host "  -> Tiempo minimo: $minTime ms" -ForegroundColor White
        Write-Host "  -> Tiempo maximo: $maxTime ms" -ForegroundColor White
        Write-Host "  -> Promedio:     $([math]::Round($avgTime, 2)) ms" -ForegroundColor Green
    } else {
        Write-Host " [ERROR] No se recibio respuesta de $target. El host puede estar inalcanzable o bloqueando ICMP." -ForegroundColor Red
    }
    Write-Host ""
}

function Test-VelocidadDescarga {
    Write-Host ""
    Write-Host "--- [ MEDIDA DE VELOCIDAD DE INTERNET ] ---" -ForegroundColor Cyan
    Write-Host "Descargando archivo de prueba (100 MB) desde CDN... Por favor espera..." -ForegroundColor Yellow
    Write-Host ""

    $testFileUrl = "https://speed.cloudflare.com/__down?bytes=104857600"
    $tempDestination = Join-Path $env:TEMP "speedtest_tmp.bin"

    try {
        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
        
        $session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
        $headers = @{
            "User-Agent"      = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
            "Accept"          = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"
            "Accept-Language" = "es-ES,es;q=0.9,en;q=0.8"
        }

        Invoke-WebRequest -Uri $testFileUrl -OutFile $tempDestination -WebSession $session -Headers $headers -ErrorAction Stop
        
        $stopwatch.Stop()
        
        if (Test-Path $tempDestination) {
            $fileSizeInBytes = (Get-Item $tempDestination).Length
            Remove-Item $tempDestination -Force -ErrorAction SilentlyContinue

            $seconds = $stopwatch.Elapsed.TotalSeconds
            if ($seconds -gt 0) {
                $megabits = ($fileSizeInBytes * 8) / 1MB
                $speedMbps = [math]::Round($megabits / $seconds, 2)

                Write-Host " Resultado del test de velocidad de descarga:" -ForegroundColor White
                Write-Host "  -> Datos descargados: $([math]::Round($fileSizeInBytes / 1MB, 2)) MB" -ForegroundColor White
                Write-Host "  -> Tiempo transcurrido: $([math]::Round($seconds, 2)) segundos" -ForegroundColor White
                Write-Host "  -> Velocidad promedio: $speedMbps Mbps" -ForegroundColor Green
            } else {
                Write-Host " El proceso fue demasiado rapido para medirlo con precision." -ForegroundColor Yellow
            }
        }
    } catch {
        Write-Host " [ERROR] No se pudo completar la prueba de velocidad: $_" -ForegroundColor Red
        if (Test-Path $tempDestination) {
            Remove-Item $tempDestination -Force -ErrorAction SilentlyContinue
        }
    }
    Write-Host ""
}

function Reparar-RedRapido {
    Write-Host ""
    Write-Host "--- [ REPARACION Y LIMPIEZA DE RED ] ---" -ForegroundColor Cyan
    Write-Host "Vaciando cache DNS..." -ForegroundColor Yellow
    Clear-DnsClientCache
    Write-Host "Renovando asignacion IP..." -ForegroundColor Yellow
    ipconfig /release | Out-Null
    ipconfig /renew | Out-Null
    Write-Host "Restableciendo Winsock..." -ForegroundColor Yellow
    netsh winsock reset | Out-Null
    Write-Host ""
    Write-Host "[EXITO] Pila de red restablecida correctamente." -ForegroundColor Green
    Write-Host ""
}

function Obtener-ClavesWifi {
    Write-Host ""
    Write-Host "--- [ REDES WI-FI GUARDADAS Y CLAVES EN TEXTO CLARO ] ---" -ForegroundColor Cyan
    Write-Host ""
    
    $desktopPath = [Environment]::GetFolderPath("Desktop")
    $outputFile = Join-Path $desktopPath $(if ($script:ITToolboxLanguage -eq 'EN') { 'Saved_WiFi_Passwords.txt' } elseif ($script:ITToolboxLanguage -eq 'PT') { 'Senhas_WiFi_Salvas.txt' } else { 'Claves_WiFi_Guardadas.txt' })
    $reportLines = @()
    
    $header = "================================================================`n" +
              "           REPORTE DE CLAVES WI-FI GUARDADAS                    `n" +
              "Fecha: $(Get-Date)`n" +
              "Equipo: $env:COMPUTERNAME`n" +
              "================================================================"
    $reportLines += $header

    $profiles = (netsh wlan show profiles) | Select-String "\:(.+)$" | ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
    
    if (-not $profiles) {
        Write-Host "No se encontraron perfiles Wi-Fi guardados en este equipo." -ForegroundColor Yellow
        $reportLines += "No se encontraron perfiles Wi-Fi guardados."
    } else {
        foreach ($profile in $profiles) {
            $profileDetails = netsh wlan show profile name="$profile" key=clear
            $keyMatch = $profileDetails | Select-String "Contenido de la clave|Key Content"
            
            if ($keyMatch) {
                $key = ($keyMatch -split "\:")[1].Trim()
                Write-Host " RED: " -NoNewline -ForegroundColor White
                Write-Host ("{0,-30}" -f $profile) -NoNewline -ForegroundColor Yellow
                Write-Host " CLAVE: " -NoNewline -ForegroundColor White
                Write-Host $key -ForegroundColor Green
                
                $reportLines += "Red: $profile | Clave: $key"
            } else {
                Write-Host " RED: " -NoNewline -ForegroundColor White
                Write-Host ("{0,-30}" -f $profile) -NoNewline -ForegroundColor Yellow
                Write-Host " CLAVE: " -NoNewline -ForegroundColor White
                Write-Host "Sin clave / Red abierta / No disponible" -ForegroundColor DarkGray
                
                $reportLines += "Red: $profile | Clave: Sin clave / Red abierta"
            }
        }
    }
    
    $reportLines | Out-File -FilePath $outputFile -Encoding utf8
    Write-Host ""
    Write-Host "Reporte guardado automaticamente en: $outputFile" -ForegroundColor Cyan
    Write-Host ""
}

function Eliminar-PerfilWifi {
    Write-Host ""
    Write-Host "--- [ ELIMINAR PERFIL DE RED WI-FI ] ---" -ForegroundColor Cyan
    Write-Host ""
    
    $profiles = (netsh wlan show profiles) | Select-String "\:(.+)$" | ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
    
    if (-not $profiles) {
        Write-Host "No hay perfiles Wi-Fi guardados para eliminar." -ForegroundColor Yellow
        return
    }
    
    Write-Host "Redes guardadas actualmente:" -ForegroundColor Yellow
    foreach ($p in $profiles) {
        Write-Host " - $p" -ForegroundColor White
    }
    Write-Host ""
    
    $targetProfile = Read-Host "Escribe el nombre exacto de la red que deseas borrar"
    
    if ($profiles -contains $targetProfile) {
        netsh wlan delete profile name="$targetProfile"
        Write-Host ""
        Write-Host "El perfil '$targetProfile' ha sido eliminado correctamente." -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "No se encontro ninguna red con el nombre '$targetProfile'." -ForegroundColor Red
    }
}

function Eliminar-TodasRedesWifi {
    Write-Host ""
    Write-Host "--- [ BORRADO MASIVO DE PERFILES WI-FI ] ---" -ForegroundColor Red
    Write-Host ""
    
    $profiles = (netsh wlan show profiles) | Select-String "\:(.+)$" | ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
    
    if (-not $profiles) {
        Write-Host "No hay perfiles Wi-Fi guardados en este equipo." -ForegroundColor Yellow
        return
    }
    
    Write-Host "Se encontraron $($profiles.Count) perfiles Wi-Fi en el sistema." -ForegroundColor White
    Write-Host "ADVERTENCIA: Esta accion borrara TODAS las credenciales Wi-Fi almacenadas." -ForegroundColor Red
    Write-Host ""
    
    $confirm = Read-Host "Deseas eliminar TODAS las redes? (Escribe S para confirmar)"
    
    if ($confirm -eq "S" -or $confirm -eq "s") {
        netsh wlan delete profile name=* | Out-Null
        Write-Host ""
        Write-Host "Todos los perfiles Wi-Fi han sido eliminados correctamente." -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "Operacion cancelada por el usuario." -ForegroundColor Yellow
    }
}

function Obtener-ClaveWindows {
    Write-Host ""
    Write-Host "--- [ CLAVE DE LICENCIA DE WINDOWS (OEM / BIOS) ] ---" -ForegroundColor Cyan
    Write-Host ""
    try {
        $key = (Get-CimInstance -ClassName SoftwareLicensingService).OA3xOriginalProductKey
        if ($key) {
            Write-Host " Clave de producto encontrada en la BIOS/UEFI:" -ForegroundColor White
            Write-Host " -> $key" -ForegroundColor Green
        } else {
            Write-Host "No se encontro ninguna clave OEM registrada en la BIOS/UEFI." -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Error al consultar la clave del producto: $_" -ForegroundColor Red
    }
    Write-Host ""
}

function Gestionar-PuntosRestauracion {
    do {
        Mostrar-Banner
        Write-Host " [3.4] GESTION DE PUNTOS DE RESTAURACION" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Listar puntos de restauracion existentes" -ForegroundColor White
        Write-Host "     -> Muestra la fecha, descripcion y SequenceNumber de cada punto almacenado." -ForegroundColor DarkGray
        Write-Host "  2. Eliminar un punto de restauracion especifico" -ForegroundColor Red
        Write-Host "     -> Selecciona un punto por numero de orden para removerlo individualmente." -ForegroundColor DarkGray
        Write-Host "  3. Eliminar TODOS los puntos excepto el mas reciente" -ForegroundColor Red
        Write-Host "     -> Conserva el ultimo punto de restauracion y borra los anteriores para liberar espacio." -ForegroundColor DarkGray
        Write-Host "  4. Volver al menu de reparacion" -ForegroundColor Red
        Write-Host ""
        
        $rstOp = Read-Host "Selecciona una opcion (1-4)"
        
        switch ($rstOp) {
            "1" {
                Write-Host ""
                Write-Host "--- [ PUNTOS DE RESTAURACION EXISTENTES ] ---" -ForegroundColor Cyan
                Write-Host ""
                
                try {
                    $restorePoints = Get-ComputerRestorePoint
                    
                    if (-not $restorePoints) {
                        Write-Host "No se encontraron puntos de restauracion guardados en el sistema." -ForegroundColor Yellow
                    } else {
                        foreach ($rp in $restorePoints) {
                            $fecha = [System.Management.ManagementDateTimeConverter]::ToDateTime($rp.CreationTime)
                            Write-Host " [ID: $($rp.SequenceNumber)] " -NoNewline -ForegroundColor Yellow
                            Write-Host "Fecha: $fecha " -NoNewline -ForegroundColor White
                            Write-Host "| Tipo: $($rp.RestorePointType) " -NoNewline -ForegroundColor DarkGray
                            Write-Host "| $($rp.Description)" -ForegroundColor Green
                        }
                    }
                } catch {
                    Write-Host "Error al consultar los puntos de restauracion. Asegurate de que la Proteccion del Sistema este activada." -ForegroundColor Red
                }
                Write-Host ""
            }
            "2" {
                Write-Host ""
                Write-Host "--- [ ELIMINAR UN PUNTO DE RESTAURACION ] ---" -ForegroundColor Cyan
                Write-Host ""
                
                try {
                    $restorePoints = @(Get-ComputerRestorePoint)
                    
                    if ($restorePoints.Count -eq 0) {
                        Write-Host "No hay puntos de restauracion disponibles para eliminar." -ForegroundColor Yellow
                    } else {
                        for ($i = 0; $i -lt $restorePoints.Count; $i++) {
                            $rp = $restorePoints[$i]
                            $fecha = [System.Management.ManagementDateTimeConverter]::ToDateTime($rp.CreationTime)
                            Write-Host "  [$($i + 1)] ID: $($rp.SequenceNumber) | Fecha: $fecha | $($rp.Description)" -ForegroundColor White
                        }
                        
                        Write-Host ""
                        $selection = Read-Host "Selecciona el numero del elemento a ELIMINAR (1-$($restorePoints.Count))"
                        
                        if ($selection -match '^\d+$' -and [int]$selection -ge 1 -and [int]$selection -le $restorePoints.Count) {
                            $target = $restorePoints[[int]$selection - 1]
                            $targetSeq = $target.SequenceNumber
                            
                            Write-Host ""
                            $confirm = Read-Host "ADVERTENCIA:  Seguro que deseas eliminar el punto ID $targetSeq ('$($target.Description)')? (S/N)"
                            
                            if ($confirm -eq "S" -or $confirm -eq "s") {
                                Write-Host "Eliminando punto de restauracion ID $targetSeq..." -ForegroundColor Yellow
                                Get-CimInstance -Namespace "root\default" -ClassName "SystemRestore" | Where-Object { $_.SequenceNumber -eq $targetSeq } | Remove-CimInstance -ErrorAction Stop
                                Write-Host "[EXITO] El punto de restauracion ID $targetSeq ha sido eliminado." -ForegroundColor Green
                            } else {
                                Write-Host "Operacion cancelada." -ForegroundColor Yellow
                            }
                        } else {
                            Write-Host "Seleccion no valida." -ForegroundColor Red
                        }
                    }
                } catch {
                    Write-Host "Error al intentar eliminar el punto de restauracion: $_" -ForegroundColor Red
                }
                Write-Host ""
            }
            "3" {
                Write-Host ""
                Write-Host "--- [ CONSERVAR SOLO EL ULTIMO PUNTO DE RESTAURACION ] ---" -ForegroundColor Cyan
                Write-Host ""
                
                try {
                    $restorePoints = @(Get-ComputerRestorePoint | Sort-Object SequenceNumber)
                    
                    if ($restorePoints.Count -le 1) {
                        Write-Host "Se requieren al menos 2 puntos de restauracion para ejecutar esta operacion." -ForegroundColor Yellow
                    } else {
                        $latest = $restorePoints[-1]
                        $toDelete = $restorePoints[0..($restorePoints.Count - 2)]
                        
                        $latestDate = [System.Management.ManagementDateTimeConverter]::ToDateTime($latest.CreationTime)
                        Write-Host "Punto M S RECIENTE que se CONSERVAR :" -ForegroundColor Green
                        Write-Host " -> ID: $($latest.SequenceNumber) | Fecha: $latestDate | $($latest.Description)" -ForegroundColor White
                        Write-Host ""
                        Write-Host "Se eliminar n los siguientes $($toDelete.Count) punto(s) antiguo(s):" -ForegroundColor Yellow
                        foreach ($item in $toDelete) {
                            $itemDate = [System.Management.ManagementDateTimeConverter]::ToDateTime($item.CreationTime)
                            Write-Host " - ID: $($item.SequenceNumber) | Fecha: $itemDate | $($item.Description)" -ForegroundColor DarkGray
                        }
                        
                        Write-Host ""
                        $confirm = Read-Host "ADVERTENCIA:  Seguro que deseas borrar los puntos antiguos y dejar solo el mas reciente? (S/N)"
                        
                        if ($confirm -eq "S" -or $confirm -eq "s") {
                            Write-Host "Eliminando puntos de restauracion antiguos..." -ForegroundColor Yellow
                            foreach ($item in $toDelete) {
                                Get-CimInstance -Namespace "root\default" -ClassName "SystemRestore" | Where-Object { $_.SequenceNumber -eq $item.SequenceNumber } | Remove-CimInstance -ErrorAction Stop
                                Write-Host " -> Eliminado punto ID $($item.SequenceNumber)" -ForegroundColor DarkGray
                            }
                            Write-Host "[EXITO] Se han eliminado los puntos antiguos. Solo se conserva el punto ID $($latest.SequenceNumber)." -ForegroundColor Green
                        } else {
                            Write-Host "Operacion cancelada." -ForegroundColor Yellow
                        }
                    }
                } catch {
                    Write-Host "Error durante la eliminacion masiva: $_" -ForegroundColor Red
                }
                Write-Host ""
            }
            "4" { break }
        }
        if ($rstOp -ne "4") { Read-Host "Presiona Enter para continuar..." }
    } while ($rstOp -ne "4")
}

function Gestionar-ProgramasAutostart {
    do {
        Mostrar-Banner
        Write-Host " [5.7] GESTION DE PROGRAMAS EN AUTOSTART" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Listar programas en Autostart" -ForegroundColor White
        Write-Host "     -> Consulta las entradas del Registro de Windows y carpetas de Inicio." -ForegroundColor DarkGray
        Write-Host "  2. Eliminar un programa de Autostart" -ForegroundColor Red
        Write-Host "     -> Selecciona y remueve una entrada de inicio automatico." -ForegroundColor DarkGray
        Write-Host "  3. Volver al menu de seguridad" -ForegroundColor Red
        Write-Host ""
        
        $autoOp = Read-Host "Selecciona una opcion (1-3)"
        
        switch ($autoOp) {
            "1" {
                Write-Host ""
                Write-Host "--- [ PROGRAMAS EN AUTOSTART / INICIO DE WINDOWS ] ---" -ForegroundColor Cyan
                Write-Host ""

                $regPaths = @(
                    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
                    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run",
                    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
                )

                $encontrados = $false

                foreach ($path in $regPaths) {
                    if (Test-Path $path) {
                        $properties = Get-ItemProperty -Path $path
                        $itemNames = $properties.PSObject.Properties | Where-Object { $_.Name -notmatch '^PS' }

                        foreach ($item in $itemNames) {
                            if ($item.Value) {
                                Write-Host " [REGISTRO] " -NoNewline -ForegroundColor Yellow
                                Write-Host ("{0,-25}" -f $item.Name) -NoNewline -ForegroundColor White
                                Write-Host " -> $($item.Value)" -ForegroundColor Green
                                $encontrados = $true
                            }
                        }
                    }
                }

                $startupFolders = @(
                    "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup",
                    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
                )

                foreach ($folder in $startupFolders) {
                    if (Test-Path $folder) {
                        $files = Get-ChildItem -Path $folder -File -ErrorAction SilentlyContinue
                        foreach ($file in $files) {
                            Write-Host " [CARPETA]  " -NoNewline -ForegroundColor Cyan
                            Write-Host ("{0,-25}" -f $file.Name) -NoNewline -ForegroundColor White
                            Write-Host " -> $($file.FullName)" -ForegroundColor Green
                            $encontrados = $true
                        }
                    }
                }

                if (-not $encontrados) {
                    Write-Host "No se encontraron aplicaciones o accesos directos configurados en el inicio." -ForegroundColor DarkGray
                }
                Write-Host ""
            }
            "2" {
                Write-Host ""
                Write-Host "--- [ ELIMINAR PROGRAMA DE AUTOSTART ] ---" -ForegroundColor Cyan
                
                $itemsList = @()

                $regPaths = @(
                    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
                    "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Run",
                    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
                )

                foreach ($path in $regPaths) {
                    if (Test-Path $path) {
                        $properties = Get-ItemProperty -Path $path
                        $itemNames = $properties.PSObject.Properties | Where-Object { $_.Name -notmatch '^PS' }
                        foreach ($item in $itemNames) {
                            if ($item.Value) {
                                $itemsList += [PSCustomObject]@{
                                    Tipo  = "Registro"
                                    Nombre = $item.Name
                                    Ruta  = $path
                                    Valor = $item.Value
                                }
                            }
                        }
                    }
                }

                $startupFolders = @(
                    "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup",
                    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
                )

                foreach ($folder in $startupFolders) {
                    if (Test-Path $folder) {
                        $files = Get-ChildItem -Path $folder -File -ErrorAction SilentlyContinue
                        foreach ($file in $files) {
                            $itemsList += [PSCustomObject]@{
                                Tipo  = "Carpeta"
                                Nombre = $file.Name
                                Ruta  = $file.FullName
                                Valor = $file.FullName
                            }
                        }
                    }
                }

                if ($itemsList.Count -eq 0) {
                    Write-Host "No hay elementos en Autostart disponibles para eliminar." -ForegroundColor Yellow
                } else {
                    for ($i = 0; $i -lt $itemsList.Count; $i++) {
                        Write-Host "  [$($i + 1)] [$($itemsList[$i].Tipo)] $($itemsList[$i].Nombre)" -ForegroundColor White
                        Write-Host "      Path/Command: $($itemsList[$i].Valor)" -ForegroundColor DarkGray
                    }
                    Write-Host ""
                    $selection = Read-Host "Selecciona el numero del elemento a ELIMINAR (1-$($itemsList.Count))"

                    if ($selection -match '^\d+$' -and [int]$selection -ge 1 -and [int]$selection -le $itemsList.Count) {
                        $target = $itemsList[[int]$selection - 1]
                        
                        Write-Host ""
                        $confirm = Read-Host "ADVERTENCIA:  Seguro que deseas eliminar '$($target.Nombre)' del autostart? (S/N)"
                        if ($confirm -eq "S" -or $confirm -eq "s") {
                            try {
                                if ($target.Tipo -eq "Registro") {
                                    Remove-ItemProperty -Path $target.Ruta -Name $target.Nombre -ErrorAction Stop
                                } else {
                                    Remove-Item -Path $target.Ruta -Force -ErrorAction Stop
                                }
                                Write-Host ""
                                Write-Host "Elemento '$($target.Nombre)' eliminado con exito del inicio." -ForegroundColor Green
                            } catch {
                                Write-Host ""
                                Write-Host "Error al eliminar el elemento: $_" -ForegroundColor Red
                            }
                        } else {
                            Write-Host "Operacion cancelada." -ForegroundColor Yellow
                        }
                    } else {
                        Write-Host "Seleccion no valida." -ForegroundColor Red
                    }
                }
            }
            "3" { break }
        }
        if ($autoOp -ne "3") { Read-Host "Presiona Enter para continuar..." }
    } while ($autoOp -ne "3")
}

function Gestionar-UsuariosWindows {
    do {
        Mostrar-Banner
        Write-Host " [5.4] GESTION Y AUDITORIA DE USUARIOS LOCALES" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Listar todos los usuarios" -ForegroundColor White
        Write-Host "     -> Muestra nombre, SID, si esta bloqueada/deshabilitada o requiere contrase a." -ForegroundColor DarkGray
        Write-Host "  2. Detalles e historial de inicios de sesion" -ForegroundColor White
        Write-Host "     -> Selecciona un usuario de la lista y consulta sus eventos de logon 4624." -ForegroundColor DarkGray
        Write-Host "  3. Restablecer contrase a de un usuario local" -ForegroundColor Yellow
        Write-Host "     -> Selecciona un usuario de la lista y asignale una nueva clave." -ForegroundColor DarkGray
        Write-Host "  4. Eliminar un perfil de usuario local" -ForegroundColor Red
        Write-Host "     -> Selecciona un usuario de la lista para removerlo del sistema." -ForegroundColor DarkGray
        Write-Host "  5. Volver al menu de seguridad" -ForegroundColor Red
        Write-Host ""
        
        $userOp = Read-Host "Selecciona una opcion (1-5)"
        
        switch ($userOp) {
            "1" {
                Write-Host ""
                Write-Host "--- [ CUENTAS DE USUARIO EN EL SISTEMA ] ---" -ForegroundColor Cyan
                Get-CimInstance -ClassName Win32_UserAccount -Filter "LocalAccount=TRUE" | 
                    Select-Object Name, FullName, Disabled, Lockout, PasswordRequired, SID | 
                    Format-Table -AutoSize
            }
            "2" {
                Write-Host ""
                Write-Host "--- [ SELECCIONAR USUARIO PARA AUDITORIA ] ---" -ForegroundColor Cyan
                $localUsers = @(Get-CimInstance -ClassName Win32_UserAccount -Filter "LocalAccount=TRUE")
                
                if (-not $localUsers) {
                    Write-Host "No se encontraron usuarios locales en el sistema." -ForegroundColor Yellow
                } else {
                    for ($i = 0; $i -lt $localUsers.Count; $i++) {
                        Write-Host "  [$($i + 1)] $($localUsers[$i].Name) $(if($localUsers[$i].Disabled){'(Deshabilitado)'})" -ForegroundColor White
                    }
                    Write-Host ""
                    $selection = Read-Host "Selecciona el numero del usuario (1-$($localUsers.Count))"
                    
                    if ($selection -match '^\d+$' -and [int]$selection -ge 1 -and [int]$selection -le $localUsers.Count) {
                        $account = $localUsers[[int]$selection - 1]
                        $username = $account.Name
                        
                        Write-Host ""
                        Write-Host "--- [ PROPIEDADES GENERALES: $username ] ---" -ForegroundColor Cyan
                        Write-Host " Nombre completo:       $($account.FullName)" -ForegroundColor White
                        Write-Host " Estado de la cuenta:   $(if($account.Disabled){'DESHABILITADA'}else{'ACTIVA'})" -ForegroundColor $(if($account.Disabled){'Red'}else{'Green'})
                        Write-Host " Bloqueada (Lockout):   $($account.Lockout)" -ForegroundColor White
                        Write-Host " Requiere contrase a:   $($account.PasswordRequired)" -ForegroundColor White
                        Write-Host " ID de Seguridad (SID): $($account.SID)" -ForegroundColor DarkGray
                        Write-Host ""
                        
                        Write-Host "--- [ HISTORIAL DE INICIOS DE SESION (Ultimos eventos ID 4624) ] ---" -ForegroundColor Yellow
                        try {
                            $logons = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4624} -ErrorAction Stop | 
                                Where-Object { $_.Properties[5].Value -eq $username } | 
                                Select-Object -First 10
                            
                            if ($logons) {
                                foreach ($log in $logons) {
                                    Write-Host " Fecha/Hora: $($log.TimeCreated) | LogonType: $($log.Properties[8].Value) | IP Origen: $($log.Properties[18].Value)" -ForegroundColor Green
                                }
                                Write-Host " Total de inicios de sesion registrados en este lote: $($logons.Count)" -ForegroundColor White
                            } else {
                                Write-Host "No se encontraron registros de inicio de sesion recientes para '$username'." -ForegroundColor DarkGray
                            }
                        } catch {
                            Write-Host "No se pudo consultar el registro de auditoria de seguridad o la auditoria de inicios de sesion esta desactivada." -ForegroundColor Red
                        }
                    } else {
                        Write-Host "Seleccion no valida." -ForegroundColor Red
                    }
                }
            }
            "3" {
                Write-Host ""
                Write-Host "--- [ RESTABLECER CONTRASE A DE USUARIO LOCAL ] ---" -ForegroundColor Cyan
                $localUsers = @(Get-LocalUser)
                
                if (-not $localUsers) {
                    Write-Host "No se encontraron usuarios locales." -ForegroundColor Yellow
                } else {
                    for ($i = 0; $i -lt $localUsers.Count; $i++) {
                        Write-Host "  [$($i + 1)] $($localUsers[$i].Name)" -ForegroundColor White
                    }
                    Write-Host ""
                    $selection = Read-Host "Selecciona el numero del usuario (1-$($localUsers.Count))"
                    
                    if ($selection -match '^\d+$' -and [int]$selection -ge 1 -and [int]$selection -le $localUsers.Count) {
                        $username = $localUsers[[int]$selection - 1].Name
                        Write-Host ""
                        Write-Host "Usuario seleccionado: $username" -ForegroundColor Yellow
                        $plainPassword = Read-Host "Escribe la NUEVA contrase a" -AsSecureString
                        
                        try {
                            Set-LocalUser -Name $username -Password $plainPassword -ErrorAction Stop
                            Write-Host ""
                            Write-Host "La contrase a del usuario '$username' se ha actualizado correctamente." -ForegroundColor Green
                        } catch {
                            Write-Host ""
                            Write-Host "Error al cambiar la contrase a: $_" -ForegroundColor Red
                        }
                    } else {
                        Write-Host "Seleccion no valida." -ForegroundColor Red
                    }
                }
            }
            "4" {
                Write-Host ""
                Write-Host "--- [ ELIMINAR USUARIO LOCAL ] ---" -ForegroundColor Red
                $localUsers = @(Get-LocalUser)
                
                if (-not $localUsers) {
                    Write-Host "No se encontraron usuarios locales." -ForegroundColor Yellow
                } else {
                    for ($i = 0; $i -lt $localUsers.Count; $i++) {
                        Write-Host "  [$($i + 1)] $($localUsers[$i].Name)" -ForegroundColor White
                    }
                    Write-Host ""
                    $selection = Read-Host "Selecciona el numero del usuario a ELIMINAR (1-$($localUsers.Count))"
                    
                    if ($selection -match '^\d+$' -and [int]$selection -ge 1 -and [int]$selection -le $localUsers.Count) {
                        $delUser = $localUsers[[int]$selection - 1].Name
                        
                        if ($delUser -eq $env:USERNAME) {
                            Write-Host ""
                            Write-Host "ERROR: No puedes eliminar el usuario con el que estas ejecutando la sesion actual." -ForegroundColor Red
                        } else {
                            Write-Host ""
                            $confirm = Read-Host "ADVERTENCIA:  Seguro que deseas eliminar definitivamente a '$delUser'? (S/N)"
                            if ($confirm -eq "S" -or $confirm -eq "s") {
                                try {
                                    Remove-LocalUser -Name $delUser -ErrorAction Stop
                                    Write-Host "El usuario '$delUser' ha sido eliminado con exito." -ForegroundColor Green
                                } catch {
                                    Write-Host "Error al eliminar el usuario: $_" -ForegroundColor Red
                                }
                            } else {
                                Write-Host "Operacion cancelada." -ForegroundColor Yellow
                            }
                        }
                    } else {
                        Write-Host "Seleccion no valida." -ForegroundColor Red
                    }
                }
            }
            "5" { break }
        }
        if ($userOp -ne "5") { Read-Host "Presiona Enter para continuar..." }
    } while ($userOp -ne "5")
}

function Reiniciar-ServicioSpooler {
    Write-Host ""
    Write-Host "--- [ REINICIO Y LIMPIEZA DE COLA DE IMPRESION ] ---" -ForegroundColor Cyan
    try {
        Write-Host "Deteniendo servicio Spooler..." -ForegroundColor Yellow
        Stop-Service -Name "Spooler" -Force -ErrorAction Stop
        
        Write-Host "Limpiando archivos en cola de impresion..." -ForegroundColor Yellow
        Remove-Item -Path "$env:SystemRoot\System32\spool\PRINTERS\*" -Force -Recurse -ErrorAction SilentlyContinue
        
        Write-Host "Iniciando servicio Spooler..." -ForegroundColor Yellow
        Start-Service -Name "Spooler" -ErrorAction Stop
        
        Write-Host ""
        Write-Host "[EXITO] Cola de impresion limpia y servicio reiniciado correctamente." -ForegroundColor Green
    } catch {
        Write-Host ""
        Write-Host "[ERROR] No se pudo reiniciar el servicio Spooler: $_" -ForegroundColor Red
    }
    Write-Host ""
}

# =========================================================
# NUEVAS FUNCIONES INTEGRADAS (v15.0)
# =========================================================

function Listar-SoftwareInstalado {
    Write-Host ""
    Write-Host "--- [ INVENTARIO DE SOFTWARE INSTALADO ] ---" -ForegroundColor Cyan
    Write-Host ""

    $paths = @(
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )

    $apps = Get-ItemProperty -Path $paths | 
        Where-Object { $_.DisplayName -and $_.DisplayName -notmatch 'KB\d{7}' } | 
        Select-Object DisplayName, DisplayVersion, Publisher | 
        Sort-Object DisplayName -Unique

    if ($apps) {
        $apps | Format-Table -AutoSize
        Write-Host "Total de aplicaciones detectadas: $($apps.Count)" -ForegroundColor Green
    } else {
        Write-Host "No se encontraron aplicaciones registradas." -ForegroundColor Yellow
    }
    Write-Host ""
}

function Ver-ConexionesActivasAvanzado {
    Write-Host ""
    Write-Host "--- [ CONEXIONES DE RED Y PROCESOS ASOCIADOS ] ---" -ForegroundColor Cyan
    Write-Host ""

    $connections = Get-NetTCPConnection -State Established -ErrorAction SilentlyContinue

    foreach ($conn in $connections) {
        $process = Get-Process -Id $conn.OwningProcess -ErrorAction SilentlyContinue
        
        Write-Host " [PROCESO] " -NoNewline -ForegroundColor Yellow
        Write-Host ("{0,-15}" -f $process.Name) -NoNewline -ForegroundColor White
        Write-Host " (PID: $($conn.OwningProcess))" -NoNewline -ForegroundColor DarkGray
        Write-Host " --> Local: $($conn.LocalAddress):$($conn.LocalPort)" -NoNewline -ForegroundColor Cyan
        Write-Host " Remoto: $($conn.RemoteAddress):$($conn.RemotePort)" -ForegroundColor Green
    }
    Write-Host ""
}

function Backup-PerfilUsuarioRapido {
    Write-Host ""
    Write-Host "--- [ BACKUP RAPIDO DE CARPETAS DE USUARIO ] ---" -ForegroundColor Cyan
    
    $dest = Read-Host "Ingresa la ruta completa de destino (ej. D:\Respaldo)"
    if ([string]::IsNullOrWhiteSpace($dest)) { return }

    if (-not (Test-Path $dest)) {
        New-Item -Path $dest -ItemType Directory -Force | Out-Null
    }

    $origenes = @(
        "$env:USERPROFILE\Desktop",
        "$env:USERPROFILE\Documents",
        "$env:USERPROFILE\Downloads"
    )

    foreach ($origen in $origenes) {
        if (Test-Path $origen) {
            $nombreCarpeta = Split-Path $origen -Leaf
            $targetPath = Join-Path $dest $nombreCarpeta
            Write-Host "Copiando $nombreCarpeta..." -ForegroundColor Yellow
            Copy-Item -Path $origen -Destination $targetPath -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
    
    Write-Host ""
    Write-Host "[EXITO] Respaldo finalizado en: $dest" -ForegroundColor Green
    Write-Host ""
}

function Gestionar-ServiciosRapidos {
    # =========================================================
    # GESTION DE SERVICIOS - MENU INTEGRADO
    # =========================================================

    # Heuristica de alerta. Coincidir aqui NO significa que sea malware.
    $dangerPatterns = @(
        'xmrig', 'minergate', 'miner', 'cryptominer', 'coinminer', 'monero',
        'tor', 'ngrok', 'anydesk', 'teamviewer', 'rustdesk',
        'remoteaccess', 'remotesupport',
        'hacker', 'backdoor', 'keylogger', 'rat', 'payload',
        'metasploit', 'cobalt', 'meterpreter',
        'ncat', 'netcat', 'psexec', 'mimikatz'
    )

    function Test-PotentiallyDangerousService {
        param([object]$Service)

        $textToCheck = @(
            $Service.Name
            $Service.DisplayName
            $Service.PathName
        ) -join ' '

        foreach ($pattern in $dangerPatterns) {
            if ($textToCheck -match [regex]::Escape($pattern)) {
                return $true
            }
        }
        return $false
    }

    function Test-WindowsService {
        param([object]$Service)

        $path = [string]$Service.PathName
        $display = [string]$Service.DisplayName

        if ($display -match '(?i)\bMicrosoft\b') {
            return $true
        }

        if ($path -match '(?i)(\\Windows\\System32\\|\\Windows\\SysWOW64\\|\\Windows\\servicing\\)') {
            return $true
        }

        if ($path -match '(?i)"?C:\\Windows\\') {
            return $true
        }

        return $false
    }

    function Get-ServiceColorInfo {
        param([object]$Service)

        $isDangerous = Test-PotentiallyDangerousService -Service $Service
        $isWindows = Test-WindowsService -Service $Service

        if ($isDangerous) {
            return [PSCustomObject]@{
                Filter = 'RED'
                Color  = 'Red'
                Tag    = '[PELIGRO / REVISAR]'
            }
        }
        elseif (-not $isWindows) {
            return [PSCustomObject]@{
                Filter = 'YELLOW'
                Color  = 'Yellow'
                Tag    = '[TERCEROS]'
            }
        }
        else {
            return [PSCustomObject]@{
                Filter = 'WHITE'
                Color  = 'White'
                Tag    = '[WINDOWS / MICROSOFT]'
            }
        }
    }

    function Get-ServiceCollection {
        Write-Host "Analizando servicios..." -ForegroundColor Cyan
        return @(Get-CimInstance Win32_Service | Sort-Object DisplayName)
    }

    function Show-ServiceLegend {
        Write-Host ""
        Write-Host "LEYENDA DE COLORES" -ForegroundColor Cyan
        Write-Host "  BLANCO  = Servicio de Windows / Microsoft" -ForegroundColor White
        Write-Host "  AMARILLO = Servicio de terceros / no propio de Windows" -ForegroundColor Yellow
        Write-Host "  ROJO    = Coincide con indicadores potencialmente peligrosos" -ForegroundColor Red
        Write-Host ""
        Write-Host "Nota: ROJO es una alerta heuristica y NO confirma que sea malware." -ForegroundColor DarkGray
        Write-Host "      Servicios legitimos como herramientas de acceso remoto pueden aparecer alli." -ForegroundColor DarkGray
        Write-Host ""
    }

    function Show-ServiceFilterMenu {
        param([object[]]$Services)

        while ($true) {
            Mostrar-Banner

            Write-Host " [6.5] GESTION AVANZADA DE SERVICIOS DE WINDOWS" -ForegroundColor Yellow
            Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
            Show-ServiceLegend

            $whiteCount = @($Services | Where-Object {
                (Get-ServiceColorInfo $_).Filter -eq 'WHITE'
            }).Count

            $yellowCount = @($Services | Where-Object {
                (Get-ServiceColorInfo $_).Filter -eq 'YELLOW'
            }).Count

            $redCount = @($Services | Where-Object {
                (Get-ServiceColorInfo $_).Filter -eq 'RED'
            }).Count

            Write-Host " RESUMEN:" -ForegroundColor Cyan
            Write-Host "   Total de servicios : $($Services.Count)" -ForegroundColor White
            Write-Host "   Blancos            : $whiteCount" -ForegroundColor White
            Write-Host "   Amarillos          : $yellowCount" -ForegroundColor Yellow
            Write-Host "   Rojos              : $redCount" -ForegroundColor Red
            Write-Host ""

            Write-Host "  1. Listar TODOS los servicios" -ForegroundColor White
            Write-Host "  2. Listar SOLO BLANCOS - Windows / Microsoft" -ForegroundColor White
            Write-Host "  3. Listar SOLO AMARILLOS - Servicios de terceros" -ForegroundColor Yellow
            Write-Host "  4. Listar SOLO ROJOS - Potencialmente peligrosos" -ForegroundColor Red
            Write-Host "  5. Actualizar / volver a analizar servicios" -ForegroundColor Cyan
            Write-Host "  0. Volver al menu de mantenimiento" -ForegroundColor Red
            Write-Host ""

            $filterOp = Read-Host "Selecciona una opcion (0-5)"

            switch ($filterOp) {
                '1' {
                    Show-FilteredServiceList -Services $Services -Filter 'ALL'
                }
                '2' {
                    Show-FilteredServiceList -Services $Services -Filter 'WHITE'
                }
                '3' {
                    Show-FilteredServiceList -Services $Services -Filter 'YELLOW'
                }
                '4' {
                    Show-FilteredServiceList -Services $Services -Filter 'RED'
                }
                '5' {
                    $Services = Get-ServiceCollection
                }
                '0' {
                    return
                }
                default {
                    Write-Host "Opcion no valida." -ForegroundColor Red
                    Start-Sleep -Seconds 1
                }
            }
        }
    }

    function Show-FilteredServiceList {
        param(
            [object[]]$Services,
            [ValidateSet('ALL','WHITE','YELLOW','RED')]
            [string]$Filter
        )

        if ($Filter -eq 'ALL') {
            $filteredServices = @($Services)
        }
        else {
            $filteredServices = @($Services | Where-Object {
                (Get-ServiceColorInfo $_).Filter -eq $Filter
            })
        }

        if (-not $filteredServices -or $filteredServices.Count -eq 0) {
            Mostrar-Banner
            Show-ServiceLegend
            Write-Host "No se encontraron servicios para este filtro." -ForegroundColor Yellow
            Pause
            return
        }

        while ($true) {
            Mostrar-Banner

            $filterTitle = switch ($Filter) {
                'ALL'    { 'TODOS LOS SERVICIOS' }
                'WHITE'  { 'SERVICIOS BLANCOS - WINDOWS / MICROSOFT' }
                'YELLOW' { 'SERVICIOS AMARILLOS - TERCEROS' }
                'RED'    { 'SERVICIOS ROJOS - POTENCIALMENTE PELIGROSOS' }
            }

            Write-Host " [LISTADO] $filterTitle" -ForegroundColor Yellow
            Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
            Show-ServiceLegend

            $serviceMap = @{}
            $index = 1

            foreach ($service in $filteredServices) {
                $info = Get-ServiceColorInfo -Service $service
                $statusText = if ($service.State -eq 'Running') { 'EJECUTANDO' } else { 'DETENIDO' }

                $displayName = [string]$service.DisplayName
                if ($displayName.Length -gt 42) {
                    $displayName = $displayName.Substring(0, 39) + '...'
                }

                $serviceName = [string]$service.Name
                if ($serviceName.Length -gt 30) {
                    $serviceName = $serviceName.Substring(0, 27) + '...'
                }

                $line = "[{0,3}] {1,-30} | {2,-10} | {3,-42}" -f `
                    $index, $serviceName, $statusText, $displayName

                Write-Host $line -ForegroundColor $info.Color
                Write-Host ("      {0}" -f $info.Tag) -ForegroundColor $info.Color

                $serviceMap[$index] = $service
                $index++
            }

            Write-Host ""
            Write-Host "Seleccione el NUMERO del servicio para gestionarlo." -ForegroundColor Cyan
            Write-Host "R = volver al filtro anterior" -ForegroundColor DarkGray
            Write-Host "0 = volver al menu de servicios" -ForegroundColor Gray
            Write-Host ""

            $selection = Read-Host "Seleccion"

            if ($selection -eq '0' -or $selection -eq 'R' -or $selection -eq 'r') {
                return
            }

            $selectedNumber = 0
            if (-not [int]::TryParse($selection, [ref]$selectedNumber) -or
                -not $serviceMap.ContainsKey($selectedNumber)) {

                Write-Host "Seleccion invalida." -ForegroundColor Red
                Pause
                continue
            }

            $service = $serviceMap[$selectedNumber]
            Manage-SelectedService -Service $service

            # Actualizar el estado del servicio al volver
            $updated = Get-CimInstance Win32_Service -Filter "Name='$($service.Name.Replace("'", "''"))'"
            if ($updated) {
                for ($i = 0; $i -lt $filteredServices.Count; $i++) {
                    if ($filteredServices[$i].Name -eq $updated.Name) {
                        $filteredServices[$i] = $updated
                        break
                    }
                }
            }
        }
    }

    function Manage-SelectedService {
        param([object]$Service)

        while ($true) {
            $info = Get-ServiceColorInfo -Service $Service

            Mostrar-Banner
            Write-Host " [SERVICIO SELECCIONADO]" -ForegroundColor Cyan
            Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray

            Show-ServiceLegend

            Write-Host "Nombre interno : $($Service.Name)" -ForegroundColor White
            Write-Host "Descripcion    : $($Service.DisplayName)" -ForegroundColor White
            Write-Host "Estado         : $($Service.State)" -ForegroundColor $(if ($Service.State -eq 'Running') { 'Green' } else { 'Red' })
            Write-Host "Inicio         : $($Service.StartMode)" -ForegroundColor White
            Write-Host "Cuenta         : $($Service.StartName)" -ForegroundColor White
            Write-Host "Ejecutable     : $($Service.PathName)" -ForegroundColor DarkGray
            Write-Host "Clasificacion  : $($info.Tag)" -ForegroundColor $info.Color

            if ($info.Filter -eq 'RED') {
                Write-Host ""
                Write-Host "ATENCION: el servicio coincide con indicadores potencialmente peligrosos." -ForegroundColor Red
                Write-Host "Esto NO confirma que sea malware; revise el ejecutable y su origen." -ForegroundColor Yellow
            }

            Write-Host ""
            Write-Host "  1. Iniciar servicio" -ForegroundColor Green
            Write-Host "  2. Detener servicio" -ForegroundColor Yellow
            Write-Host "  3. Deshabilitar servicio" -ForegroundColor Yellow
            Write-Host "  4. Habilitar / Automatico" -ForegroundColor Green
            Write-Host "  5. Reiniciar servicio" -ForegroundColor Cyan
            Write-Host "  6. Eliminar servicio" -ForegroundColor Red
            Write-Host "  7. Actualizar estado" -ForegroundColor White
            Write-Host "  0. Volver a la lista" -ForegroundColor Gray
            Write-Host ""

            $action = Read-Host "Accion"

            if ($action -eq '0') {
                return
            }

            try {
                switch ($action) {
                    '1' {
                        Start-Service -Name $Service.Name -ErrorAction Stop
                        Write-Host "Servicio iniciado correctamente." -ForegroundColor Green
                    }
                    '2' {
                        Write-Host ""
                        $confirm = Read-Host "Confirma detener '$($Service.DisplayName)'? (S/N)"
                        if ($confirm -match '^[Ss]$') {
                            Stop-Service -Name $Service.Name -Force -ErrorAction Stop
                            Write-Host "Servicio detenido correctamente." -ForegroundColor Green
                        }
                        else {
                            Write-Host "Operacion cancelada." -ForegroundColor Yellow
                        }
                    }
                    '3' {
                        Write-Host ""
                        $confirm = Read-Host "Confirma DESHABILITAR '$($Service.DisplayName)'? (S/N)"
                        if ($confirm -match '^[Ss]$') {
                            Set-Service -Name $Service.Name -StartupType Disabled -ErrorAction Stop
                            Write-Host "Servicio deshabilitado correctamente." -ForegroundColor Green
                        }
                        else {
                            Write-Host "Operacion cancelada." -ForegroundColor Yellow
                        }
                    }
                    '4' {
                        Set-Service -Name $Service.Name -StartupType Automatic -ErrorAction Stop
                        Write-Host "Tipo de inicio configurado como Automatico." -ForegroundColor Green
                    }
                    '5' {
                        Restart-Service -Name $Service.Name -Force -ErrorAction Stop
                        Write-Host "Servicio reiniciado correctamente." -ForegroundColor Green
                    }
                    '6' {
                        Write-Host ""
                        Write-Host "ADVERTENCIA: eliminar un servicio es una accion permanente." -ForegroundColor Red
                        $confirm = Read-Host "Escriba ELIMINAR para confirmar"

                        if ($confirm -eq 'ELIMINAR') {
                            if ($Service.State -eq 'Running') {
                                Write-Host "Deteniendo servicio..." -ForegroundColor Yellow
                                Stop-Service -Name $Service.Name -Force -ErrorAction Stop
                                Start-Sleep -Seconds 1
                            }

                            $result = & sc.exe delete $Service.Name 2>&1

                            if ($LASTEXITCODE -eq 0) {
                                Write-Host "Servicio eliminado correctamente." -ForegroundColor Green
                                Pause
                                return
                            }
                            else {
                                Write-Host "No se pudo eliminar el servicio." -ForegroundColor Red
                                Write-Host ($result -join "`n") -ForegroundColor Red
                            }
                        }
                        else {
                            Write-Host "Operacion cancelada." -ForegroundColor Yellow
                        }
                    }
                    '7' {
                        $Service = Get-CimInstance Win32_Service -Filter "Name='$($Service.Name.Replace("'", "''"))'"
                        Write-Host "Estado actualizado." -ForegroundColor Green
                    }
                    default {
                        Write-Host "Operacion no valida." -ForegroundColor Red
                    }
                }
            }
            catch {
                Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
            }

            Write-Host ""
            Pause
        }
    }

    $services = Get-ServiceCollection

    if (-not $services) {
        Write-Host "No se encontraron servicios." -ForegroundColor Yellow
        Pause
        return
    }

    Show-ServiceFilterMenu -Services $services
}

function Consultar-RegistrosDNSAvanzado {
    Write-Host ""
    Write-Host "--- [ CONSULTA DE REGISTROS DNS ESPECIFICOS ] ---" -ForegroundColor Cyan
    $domain = Read-Host "Ingresa el dominio a auditar (ej. ejemplo.com)"
    if ([string]::IsNullOrWhiteSpace($domain)) { return }

    Write-Host ""
    Write-Host "Consultando registros para $domain..." -ForegroundColor Yellow
    
    foreach ($type in @("A", "AAAA", "MX", "TXT", "NS")) {
        Write-Host " -> Registros $type :" -ForegroundColor White
        try {
            $records = Resolve-DnsName -Name $domain -Type $type -ErrorAction SilentlyContinue
            if ($records) {
                foreach ($rec in $records) {
                    $val = if ($rec.IPAddress) { $rec.IPAddress } elseif ($rec.NameExchange) { "$($rec.NameExchange) (Prioridad: $($rec.Preference))" } elseif ($rec.String) { $rec.String } else { $rec.IP4Address }
                    Write-Host "    * $val" -ForegroundColor Green
                }
            } else {
                Write-Host "    [Sin registros o bloqueado]" -ForegroundColor DarkGray
            }
        } catch {
            Write-Host "    [No disponible]" -ForegroundColor DarkGray
        }
    }
    Write-Host ""
}

function Buscar-SubdominiosComunes {
    Write-Host ""
    Write-Host "--- [ ESCANEO RAPIDO DE SUBDOMINIOS ] ---" -ForegroundColor Cyan
    $domain = Read-Host "Ingresa el dominio base (ej. empresa.com)"
    if ([string]::IsNullOrWhiteSpace($domain)) { return }

    $subdomains = @("www", "mail", "ftp", "portal", "admin", "test", "vpn", "remote", "api", "shop", "blog", "cloud", "dns", "support")
    Write-Host ""
    Write-Host "Buscando subdominios activos para $domain..." -ForegroundColor Yellow
    Write-Host ""

    foreach ($sub in $subdomains) {
        $target = "$sub.$domain"
        try {
            $result = Resolve-DnsName -Name $target -Type A -ErrorAction Stop
            if ($result) {
                Write-Host " [ENCONTRADO] " -NoNewline -ForegroundColor Green
                Write-Host "$target" -NoNewline -ForegroundColor White
                Write-Host " -> IP: $($result.IPAddress)" -ForegroundColor DarkGray
            }
        } catch {
            # Subdominio no resuelve
        }
    }
    Write-Host ""
}

function Analizar-CabecerasWeb {
    Write-Host ""
    Write-Host "--- [ AUDITORIA DE CABECERAS HTTP Y TECNOLOGIAS ] ---" -ForegroundColor Cyan
    $url = Read-Host "Ingresa la URL completa (ej. https://miempresa.com)"
    if ([string]::IsNullOrWhiteSpace($url)) { return }

    Write-Host ""
    Write-Host "Analizando cabeceras de respuesta para $url..." -ForegroundColor Yellow
    try {
        $response = Invoke-WebRequest -Uri $url -Method Head -ErrorAction Stop
        Write-Host " [EXITO] Estado HTTP: $($response.StatusCode) $($response.StatusDescription)" -ForegroundColor Green
        Write-Host ""
        Write-Host " Cabeceras de Seguridad / Servidor detectadas:" -ForegroundColor White
        
        foreach ($header in $response.Headers.Keys) {
            if ($header -match "Server|X-|Strict-|Content-Security|Authorization") {
                Write-Host "  -> $header : " -NoNewline -ForegroundColor Cyan
                Write-Host "$($response.Headers[$header])" -ForegroundColor White
            }
        }
    } catch {
        Write-Host " [ERROR] No se pudo conectar o la URL no responde a peticiones HEAD: $_" -ForegroundColor Red
    }
    Write-Host ""
}

function Inspeccionar-PerfilesNavegadores {
    Write-Host ""
    Write-Host "--- [ INSPECCION DE PERFILES Y ARTEFACTOS DE NAVEGADORES ] ---" -ForegroundColor Cyan
    Write-Host ""

    $paths = @{
        "Google Chrome" = "$env:LOCALAPPDATA\Google\Chrome\User Data"
        "Microsoft Edge" = "$env:LOCALAPPDATA\Microsoft\Edge\User Data"
        "Mozilla Firefox" = "$env:APPDATA\Mozilla\Firefox\Profiles"
    }

    foreach ($browser in $paths.Keys) {
        $path = $paths[$browser]
        Write-Host " Browser: $browser" -ForegroundColor Yellow
        if (Test-Path $path) {
            Write-Host "  -> Directorio base encontrado: $path" -ForegroundColor Green
            $items = Get-ChildItem -Path $path -ErrorAction SilentlyContinue | Select-Object -First 5
            foreach ($item in $items) {
                Write-Host "     * Perfil/Elemento: $($item.Name)" -ForegroundColor DarkGray
            }
        } else {
            Write-Host "  -> No se encontraron datos instalados para este navegador." -ForegroundColor DarkGray
        }
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
    }
    Write-Host ""
}

# =========================================================
# MENUS PRINCIPALES
# =========================================================
function Menu-Ransomware {
    do {
        Mostrar-Banner
        Write-Host " [1] PROTECCION Y RASTREO ANTI-RANSOMWARE" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Crear archivo Canario (Honeypot de prueba)" -ForegroundColor White
        Write-Host "     -> Genera un archivo se uelo en el Escritorio para detectar cifrados no autorizados." -ForegroundColor DarkGray
        Write-Host "  2. Escaneo basico de extensiones sospechosas" -ForegroundColor White
        Write-Host "     -> Busca archivos con extensiones tipicas de ransomware (.locked, .crypto, .enc)." -ForegroundColor DarkGray
        Write-Host "  3. Volver al menu principal" -ForegroundColor Red
        Write-Host ""
        $op = Read-Host "Selecciona una opcion (1-3)"
        switch ($op) {
            "1" { New-Item -Path "$env:USERPROFILE\Desktop\CANARY_HONEYPOT.txt" -ItemType File -Value "DO NOT MODIFY - SECURITY CANARY FILE" -Force; Write-Host "Canario creado en el Escritorio." -ForegroundColor Green }
            "2" { Get-ChildItem -Path "$env:USERPROFILE" -Recurse -Include *.locked,*.crypto,*.enc -ErrorAction SilentlyContinue | Format-Table -AutoSize }
            "3" { break }
        }
        if ($op -ne "3") { Read-Host "Presiona Enter para continuar..." }
    } while ($op -ne "3")
}

function Menu-Hardware {
    do {
        Mostrar-Banner
        Write-Host " [2] DIAGNOSTICO Y SALUD DE HARDWARE" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Ver estado SMART y salud de discos" -ForegroundColor White
        Write-Host "     -> Consulta el estado operativo y de salud general de las unidades fisicas de almacenamiento." -ForegroundColor DarkGray
        Write-Host "  2. Generar informe de salud de bateria" -ForegroundColor White
        Write-Host "     -> Crea un reporte HTML detallado sobre la capacidad y ciclos de la bateria en el Escritorio." -ForegroundColor DarkGray
        Write-Host "  3. Informacion y uso de memoria RAM" -ForegroundColor White
        Write-Host "     -> Lista los modulos de RAM instalados, su velocidad, fabricante y ubicacion." -ForegroundColor DarkGray
        Write-Host "  4. Volver al menu principal" -ForegroundColor Red
        Write-Host ""
        $op = Read-Host "Selecciona una opcion (1-4)"
        switch ($op) {
            "1" { Get-PhysicalDisk | Select-Object DeviceId, FriendlyName, OperationalStatus, HealthStatus | Format-Table -AutoSize }
            "2" { powercfg /batteryreport /output "$env:USERPROFILE\Desktop\battery_report.html"; Write-Host "Reporte generado en el Escritorio." -ForegroundColor Green }
            "3" { Get-CimInstance Win32_PhysicalMemory | Select-Object Capacity, Speed, Manufacturer, DeviceLocator | Format-Table -AutoSize }
            "4" { break }
        }
        if ($op -ne "4") { Read-Host "Presiona Enter para continuar..." }
    } while ($op -ne "4")
}

function Menu-Reparacion {
    do {
        Mostrar-Banner
        Write-Host " [3] REPARACION DE WINDOWS Y RESTAURACION" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Ejecutar SFC /Scannow" -ForegroundColor White
        Write-Host "     -> Examina y repara archivos corruptos o da ados del sistema operativo." -ForegroundColor DarkGray
        Write-Host "  2. Reparar imagen de Windows con DISM" -ForegroundColor White
        Write-Host "     -> Repara la imagen de componentes de Windows usando Update como origen." -ForegroundColor DarkGray
        Write-Host "  3. Crear Punto de Restauracion del Sistema" -ForegroundColor White
        Write-Host "     -> Genera una instantanea del sistema para revertir cambios en caso de fallos." -ForegroundColor DarkGray
        Write-Host "  4. Administrar Puntos de Restauracion (Listar/Eliminar)" -ForegroundColor Yellow
        Write-Host "     -> Consulta los puntos de restauracion guardados y borra elementos especificos o antiguos." -ForegroundColor DarkGray
        Write-Host "  5. Volver al menu principal" -ForegroundColor Red
        Write-Host ""
        $op = Read-Host "Selecciona una opcion (1-5)"
        switch ($op) {
            "1" { sfc /scannow }
            "2" { DISM.exe /Online /Cleanup-Image /RestoreHealth }
            "3" { Checkpoint-Computer -Description "ITToolbox_RestorePoint" -RestorePointType "MODIFY_SETTINGS" }
            "4" { Gestionar-PuntosRestauracion }
            "5" { break }
        }
        if ($op -ne "5" -and $op -ne "4") { Read-Host "Presiona Enter para continuar..." }
    } while ($op -ne "5")
}

function Menu-Red {
    do {
        Mostrar-Banner
        Write-Host " [4] RED Y ESCANER DE PUERTOS" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Ver mi servidor DNS actual" -ForegroundColor White
        Write-Host "     -> Muestra los servidores DNS (IPv4/IPv6) configurados en las interfaces de red activas." -ForegroundColor DarkGray
        Write-Host "  2. Cambiar servidores DNS" -ForegroundColor White
        Write-Host "     -> Permite seleccionar entre proveedores DNS conocidos (Cloudflare, Google, OpenDNS, etc.)." -ForegroundColor DarkGray
        Write-Host "  3. Saber mi direccion IP publica" -ForegroundColor White
        Write-Host "     -> Realiza una peticion externa para obtener y mostrar la direccion IP publica del equipo." -ForegroundColor DarkGray
        Write-Host "  4. Prueba de Latencia (Ping) y Perdida de Paquetes" -ForegroundColor White
        Write-Host "     -> Evalua el tiempo de respuesta en ms y la tasa de paquetes perdidos hacia una IP/host." -ForegroundColor DarkGray
        Write-Host "  5. Medir Velocidad de Internet (Speedtest via CLI)" -ForegroundColor White
        Write-Host "     -> Ejecuta un test de velocidad de descarga midiendo el ancho de banda." -ForegroundColor DarkGray
        Write-Host "  6. Escaneo rapido de puertos criticos (RDP 3389 / SMB 445)" -ForegroundColor White
        Write-Host "     -> Verifica la conectividad y apertura de puertos de administracion y comparticion en un host." -ForegroundColor DarkGray
        Write-Host "  7. Monitor de conexiones activas y procesos asociados" -ForegroundColor White
        Write-Host "     -> Muestra qu  aplicaciones locales mantienen conexiones de red establecidas." -ForegroundColor DarkGray
        Write-Host "  8. Reparar y restablecer pila de red (Flush DNS / Winsock / Release-Renew)" -ForegroundColor Yellow
        Write-Host "     -> Vacia cache DNS, resetea cat logos Winsock y renueva concesion de IP." -ForegroundColor DarkGray
        Write-Host "  9. Volver al menu principal" -ForegroundColor Red
        Write-Host ""
        $op = Read-Host "Selecciona una opcion (1-9)"
        switch ($op) {
            "1" { 
                Ver-ConfiguracionDNS
                Read-Host "Presiona Enter para continuar..."
            }
            "2" { Cambiar-ServidoresDNS }
            "3" { 
                Write-Host ""
                Write-Host "Consultando IP publica..." -ForegroundColor Yellow
                try {
                    $publicIp = (Invoke-RestMethod -Uri "https://api.ipify.org?format=text" -ErrorAction Stop).Trim()
                    Write-Host ""
                    Write-Host " Tu direccion IP publica es: " -NoNewline -ForegroundColor White
                    Write-Host $publicIp -ForegroundColor Green
                    Write-Host ""
                } catch {
                    Write-Host ""
                    Write-Host "Error al obtener la IP publica. Verifica tu conexion a Internet." -ForegroundColor Red
                    Write-Host ""
                }
                Read-Host "Presiona Enter para continuar..."
            }
            "4" {
                Test-LatenciaRed
                Read-Host "Presiona Enter para continuar..."
            }
            "5" {
                Test-VelocidadDescarga
                Read-Host "Presiona Enter para continuar..."
            }
            "6" { 
                $h = Read-Host "IP de destino"
                3389, 445 | ForEach-Object { Test-NetConnection -ComputerName $h -Port $_ }
                Read-Host "Presiona Enter para continuar..."
            }
            "7" {
                Ver-ConexionesActivasAvanzado
                Read-Host "Presiona Enter para continuar..."
            }
            "8" { 
                Reparar-RedRapido
                Read-Host "Presiona Enter para continuar..."
            }
            "9" { break }
        }
    } while ($op -ne "9")
}

function Menu-Seguridad {
    do {
        Mostrar-Banner
        Write-Host " [5] SEGURIDAD, CREDENCIALES Y HASHES" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Ver claves Wi-Fi guardadas en el equipo" -ForegroundColor White
        Write-Host "     -> Muestra las contrase as de las redes Wi-Fi conocidas y exporta un informe al Escritorio." -ForegroundColor DarkGray
        Write-Host "  2. Borrar un perfil de red Wi-Fi especifico" -ForegroundColor White
        Write-Host "     -> Elimina las credenciales guardadas de una red Wi-Fi seleccionada." -ForegroundColor DarkGray
        Write-Host "  3. Borrar TODAS las redes Wi-Fi guardadas (Limpieza masiva)" -ForegroundColor White
        Write-Host "     -> Elimina el historial completo de perfiles y claves Wi-Fi almacenados." -ForegroundColor DarkGray
        Write-Host "  4. Auditoria y Gestion de Usuarios de Windows" -ForegroundColor Yellow
        Write-Host "     -> Permite listar, auditar logons, modificar contrase as y eliminar usuarios locales." -ForegroundColor DarkGray
        Write-Host "  5. Obtener clave de producto Windows (OEM / BIOS)" -ForegroundColor White
        Write-Host "     -> Muestra la licencia original de Windows grabada en la placa madre." -ForegroundColor DarkGray
        Write-Host "  6. Calcular hash SHA-256 de un archivo" -ForegroundColor White
        Write-Host "     -> Genera la huella digital cryptographic SHA-256 para verificar la integridad de un archivo." -ForegroundColor DarkGray
        Write-Host "  7. Administrar programas en Autostart (Listar/Eliminar)" -ForegroundColor White
        Write-Host "     -> Permite consultar o remover aplicaciones configuradas en el inicio de Windows." -ForegroundColor DarkGray
        Write-Host "  8. Iniciar escaneo rapido con Windows Defender" -ForegroundColor White
        Write-Host "     -> Ejecuta un analisis de amenazas de forma rapida en las zonas criticas del sistema." -ForegroundColor DarkGray
        Write-Host "  9. Volver al menu principal" -ForegroundColor Red
        Write-Host ""
        $op = Read-Host "Selecciona una opcion (1-9)"
        switch ($op) {
            "1" { Obtener-ClavesWifi }
            "2" { Eliminar-PerfilWifi }
            "3" { Eliminar-TodasRedesWifi }
            "4" { Gestionar-UsuariosWindows }
            "5" { Obtener-ClaveWindows }
            "6" { 
                $file = Read-Host "Ruta completa del archivo"
                Get-FileHash -Path $file -Algorithm SHA256
            }
            "7" { Gestionar-ProgramasAutostart }
            "8" { Start-MpScan -ScanType QuickScan }
            "9" { break }
        }
        if ($op -ne "9") { Read-Host "Presiona Enter para continuar..." }
    } while ($op -ne "9")
}

function Menu-Mantenimiento {
    do {
        Mostrar-Banner
        Write-Host " [6] MANTENIMIENTO Y OPTIMIZACION" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Limpiar archivos temporales" -ForegroundColor White
        Write-Host "     -> Vacia la carpeta de datos temporales (%TEMP%) del usuario actual." -ForegroundColor DarkGray
        Write-Host "  2. Optimizar y ejecutar TRIM en discos SSD" -ForegroundColor White
        Write-Host "     -> Envia el comando TRIM a la unidad C: para mantener el rendimiento del SSD." -ForegroundColor DarkGray
        Write-Host "  3. Inventario de software instalado" -ForegroundColor White
        Write-Host "     -> Consulta la lista completa de programas y versiones instaladas." -ForegroundColor DarkGray
        Write-Host "  4. Backup rapido de carpetas de usuario (Escritorio, Documentos, Descargas)" -ForegroundColor White
        Write-Host "     -> Respalda de forma automatizada los archivos clave del usuario." -ForegroundColor DarkGray
        Write-Host "  5. Gestionar servicios de Windows (Iniciar, Detener, Deshabilitar, Eliminar)" -ForegroundColor Yellow
        Write-Host "     -> Modifica el estado operativo y de arranque de servicios del sistema." -ForegroundColor DarkGray
        Write-Host "  6. Reiniciar y limpiar cola de impresion (Spooler)" -ForegroundColor Yellow
        Write-Host "     -> Libera trabajos trancados en impresoras y reinicia el servicio." -ForegroundColor DarkGray
        Write-Host "  7. Volver al menu principal" -ForegroundColor Red
        Write-Host ""
        $op = Read-Host "Selecciona una opcion (1-7)"
        switch ($op) {
            "1" { Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue; Write-Host "Archivos temporales limpios." -ForegroundColor Green }
            "2" { Optimize-Volume -DriveLetter C -ReTrim -Verbose }
            "3" { Listar-SoftwareInstalado }
            "4" { Backup-PerfilUsuarioRapido }
            "5" { Gestionar-ServiciosRapidos }
            "6" { Reiniciar-ServicioSpooler }
            "7" { break }
        }
        if ($op -ne "7") { Read-Host "Presiona Enter para continuar..." }
    } while ($op -ne "7")
}

function Menu-Consolas {
    do {
        Mostrar-Banner
        Write-Host " [7] HERRAMIENTAS DE GESTION Y CONSOLAS MSC" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Administrador de Dispositivos (devmgmt.msc)" -ForegroundColor White
        Write-Host "     -> Abre la consola para administrar hardware y controladores instalados." -ForegroundColor DarkGray
        Write-Host "  2. Administrador de Discos (diskmgmt.msc)" -ForegroundColor White
        Write-Host "     -> Abre la consola para gestionar particiones, vol menes y asignaciones de letra." -ForegroundColor DarkGray
        Write-Host "  3. Visor de Eventos de Windows (eventvwr.msc)" -ForegroundColor White
        Write-Host "     -> Abre la consola para revisar registros de sistema, seguridad y aplicaciones." -ForegroundColor DarkGray
        Write-Host "  4. Volver al menu principal" -ForegroundColor Red
        Write-Host ""
        $op = Read-Host "Selecciona una opcion (1-4)"
        switch ($op) {
            "1" { devmgmt.msc }
            "2" { diskmgmt.msc }
            "3" { eventvwr.msc }
            "4" { break }
        }
    } while ($op -ne "4")
}

function Menu-Reinicio {
    do {
        Mostrar-Banner
        Write-Host " [8] OPCIONES DE REINICIO AVANZADO" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Reiniciar directamente en la BIOS/UEFI" -ForegroundColor White
        Write-Host "     -> Reinicia el equipo e ingresa de forma automatica en el men  de firmware UEFI." -ForegroundColor DarkGray
        Write-Host "  2. Reiniciar en Modo Seguro" -ForegroundColor White
        Write-Host "     -> Configura el arranque en Modo Seguro basico y reinicia el sistema de inmediato." -ForegroundColor DarkGray
        Write-Host "  3. Reiniciar en Entorno de Recuperacion (WinRE)" -ForegroundColor White
        Write-Host "     -> Reinicia el equipo dirigiendose al men  de diagnostico y recuperacion de Windows." -ForegroundColor DarkGray
        Write-Host "  4. Volver al menu principal" -ForegroundColor Red
        Write-Host ""
        $op = Read-Host "Selecciona una opcion (1-4)"
        switch ($op) {
            "1" { shutdown /r /fw /t 0 }
            "2" { bcdedit /set {current} safeboot minimal; shutdown /r /t 0 }
            "3" { reagentc /boottore; shutdown /r /t 0 }
            "4" { break }
        }
    } while ($op -ne "4")
}

function Menu-OSINT {
    do {
        Mostrar-Banner
        Write-Host " [9] HERRAMIENTAS OSINT Y RECONOCIMIENTO DE INFRAESTRUCTURA" -ForegroundColor Yellow
        Write-Host " ----------------------------------------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "  1. Consultar registros DNS avanzados (A, AAAA, MX, TXT, NS)" -ForegroundColor White
        Write-Host "     -> Realiza una consulta profunda de los registros de un dominio objetivo." -ForegroundColor DarkGray
        Write-Host "  2. Escaneo rapido de subdominios comunes" -ForegroundColor White
        Write-Host "     -> Busca subdominios habituales (admin, mail, vpn, api, etc.) asociados a un dominio." -ForegroundColor DarkGray
        Write-Host "  3. Auditoria de cabeceras HTTP y tecnologias web" -ForegroundColor White
        Write-Host "     -> Inspecciona los headers de un servidor web para identificar versiones y pol ticas de seguridad." -ForegroundColor DarkGray
        Write-Host "  4. Inspeccionar perfiles y artefactos de navegadores locales" -ForegroundColor White
        Write-Host "     -> Revisa las rutas de Chrome, Edge y Firefox en busca de perfiles activos." -ForegroundColor DarkGray
        Write-Host "  5. Consultar configuracion global DNS local" -ForegroundColor White
        Write-Host "     -> Muestra los sufijos y parametros de la cache y cliente DNS de la maquina." -ForegroundColor DarkGray
        Write-Host "  6. Volver al menu principal" -ForegroundColor Red
        Write-Host ""
        
        $op = Read-Host "Selecciona una opcion (1-6)"
        switch ($op) {
            "1" { Consultar-RegistrosDNSAvanzado }
            "2" { Buscar-SubdominiosComunes }
            "3" { Analizar-CabecerasWeb }
            "4" { Inspeccionar-PerfilesNavegadores }
            "5" { Get-DnsClientGlobalSetting }
            "6" { break }
            default { Write-Host "Opcion no valida." -ForegroundColor Red; Start-Sleep -Seconds 1 }
        }
        if ($op -ne "6") { Read-Host "Presiona Enter para continuar..." }
    } while ($op -ne "6")
}

function Generar-InformeTextual {
    $desktop = [Environment]::GetFolderPath("Desktop")
    $filePath = Join-Path $desktop $(if ($script:ITToolboxLanguage -eq 'EN') { 'ITToolbox_Technical_Report.txt' } elseif ($script:ITToolboxLanguage -eq 'PT') { 'Relatorio_Tecnico_ITToolbox.txt' } else { 'Informe_Tecnico_ITToolbox.txt' })
    Write-Host "Generando informe exhaustivo..." -ForegroundColor Yellow
    
    $report = @"
================================================================================
                    INFORME TECNICO EXHAUSTIVO DE SISTEMA
================================================================================
Fecha: $(Get-Date)
Equipo: $env:COMPUTERNAME
Usuario: $env:USERNAME

--- [INFORMACION DEL SISTEMA OPERATIVO] ---
$(Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, OSArchitecture, LastBootUpTime | Out-String)

--- [CONFIGURACION DE RED E INTERFACES] ---
$(Get-NetIPConfiguration | Out-String)

--- [ESTADO DE DISCOS Y SMART] ---
$(Get-PhysicalDisk | Select-Object DeviceId, FriendlyName, OperationalStatus, HealthStatus | Out-String)

--- [CONEXIONES ACTIVAS Y PUERTOS EN ESCUCHA] ---
$(Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State | Out-String)
"@
    if ($script:ITToolboxLanguage -eq 'EN') {
        $report = $report.Replace('INFORME TECNICO EXHAUSTIVO DE SISTEMA','COMPREHENSIVE SYSTEM TECHNICAL REPORT').Replace('INFORMACION DEL SISTEMA OPERATIVO','OPERATING SYSTEM INFORMATION').Replace('CONFIGURACION DE RED E INTERFACES','NETWORK CONFIGURATION AND INTERFACES').Replace('ESTADO DE DISCOS Y SMART','DISK AND SMART STATUS').Replace('CONEXIONES ACTIVAS Y PUERTOS EN ESCUCHA','ACTIVE CONNECTIONS AND LISTENING PORTS')
    } elseif ($script:ITToolboxLanguage -eq 'PT') {
        $report = $report.Replace('INFORME TECNICO EXHAUSTIVO DE SISTEMA','RELATORIO TECNICO COMPLETO DO SISTEMA').Replace('INFORMACION DEL SISTEMA OPERATIVO','INFORMACOES DO SISTEMA OPERACIONAL').Replace('CONFIGURACION DE RED E INTERFACES','CONFIGURACAO DE REDE E INTERFACES').Replace('ESTADO DE DISCOS Y SMART','ESTADO DOS DISCOS E SMART').Replace('CONEXIONES ACTIVAS Y PUERTOS EN ESCUCHA','CONEXOES ATIVAS E PORTAS EM ESCUTA')
    }
    $report | Out-File -FilePath $filePath -Encoding utf8
    Write-Host "Informe generado en: $filePath" -ForegroundColor Green
    Read-Host "Presiona Enter para continuar..."
}

# =========================================================
# BUCLE DEL MENU PRINCIPAL
# =========================================================
do {
    Mostrar-Banner
    Write-Host "   [1]  PROTECCION Y RASTREO ANTI-RANSOMWARE" -ForegroundColor White
    Write-Host "        -> Herramientas de honeypot y deteccion por firmas sospechosas." -ForegroundColor DarkGray
    Write-Host "   [2]  DIAGNOSTICO Y SALUD DE HARDWARE" -ForegroundColor White
    Write-Host "        -> Analisis SMART de discos, bateria y estado de la memoria RAM." -ForegroundColor DarkGray
    Write-Host "   [3]  REPARACION DE WINDOWS Y RESTAURACION" -ForegroundColor White
    Write-Host "        -> Integridad del sistema (SFC/DISM) y gestion de puntos de restauracion." -ForegroundColor DarkGray
    Write-Host "   [4]  RED Y ESCANER DE PUERTOS" -ForegroundColor White
    Write-Host "        -> Consulta/cambio de DNS, IP publica, ping, test de velocidad y reset de red." -ForegroundColor DarkGray
    Write-Host "   [5]  SEGURIDAD, CREDENCIALES Y HASHES" -ForegroundColor White
    Write-Host "        -> Auditoria de usuarios, claves Wi-Fi, clave OEM, hashes y autostart." -ForegroundColor DarkGray
    Write-Host "   [6]  MANTENIMIENTO Y OPTIMIZACION" -ForegroundColor White
    Write-Host "        -> Limpieza, TRIM, inventario software, backups express y servicios." -ForegroundColor DarkGray
    Write-Host "   [7]  HERRAMIENTAS DE GESTION Y CONSOLAS MSC" -ForegroundColor White
    Write-Host "        -> Accesos directos a las consolas administrativas integradas de Windows." -ForegroundColor DarkGray
    Write-Host "   [8]  OPCIONES DE REINICIO AVANZADO" -ForegroundColor White
    Write-Host "        -> Accesos directos para reiniciar en BIOS, Modo Seguro o WinRE." -ForegroundColor DarkGray
    Write-Host "   [9]  HERRAMIENTAS OSINT Y RECONOCIMIENTO" -ForegroundColor White
    Write-Host "        -> Consultas DNS avanzadas, subdominios, cabeceras HTTP y perfiles web." -ForegroundColor DarkGray
    Write-Host "   [10] GENERAR INFORME TECNICO EXHAUSTIVO EN TEXTO (.TXT)" -ForegroundColor Green
    Write-Host "        -> Exporta un reporte completo del sistema en el Escritorio." -ForegroundColor DarkGray
    Write-Host "   [0]  SALIR" -ForegroundColor Red
    Write-Host ""
    Write-Host "========================================================================================================" -ForegroundColor Cyan
    
    $mainOp = Read-Host "Selecciona una opcion (0-10)"
    
    switch ($mainOp) {
        "1" { Menu-Ransomware }
        "2" { Menu-Hardware }
        "3" { Menu-Reparacion }
        "4" { Menu-Red }
        "5" { Menu-Seguridad }
        "6" { Menu-Mantenimiento }
        "7" { Menu-Consolas }
        "8" { Menu-Reinicio }
        "9" { Menu-OSINT }
        "10" { Generar-InformeTextual }
        "0" { Write-Host "Saliendo..." -ForegroundColor Yellow; break }
        default { Write-Host "Opcion no valida." -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} while ($mainOp -ne "0")
