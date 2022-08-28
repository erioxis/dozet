GM.Achievements = {}
local translate = translate.Get
GM.Achievements["zsfan"] = {
    Name = translate("challenge_godzs"),
    Desc = translate("challenge_godzs_d"),
    Goal = 1000,
    Reward = 120000
}

GM.Achievements["everycan"] = {
    Name = translate("challenge_everycan"),
    Desc = translate("challenge_everycan_d"),
    Goal = 1000,
    Reward = 32000
}

GM.Achievements["winfirst"] = {
    Name = translate("challenge_firstwin"),
    Desc = translate("challenge_firstwin_d"),
    Reward = 6000
}

GM.Achievements["bestman"] = {
    Name = translate("challenge_firstblood"),
    Desc = translate("challenge_firstblood_d"),
    Reward = 4000
}

GM.Achievements["becomelast"] = {
    Name = translate("challenge_lastman"),
    Desc = translate("challenge_lastman_d"),
    Reward = 1200
}

GM.Achievements["glassman"] = {
    Name = translate("challenge_glassman"),
    Desc = translate("challenge_glassman_d"),
    Reward = 5000
}

GM.Achievements["mariotrue"] = {
    Name = translate("challenge_mcmario"),
    Desc = translate("challenge_mcmario_d"),
    Reward = 8000
}

GM.Achievements["loveof6"] = {
    Name = translate("challenge_loveof6"),
    Desc = translate("challenge_loveof6_d"),
    Goal = 6,
    Reward = 32000
}

GM.Achievements["ruinto10"] = {
    Name = translate("challenge_loveofruin"),
    Desc = translate("challenge_loveofruin_d"),
    Goal = 10,
    Reward = 5000
}

GM.Achievements["ticklefight"] = {
    Name = translate("challenge_sword"),
    Desc = translate("challenge_sword_d"),
    Reward = 1000
}

GM.Achievements["1to1"] = {
    Name = translate("challenge_1to1"),
    Desc = translate("challenge_1to1_d"),
    Reward = 61000
}

GM.Achievements["highvel"] = {
    Name = translate("challenge_highvelocity"),
    Desc = translate("challenge_highvelocity_d"),
    Reward = 10000
}
GM.Achievements["godisdead"] = {
    Name = translate("challenge_godisdead"),
    Desc = translate("challenge_godisdead_d"),
    Reward = 3000
}
GM.Achievements["tanked"] = {
    Name = translate("challenge_tanked"),
    Desc = translate("challenge_tanked_d"),
    Goal = 10000,
    Reward = 8000
}
GM.Achievements["godhelp"] = {
    Name = translate("challenge_godhelp"),
    Desc = translate("challenge_godhelp_d"),
    Goal = 100,
    Reward = 4500
}
GM.Achievements["bruhwtf"] = {
    Name = translate("challenge_bruhwtf"),
    Desc = translate("challenge_bruhwtf_d"),
    Reward = 8500
}
GM.Achievements["bossofboss"] = {
    Name = translate("challenge_bossofboss"),
    Desc = translate("challenge_bossofboss_d"),
    Goal = 5,
    Reward = 1500
}
GM.Achievements["waytobest"] = {
    Name = translate("challenge_waytobest"),
    Desc = translate("challenge_waytobest_d"),
    Reward = 350
}
GM.Achievements["greatgreed"] = {
    Name = translate("challenge_greatgreed"),
    Desc = translate("challenge_greatgreed_d"),
    Goal = 3000,
    Reward = 10000
}
GM.Achievements["thisisbeeasy"] = {
    Name = translate("challenge_thisisbeeasy"),
    Desc = translate("challenge_thisisbeeasy_d"),
    Reward = 3500
}
GM.Achievements["remorting"] = {
    Name = translate("challenge_remorting"),
    Desc = translate("challenge_remorting_d"),
    Reward = 3500
}
GM.Achievements["goodtime"] = {
    Name = translate("challenge_goodtime"),
    Desc = translate("challenge_goodtime_d"),
    Goal = 500,
    Reward = 6500
}
GM.Achievements["blyat"] = {
    Name = translate("challenge_blyat"),
    Desc = translate("challenge_blyat_d"),
    Reward = -1000
}
GM.Achievements["bleedmode"] = {
    Name = translate("challenge_bleedmode"),
    Desc = translate("challenge_bleedmode_d"),
    Reward = 1200
}


-- Cache count, to not call table.Count again
GM.AchievementsCount = table.Count(GM.Achievements)
-- While we're at it
