local initialMoveDistance = 1 -- Distância inicial em sqm
local maxMoveDistance = 10 -- Distância máxima a ser tentada
local increment = 1 -- Incremento de distância a cada tentativa

-- Variáveis de estado
local moveDistance = initialMoveDistance
local moving = false
local previousPos = player:getPosition()

-- Função para mover o jogador para uma nova posição
function movePlayer(direction)
    local playerPos = player:getPosition()

    -- Calcula a nova posição com base na direção
    local newPos = {x = playerPos.x, y = playerPos.y, z = playerPos.z}

    if direction == "W" then
        newPos.y = newPos.y - moveDistance  -- Para frente (assumindo Y negativo é para frente)
    elseif direction == "S" then
        newPos.y = newPos.y + moveDistance  -- Para trás
    elseif direction == "A" then
        newPos.x = newPos.x - moveDistance  -- Para esquerda
    elseif direction == "D" then
        newPos.x = newPos.x + moveDistance  -- Para direita
    end

    -- Faz o jogador se mover para a nova posição
    player:autoWalk(newPos)
    moving = true -- Marca que estamos tentando mover o jogador
end

-- Função para verificar se o jogador se moveu
function checkMovement()
    local playerPos = player:getPosition()
    if not moving then
        return
    end

    -- Verifica se a posição do jogador mudou
    if playerPos.x ~= previousPos.x or playerPos.y ~= previousPos.y then
        -- O jogador se moveu, continua com a distância inicial
        moveDistance = initialMoveDistance
    else
        -- O jogador não se moveu, aumenta a distância para a próxima tentativa
        moveDistance = math.min(moveDistance + increment, maxMoveDistance)
    end
    moving = false
    previousPos = playerPos -- Atualiza a posição anterior após a verificação
end

-- Macro para detectar as teclas WASD pressionadas e mover o jogador
macro(50, "Move with WASD", function()
    if g_keyboard.isKeyPressed("W") then
        movePlayer("W")
    elseif g_keyboard.isKeyPressed("S") then
        movePlayer("S")
    elseif g_keyboard.isKeyPressed("A") then
        movePlayer("A")
    elseif g_keyboard.isKeyPressed("D") then
        movePlayer("D")
    end
end)

-- Macro para verificar o movimento do jogador
macro(100, "Check Movement", function()
    checkMovement()
end)
