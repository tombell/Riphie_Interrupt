local A, L = ...
local cfg = L.cfg

local frame = CreateFrame("Frame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", function(self, event, ...)
  local _, event, _, _, sourceName, _, _, _, _, _, _, _, _, _, extraArg4, _, _, _, _, _, _ = CombatLogGetCurrentEventInfo()

  if event ~= "SPELL_INTERRUPT" then return end
  if sourceName ~= UnitName("player") then return end

  SendChatMessage("Interrupted " .. GetSpellLink(extraArg4), cfg.channel)
end)
