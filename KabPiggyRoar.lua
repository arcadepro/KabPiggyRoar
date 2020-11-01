local f = CreateFrame("Frame")
local soundFileID 	= 2063262 -- file id of soundfile (wow.tools)
local buffName 		= "Ineffable Truth"
--local trinketbuffID = 271105 -- butcher's eye aura, 318211 -- vers proc
--local trinketbuffID = 316801 -- ineff proc

local function reReg()
	f:RegisterUnitEvent("UNIT_AURA", "player")
end

f:SetScript("OnEvent", function(self, event, ...)
	if not InCombatLockdown() then return end
	--name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, isCastByPlayer, nameplateShowAll, timeMod, ... = AuraUtil.FindAuraByName(auraName, unit, filter)
	local name, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(buffName, "player", "HELPFUL")
	if name then
		f:UnregisterEvent("UNIT_AURA")
		local start = GetTime()
		if (expirationTime - start) == duration then
			--print(name)
			PlaySoundFile(soundFileID, master)
		end
		 C_Timer.After (1, reReg)
	end
end)

f:RegisterUnitEvent("UNIT_AURA", "player")
