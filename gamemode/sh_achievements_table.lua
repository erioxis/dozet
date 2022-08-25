GM.Achievements = {}

GM.Achievements["zsfan"] = {
    Name = translate.Get("challenge_godzs"),
    Desc = translate.Get("challenge_godzs_d"),
    Goal = 1000,
    Reward = 120000
}

GM.Achievements["everycan"] = {
    Name = translate.Get("challenge_everycan"),
    Desc = translate.Get("challenge_everycan_d"),
    Goal = 1000,
    Reward = 32000
}

GM.Achievements["winfirst"] = {
    Name = translate.Get("challenge_firstwin"),
    Desc = translate.Get("challenge_firstwin_d"),
    Reward = 6000
}

GM.Achievements["bestman"] = {
    Name = translate.Get("challenge_firstblood"),
    Desc = translate.Get("challenge_firstblood_d"),
    Reward = 4000
}

GM.Achievements["becomelast"] = {
    Name = translate.Get("challenge_lastman"),
    Desc = translate.Get("challenge_lastman_d"),
    Reward = 1200
}

GM.Achievements["glassman"] = {
    Name = translate.Get("challenge_glassman"),
    Desc = translate.Get("challenge_glassman_d"),
    Reward = 5000
}

GM.Achievements["mariotrue"] = {
    Name = translate.Get("challenge_mcmario"),
    Desc = translate.Get("challenge_mcmario_d"),
    Reward = 1000
}

GM.Achievements["loveof6"] = {
    Name = translate.Get("challenge_loveof6"),
    Desc = translate.Get("challenge_loveof6_d"),
    Goal = 6,
    Reward = 32000
}

GM.Achievements["ruinto10"] = {
    Name = translate.Get("challenge_loveofruin"),
    Desc = translate.Get("challenge_loveofruin_d"),
    Goal = 10,
    Reward = 5000
}

GM.Achievements["ticklefight"] = {
    Name = translate.Get("challenge_sword"),
    Desc = translate.Get("challenge_sword_d"),
    Reward = 1000
}

GM.Achievements["1to1"] = {
    Name = translate.Get("challenge_1to1"),
    Desc = translate.Get("challenge_1to1_d"),
    Reward = 61000
}

GM.Achievements["highvel"] = {
    Name = translate.Get("challenge_highvelocity"),
    Desc = translate.Get("challenge_highvelocity_d"),
    Reward = 10000
}

-- Cache count, to not call table.Count again
GM.AchievementsCount = table.Count(GM.Achievements)
-- While we're at it
