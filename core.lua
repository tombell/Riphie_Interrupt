local A, L = ...
local cfg = L.cfg

local frame = CreateFrame("Frame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", function(self, event, ...)
  if select(2, ...) ~= "SPELL_INTERRUPT" then return end
  if select(5, ...) ~= UnitName("player") then return end

  local spellId = select(15, ...)
  SendChatMessage("Interrupted " .. GetSpellLink(spellId), cfg.channel)
end)
