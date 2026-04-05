# ================================================
# Script PowerShell para Testar a API
# Uso: .\test-api.ps1
# ================================================

# Cores para output
$Green = 'Green'
$Yellow = 'Yellow'
$Red = 'Red'
$Cyan = 'Cyan'

# Base URL
$baseUrl = "http://localhost:3000"

# ================================================
# FUNÇÃO: Health Check
# ================================================
function Test-HealthCheck {
    Write-Host "`n========================================" -ForegroundColor $Cyan
    Write-Host "1️⃣  HEALTH CHECK" -ForegroundColor $Cyan
    Write-Host "========================================" -ForegroundColor $Cyan
    
    try {
        $response = Invoke-WebRequest -Uri "$baseUrl/" -Method GET -ErrorAction Stop
        Write-Host "✅ Servidor está rodando!" -ForegroundColor $Green
        $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 1 | Write-Host -ForegroundColor $Green
    } catch {
        Write-Host "❌ Erro: Servidor não está respondendo" -ForegroundColor $Red
        Write-Host $_.Exception.Message -ForegroundColor $Red
    }
}

# ================================================
# FUNÇÃO: Registrar Evento Simples
# ================================================
function Register-SimpleEvent {
    Write-Host "`n========================================" -ForegroundColor $Cyan
    Write-Host "2️⃣  REGISTRAR EVENTO SIMPLES" -ForegroundColor $Cyan
    Write-Host "========================================" -ForegroundColor $Cyan
    
    $body = @{
        type = "click"
        timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
    } | ConvertTo-Json
    
    Write-Host "📤 Enviando evento:" -ForegroundColor $Yellow
    Write-Host $body -ForegroundColor $Yellow
    
    try {
        $response = Invoke-WebRequest -Uri "$baseUrl/events" `
            -Method POST `
            -Headers @{"Content-Type" = "application/json"} `
            -Body $body `
            -ErrorAction Stop
        
        Write-Host "`n✅ Evento registrado com sucesso!" -ForegroundColor $Green
        $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 2 | Write-Host -ForegroundColor $Green
    } catch {
        Write-Host "`n❌ Erro:" -ForegroundColor $Red
        Write-Host $_.Exception.Message -ForegroundColor $Red
    }
}

# ================================================
# FUNÇÃO: Registrar Evento Completo
# ================================================
function Register-FullEvent {
    Write-Host "`n========================================" -ForegroundColor $Cyan
    Write-Host "3️⃣  REGISTRAR EVENTO COMPLETO" -ForegroundColor $Cyan
    Write-Host "========================================" -ForegroundColor $Cyan
    
    $body = @{
        type = "click"
        tag = "button"
        text = "Clique aqui"
        element_id = "btn-submit"
        class = "btn btn-primary"
        timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
    } | ConvertTo-Json
    
    Write-Host "📤 Enviando evento:" -ForegroundColor $Yellow
    Write-Host $body -ForegroundColor $Yellow
    
    try {
        $response = Invoke-WebRequest -Uri "$baseUrl/events" `
            -Method POST `
            -Headers @{"Content-Type" = "application/json"} `
            -Body $body `
            -ErrorAction Stop
        
        Write-Host "`n✅ Evento registrado com sucesso!" -ForegroundColor $Green
        $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 2 | Write-Host -ForegroundColor $Green
    } catch {
        Write-Host "`n❌ Erro:" -ForegroundColor $Red
        Write-Host $_.Exception.Message -ForegroundColor $Red
    }
}

# ================================================
# FUNÇÃO: Registrar Evento de Scroll
# ================================================
function Register-ScrollEvent {
    Write-Host "`n========================================" -ForegroundColor $Cyan
    Write-Host "4️⃣  REGISTRAR EVENTO DE SCROLL" -ForegroundColor $Cyan
    Write-Host "========================================" -ForegroundColor $Cyan
    
    $body = @{
        type = "scroll"
        timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
    } | ConvertTo-Json
    
    Write-Host "📤 Enviando evento:" -ForegroundColor $Yellow
    Write-Host $body -ForegroundColor $Yellow
    
    try {
        $response = Invoke-WebRequest -Uri "$baseUrl/events" `
            -Method POST `
            -Headers @{"Content-Type" = "application/json"} `
            -Body $body `
            -ErrorAction Stop
        
        Write-Host "`n✅ Evento registrado com sucesso!" -ForegroundColor $Green
        $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 2 | Write-Host -ForegroundColor $Green
    } catch {
        Write-Host "`n❌ Erro:" -ForegroundColor $Red
        Write-Host $_.Exception.Message -ForegroundColor $Red
    }
}

# ================================================
# FUNÇÃO: Registrar Evento de Hover
# ================================================
function Register-HoverEvent {
    Write-Host "`n========================================" -ForegroundColor $Cyan
    Write-Host "5️⃣  REGISTRAR EVENTO DE HOVER" -ForegroundColor $Cyan
    Write-Host "========================================" -ForegroundColor $Cyan
    
    $body = @{
        type = "hover"
        tag = "img"
        element_id = "logo-image"
        timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
    } | ConvertTo-Json
    
    Write-Host "📤 Enviando evento:" -ForegroundColor $Yellow
    Write-Host $body -ForegroundColor $Yellow
    
    try {
        $response = Invoke-WebRequest -Uri "$baseUrl/events" `
            -Method POST `
            -Headers @{"Content-Type" = "application/json"} `
            -Body $body `
            -ErrorAction Stop
        
        Write-Host "`n✅ Evento registrado com sucesso!" -ForegroundColor $Green
        $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 2 | Write-Host -ForegroundColor $Green
    } catch {
        Write-Host "`n❌ Erro:" -ForegroundColor $Red
        Write-Host $_.Exception.Message -ForegroundColor $Red
    }
}

