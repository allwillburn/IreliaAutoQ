local BonusAD = GetBonusDmg(myHero)
local BaseAD = GetBaseDamage(myHero)
local QDmg = 20 + 30 * GetCastLevel(myHero, _Q) + (BaseAD + BonusAD) * 1.2
local QRange = 650

OnTick(function (myHero)

--Auto Q on minions
	for _, minion in pairs(minionManager.objects) do
		if Ready(_Q) and ValidTarget(minion, QRange) and GetCurrentHP(minion) < QDmg then
			CastSpell(_Q)
			AttackUnit(minion)
		end
  end
end)
