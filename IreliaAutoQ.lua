if GetObjectName(GetMyHero()) ~= "Irelia" then return end

local BonusAD = GetBonusDmg(myHero)
local BaseAD = GetBaseDamage(myHero)
local QDmg = 20 + 30 * GetCastLevel(myHero, _Q) + (BaseAD + BonusAD) * 1.2
local QRange = 650

local IreliaMenu = Menu("Irelia", "Irelia")

IreliaMenu:SubMenu("Farm", "Farm")
IreliaMenu.Farm:Boolean("Q", "AutoQ", true)

OnTick(function (myHero)
 
BonusAD = GetBonusDmg(myHero)
BaseAD = GetBaseDamage(myHero)
QDmg = 20 + 30 * GetCastLevel(myHero, _Q) + (BaseAD + BonusAD) * 1.2

--Auto Q on minions
    for _, minion in pairs(minionManager.objects) do
        if IreliaMenu.Farm.Q:Value() and Ready(_Q) and ValidTarget(minion, QRange) and GetCurrentHP(minion) < CalcDamage(myHero,minion,QDmg,0) then
            CastTargetSpell(minion,_Q)
        end
    end
end)