# ================================================
# FUNÇÃO: Obter Todos os Eventos
# ================================================
function Get-AllEvents {
    Write-Host "`n========================================" -ForegroundColor $Cyan
    Write-Host "6️⃣  OBTER TODOS OS EVENTOS" -ForegroundColor $Cyan
    Write-Host "========================================" -ForegroundColor $Cyan
    
    try {
        $response = Invoke-WebRequest -Uri "$baseUrl/events?limit=50" -Method GET -ErrorAction Stop
        Write-Host "✅ Eventos obtidos!" -ForegroundColor $Green
        $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 2 | Write-Host -ForegroundColor $Green
    } catch {
        Write-Host "❌ Erro:" -ForegroundColor $Red
        Write-Host $_.Exception.Message -ForegroundColor $Red
    }
}

# ================================================
# FUNÇÃO: Obter Estatísticas
# ================================================
function Get-Statistics {
    Write-Host "`n========================================" -ForegroundColor $Cyan
    Write-Host "7️⃣  OBTER ESTATÍSTICAS" -ForegroundColor $Cyan
    Write-Host "========================================" -ForegroundColor $Cyan
    
    try {
        $response = Invoke-WebRequest -Uri "$baseUrl/events/stats" -Method GET -ErrorAction Stop
        Write-Host "✅ Estatísticas:" -ForegroundColor $Green
        $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 1 | Write-Host -ForegroundColor $Green
    } catch {
        Write-Host "❌ Erro:" -ForegroundColor $Red
        Write-Host $_.Exception.Message -ForegroundColor $Red
    }
}

# ================================================
# FUNÇÃO: Testar Validação (Erro)
# ================================================
function Test-ValidationError {
    Write-Host "`n========================================" -ForegroundColor $Cyan
    Write-Host "8️⃣  TESTAR VALIDAÇÃO (ERRO ESPERADO)" -ForegroundColor $Cyan
    Write-Host "========================================" -ForegroundColor $Cyan
    
    $body = @{
        type = "click"
        # Falta timestamp
    } | ConvertTo-Json
    
    Write-Host "📤 Enviando evento INVÁLIDO:" -ForegroundColor $Yellow
    Write-Host $body -ForegroundColor $Yellow
    
    try {
        $response = Invoke-WebRequest -Uri "$baseUrl/events" `
            -Method POST `
            -Headers @{"Content-Type" = "application/json"} `
            -Body $body `
            -ErrorAction Stop
    } catch {
        Write-Host "`n✅ Validação funcionou! Erro retornado:" -ForegroundColor $Green
        $errorResponse = $_.ErrorDetails.Message | ConvertFrom-Json
        $errorResponse | ConvertTo-Json -Depth 1 | Write-Host -ForegroundColor $Green
    }
}

# ================================================
# MENU PRINCIPAL
# ================================================
function Show-Menu {
    Clear-Host
    Write-Host "`n╔════════════════════════════════════════════╗" -ForegroundColor $Cyan
    Write-Host "║   🧪 TESTE DE API - TCC-UX Backend        ║" -ForegroundColor $Cyan
    Write-Host "╚════════════════════════════════════════════╝`n" -ForegroundColor $Cyan
    
    Write-Host "Escolha um teste:" -ForegroundColor $Yellow
    Write-Host "1) ✅ Health Check" -ForegroundColor $Green
    Write-Host "2) 📝 Registrar Evento Simples" -ForegroundColor $Green
    Write-Host "3) 📋 Registrar Evento Completo" -ForegroundColor $Green
    Write-Host "4) 🔄 Registrar Evento de Scroll" -ForegroundColor $Green
    Write-Host "5) 🖱️  Registrar Evento de Hover" -ForegroundColor $Green
    Write-Host "6) 📊 Obter Todos os Eventos" -ForegroundColor $Green
    Write-Host "7) 📈 Obter Estatísticas" -ForegroundColor $Green
    Write-Host "8) ⚠️  Testar Validação (Erro)" -ForegroundColor $Green
    Write-Host "9) 🔄 Executar TODOS os testes" -ForegroundColor $Green
    Write-Host "0) ❌ Sair" -ForegroundColor $Red
    
    Write-Host "`n" -ForegroundColor $Yellow
}

# ================================================
# EXECUTAR TODOS OS TESTES
# ================================================
function Run-AllTests {
    Test-HealthCheck
    Register-SimpleEvent
    Register-FullEvent
    Register-ScrollEvent
    Register-HoverEvent
    Get-AllEvents
    Get-Statistics
    Test-ValidationError
    
    Write-Host "`n✅ Todos os testes foram executados!" -ForegroundColor $Green
}

# ================================================
# LOOP PRINCIPAL
# ================================================
$continue = $true
while ($continue) {
    Show-Menu
    $choice = Read-Host "Digite sua escolha"
    
    switch ($choice) {
        "1" { Test-HealthCheck }
        "2" { Register-SimpleEvent }
        "3" { Register-FullEvent }
        "4" { Register-ScrollEvent }
        "5" { Register-HoverEvent }
        "6" { Get-AllEvents }
        "7" { Get-Statistics }
        "8" { Test-ValidationError }
        "9" { Run-AllTests }
        "0" { 
            Write-Host "`n👋 Até logo!" -ForegroundColor $Green
            $continue = $false 
        }
        default { 
            Write-Host "`n❌ Opção inválida!" -ForegroundColor $Red 
        }
    }
    
    if ($continue) {
        Write-Host "`nPressione Enter para continuar..." -ForegroundColor $Yellow
        Read-Host
    }
}
