local config = {
  const = {
    EnergyRingID = 3051,
    EquipedEnergyRingID = 3088,
    MightRingID = 3052,
  }
}

local ENERGY_RING = config.const.EnergyRingID
local MIGHT_RING = config.const.MightRingID
local EQUIPED_ENERGY_RING = config.const.EquipedEnergyRingID

--usa o nome MightRing, mas pode ser qualquer um, basta trocar o id do might ring pelo anel a ser usado.

local function getHealthPercent()
  return hppercent()
end

addIcon("ring", { item = { id = ENERGY_RING }, movable = true, text = "Ring" },
  macro(100, function()
    local finger = getFinger()
    local healthPercent = getHealthPercent()

    -- Verifica se há algum anel equipado no dedo
    if finger then
      local fingerId = finger:getId()

      if healthPercent <= 70 then
        -- Equipa o Energy Ring se a vida estiver igual ou abaixo de 70% e o anel equipado não for o Energy Ring
        if fingerId ~= EQUIPED_ENERGY_RING then
          moveToSlot(ENERGY_RING, SlotFinger, 1)
        end
      else
        -- Equipa o Might Ring se a vida estiver acima de 70% e o anel equipado não for o Might Ring
        if fingerId ~= MIGHT_RING then
          moveToSlot(MIGHT_RING, SlotFinger, 1)
        end
      end
    else
      -- Equipa o Energy Ring se nenhum anel estiver equipado
      moveToSlot(ENERGY_RING, SlotFinger, 1)
    end
  end)
)



