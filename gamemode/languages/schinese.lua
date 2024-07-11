--[[
English is the standard language that you should base your ID's off of.
If something isn't found in your language file then it will fall back to English.

Valid languages (from gmod's menu): bg cs da de el en en-PT es-ES et fi fr ga-IE he hr hu it ja ko lt nl no pl pt-BR pt-PT ru sk sv-SE th tr uk vi zh-CN zh-TW
You MUST use one of the above when using translate.AddLanguage
]]

--[[
RULES FOR TRANSLATORS!!
* Only translate formally. Do not translate with slang, improper grammar, spelling, etc.
* Do not translate proper things. For example, do not translate Zombie Survival (the name of the game). Do translate "survive the zombies".
  For names of weapons, you would translate only the "Handgun" part of 'Peashooter' Handgun (and the quotes if your language doesn't use ' as quotes)
  For names of classes, you would translate Bloated Zombie to whatever the word for Bloated and Zombie are. But you wouldn't translate Pukepus or Bonemesh.
* Comment out things that you have not yet translated in your language file.
  It will then fall back to this file instead of potentially using out of date wording in yours.
]]

--translate.AddLanguage("en", "English")
translate.AddLanguage("zh-CN", "schinese")
-- Class Selection
LANGUAGE.no_money_here = "没钱,拿个毛"
LANGUAGE.Cash = "收银机"
LANGUAGE.class_bad_marrow = "Bad Marrow"

LANGUAGE.class_King = "长老"
LANGUAGE.miaoshu_king = "它是最具实力而且配备最好的重装甲丧尸，而它手上会拿着一把重型机枪、火箭发射器，而且还配有隐身系统和三个治愈针筒\n它也是游戏当中移动速度最快的跑步好手，它能够轻易地从玩家、丧尸群中脱离战斗，一旦它逃脱，它就会马上进行治疗然后再次发动下一次攻击"
LANGUAGE.class_basher = "棒球手"
LANGUAGE.class_firezombie = "火焰僵尸"

-- Various gamemode stuff
LANGUAGE.minute_points_added						= "一分钟没有受到任何伤害!获得了％d金钱"
LANGUAGE.infliction_reached_class_unlocked			= "%d%% infliction has been reached! %s 已解锁!"
LANGUAGE.infliction_reached							= "%d%%的人类已经死亡"
LANGUAGE.x_unlocked									= "%s已解锁!"
LANGUAGE.disconnect_killed							= "%s作为%s死亡了"
LANGUAGE.nail_removed_by							= "%s拆掉了%s的钉子"
LANGUAGE.banned_for_life_warning					= "您已启用终身禁赛技能，因此您无法购买任何东西！"
LANGUAGE.late_buyer_warning							= "你有后期买家技能激活，所以你不能购买任何东西，直到下半年！"
LANGUAGE.late_buyer_finished						= "迟到的买家期已经结束。 您现在可以从军火库购买物品."
LANGUAGE.need_to_be_near_arsenal_crate				= "你需要靠近商店才能购买!"
LANGUAGE.need_to_be_near_remantler					= "你需要靠近升级站!"
LANGUAGE.cant_purchase_right_now					= "你现在无法购买任何东西"
LANGUAGE.dont_have_enough_points					= "你的金钱不够"
LANGUAGE.need_to_have_enough_scrap					= "你没有足够的零件"
LANGUAGE.cannot_dismantle							= "你无法拆卸该物品"
LANGUAGE.prepare_yourself							= "做好准备..."
LANGUAGE.purchased_x_for_y_points					= "你购买了%s,花费了%d点数"
LANGUAGE.created_x_for_y_scrap						= "制造了%s,使用了%d零件"
LANGUAGE.give_time_before_suicide					= "你现在不能自杀= ="
LANGUAGE.no_spare_ammo_to_give						= "没有多余的弹药来给予!"
LANGUAGE.no_person_in_range							= "范围内无人!"
LANGUAGE.that_life									= "你在这条命做到了..."
LANGUAGE.x_damage_to_barricades						= "给防线造成了总%d点伤害"
LANGUAGE.x_damage_to_humans							= "给人类造成了总%d点伤害"
LANGUAGE.x_brains_eaten								= "感染了%d名人类"

LANGUAGE.press_jump_to_free_roam					= "按空格来启用自由视角"
LANGUAGE.press_rmb_to_cycle_targets					= "Press RMB to cycle targets"
LANGUAGE.press_lmb_to_spawn_on_them					= "Press LMB to spawn on them"
LANGUAGE.press_lmb_to_spawn							= "按左键来重生"
LANGUAGE.press_reload_to_spawn_far					= "按R键在远离人类的敌方重生"
LANGUAGE.press_alt_nest_menu						= "按ALT来选择重生点"
LANGUAGE.press_reload_to_spawn_at_normal_point		= "按R在僵尸复活点重生"
LANGUAGE.press_walk_to_spawn_as_x					= "Press %s to spawn as a %s"
LANGUAGE.press_rmb_to_spawn_close					= "按R键在幸存者附近生成"
LANGUAGE.press_left_and_right_to_cycle_targets		= "Press STRAFE LEFT and STRAFE RIGHT to cycle targets"
LANGUAGE.class_reaper           = "收割者"
LANGUAGE.description_reaper           = "一个突变的快速僵尸"
LANGUAGE.controls_reaper          = "左键> 攻击"
LANGUAGE.observing_x								= "Observing %s (%d)"
LANGUAGE.observing_x_simple							= "Observing %s"
LANGUAGE.waiting_for_next_wave						= "等待下一波尸潮开始..."
LANGUAGE.impossible									= "不太可能"
LANGUAGE.trying_to_put_nails_in_glass				= "这个玻璃没法钉钉子"
LANGUAGE.boss_class_select							= "你下次当BOSS时,将成为%s"
LANGUAGE.person_has_weapon							= "ta们已经有了该武器了"
LANGUAGE.cant_do_that_in_classic_mode				= "在经典模式下，你不能这样做。"
LANGUAGE.cant_use_x_in_classic_mode					= "在经典模式下,你无法使用%s"
LANGUAGE.cant_use_x_in_zombie_escape				= "在僵尸逃跑模式下，你无法使用%s"
LANGUAGE.no_class_switch_in_this_mode				= "目前的模式不允许你切换角色."
LANGUAGE.press_sprint_to_get_up						= "按Shift键起身"
LANGUAGE.zombie_escape								= "僵尸逃跑模式!"
LANGUAGE.nothing_for_this_ammo						= "你没有任何使用该弹药类型的东西"
LANGUAGE.you_decide_to_leave_some					= "You decide to leave some for your team."
LANGUAGE.you_cant_purchase_now						= "你现在无法购买物品"
LANGUAGE.no_ammo_here								= "这里暂时没有任何弹药"
LANGUAGE.you_redeemed								= "你已复活!"
LANGUAGE.x_redeemed									= "%s复活了!"
LANGUAGE.kill_the_last_human						= "杀掉最后一人!!!"
LANGUAGE.kick_the_last_human						= "Kick the last human!"
LANGUAGE.you_are_the_last_human						= "你是全村最后的希望!!!"
LANGUAGE.x_zombies_out_to_get_you					= "%d名丧尸想要了你的命!"
LANGUAGE.x_pants_out_to_get_you						= "%d PANTS ARE OUT TO GET YOU!"
LANGUAGE.you_have_died								= "欢迎回家"
LANGUAGE.you_were_killed_by_x						= "%s杀掉了你"
LANGUAGE.you_were_kicked_by_x						= "You were kicked in the shins by %s"
LANGUAGE.arsenal_upgraded							= "获得"
LANGUAGE.final_wave									= "最后一波!!!"
LANGUAGE.final_wave_sub								= "所有丧尸已突变!!!"
LANGUAGE.wave_x_has_begun							= "第%d波已经开始!"
LANGUAGE.x_unlocked									= "%s已解锁!"
LANGUAGE.wave_x_is_over								= "第%d波已结束!"
LANGUAGE.wave_x_is_over_sub							= "丧尸已散开"
LANGUAGE.points_for_surviving						= "你因为成功生存获得了%d点数"
LANGUAGE.scrap_for_surviving						= "你因为成功生存获得了%d零件"
LANGUAGE.you_are_x									= "你是%s!"
LANGUAGE.x_has_risen_as_y							= "%s成为了%s!"
LANGUAGE.x_has_risen								= "BOSS丧尸来袭了!!!"
LANGUAGE.x_has_been_slain_as_y						= "%s作为%s被杀死了"
LANGUAGE.cant_use_worth_anymore						= "你现在不能使用初始物品菜单"
LANGUAGE.class_not_unlocked_will_be_unlocked_x		= "该类型还未解锁,第%d波将可使用"
LANGUAGE.you_are_already_a_x						= "你已经是%s了"
LANGUAGE.you_will_spawn_as_a_x						= "你将作为%s复活"
LANGUAGE.crafting_successful						= "制作成功!"
LANGUAGE.x_crafted_y								= "%s制作了%s."
LANGUAGE.escape_from_the_zombies					= "摆脱这些丧尸!!!"
LANGUAGE.too_close_to_another_nail					= "太靠近另一个钉子了"
LANGUAGE.object_too_damaged_to_be_used				= "这东西坏的太严重了,没法钉起来"
LANGUAGE.thanks_for_being_a_fan_of_zs				= "感谢你成为僵尸生存的粉丝！!"
LANGUAGE.cant_remove_nails_of_superior_player		= "你不能移除一个拥有建筑专家技能的玩家的钉子，因为你没有这个技能."
LANGUAGE.x_turned_on_noclip							= "%s正在飞行"
LANGUAGE.x_turned_off_noclip						= "%s关闭了飞行"
LANGUAGE.unlocked_on_wave_x							= "将在第%d波解锁"
LANGUAGE.brains_eaten_x								= "杀掉的人:%s"
LANGUAGE.points_x									= "$:%s"
LANGUAGE.next_wave_in_x								= "下一波将会在%s后开始"
LANGUAGE.wave_ends_in_x								= "本波将会在%s后结束"
LANGUAGE.wave_x_of_y								= "第%d波,共%d波"
LANGUAGE.round_x_of_y								= "第%d轮,共%d轮"
LANGUAGE.zombie_invasion_in_x						= "尸潮将在%s后开始"
LANGUAGE.intermission								= "休整时间"
LANGUAGE.press_f2_for_the_points_shop				= "按下F2打开商店"
LANGUAGE.breath										= "氧气"
LANGUAGE.zombie_volunteers							= "当僵尸的勇士!:"
LANGUAGE.x_will_be_y_soon							= "%s很快将会成为%s!"
LANGUAGE.you_will_be_x_soon							= "你将会快成为%s!"
LANGUAGE.x_discount_for_buying_between_waves		= "在休整时间购买物品将会获得%d%%折折扣"
LANGUAGE.number_of_initial_zombies_this_game		= "初始丧尸数量(%d%%): %d"
LANGUAGE.humans_closest_to_spawns_are_zombies		= "越靠近僵尸出生地(绿烟)越有可能被感染"
LANGUAGE.waiting_for_players						= "等待其他玩家加入..."
LANGUAGE.requires_x_people							= "需要%d个人"
LANGUAGE.packing_others_object						= "拿走其他人的物品..."
LANGUAGE.packing									= "打包带走中..."
LANGUAGE.ze_humans_are_frozen_until_x				= "人类被冻结直到回合开始前%d秒"
LANGUAGE.loading									= "少女折寿中..."
LANGUAGE.next_round_in_x							= "下一轮将在%s后开始"
LANGUAGE.warning									= "警告!"
LANGUAGE.ready										= "准备"
LANGUAGE.ok_and_no_reminder							= "确定,以后不要再弹出此信息"
LANGUAGE.classic_mode_warning						= "该服务器的\n经典模式是一种极大地改变了游戏性的设置。 以下是改变的东西:\n* 不允许选择僵尸类型,每个人都是默认僵尸.\n* 没有辅助品，如钉子或炮塔\n* 更多的回合但是每回合时间更短\n\n这和原版僵尸生存有很大不同!\n\n-- 运行经典模式的服务器将在屏幕左下方显示CLASSIC MODE。 --"
LANGUAGE.classic_mode								= "经典模式"
LANGUAGE.resist_x									= "抗性: %d%%"
LANGUAGE.right_click_to_hammer_nail					= "右键钉钉子"
LANGUAGE.nails_x									= "钉子:%d"
LANGUAGE.resupply_box								= "弹药箱"
LANGUAGE.purchase_now								= "补货完成"
LANGUAGE.integrity_x								= "耐久:%d%%"
LANGUAGE.empty										= "没有弹药!"
LANGUAGE.manual_control								= "手动"
LANGUAGE.arsenal_crate								= "商店"
LANGUAGE.not_enough_room_for_a_nest					= "这里没有足够的空间来建巢"
LANGUAGE.too_close_to_another_nest					= "太靠近另一个巢了"
LANGUAGE.nest_created								= "巢的框架已完成!继续添建来完成此巢"
LANGUAGE.nest_built_by_x							= "%s建造了一个巢,现在可以作为丧尸重生点了"
LANGUAGE.nest_destroyed								= "巢穴已被摧毁"
LANGUAGE.wait_x_seconds_before_making_a_new_nest	= "在建造一个新巢穴前,需要等待%d秒"
LANGUAGE.too_close_to_a_human						= "太靠近人类了!"
LANGUAGE.too_close_to_a_spawn						= "太靠近丧尸重生点了!"
LANGUAGE.too_close_to_uncorrupt						= "太靠近一个未损坏的水晶印记了!"
LANGUAGE.x_has_built_this_nest_and_is_still_around	= "%s建造了这个巢,并且ta仍然在附近,你没法拆除它"
LANGUAGE.no_other_nests								= "你不能拆毁最后一个巢穴"
LANGUAGE.there_are_too_many_nests					= "这里有太多巢穴了!"
LANGUAGE.you_have_made_too_many_nests				= "你已经钉了太多钉子了,拆除一个,然后重试"
LANGUAGE.no_free_channel							= "你已经放置了太多无线电干扰了!"
LANGUAGE.tier_x_items_unlock_at_wave_y				= "第%d阶级的物品将会在第%d波解锁"
LANGUAGE.tier_x_items								= "第%d阶级物品"
LANGUAGE.humans_furthest_from_sigils_are_zombies	= "距离水晶印记越远越容易变成丧尸"
LANGUAGE.out_of_stock								= "这件物品缺货"
LANGUAGE.obtained_x_y_ammo							= "已获得%d %s弹药"
LANGUAGE.gave_x_y_ammo_to_z							= "将%d %s弹药给予了%s"
LANGUAGE.obtained_x_y_ammo_from_z					= "获得了%d %s弹药,来自%s"
LANGUAGE.healed_x_by_y								= "%s恢复了你%d点HP"
LANGUAGE.healed_x_for_y								= "治疗了%s %d点HP"
LANGUAGE.buffed_x_with_y							= "%s为你使用了%s"
LANGUAGE.buffed_x_with_a_y							= "给%s使用了%s"
LANGUAGE.removed_your_nail							= "%s拆掉了你的钉子"
LANGUAGE.giving_items_to							= "将物品给予%s"
LANGUAGE.weapon_remantler							= "武器重组级"
LANGUAGE.remantle_success							= "武器Get√:"
LANGUAGE.remantle_used								= "你的升级站增加了%d废料"
LANGUAGE.remantle_cannot							= "你已经有了该升级了."
LANGUAGE.teleporting_to_sigil						= "传送到印记%s"
LANGUAGE.press_shift_to_cancel						= "按SHIFT来取消传送"
LANGUAGE.point_at_a_sigil_to_choose_destination		= "指向另一个印记来选择目的地"
LANGUAGE.frail_healdart_warning						= "无法治疗 %s 因为他有 DEBUFF: 虚弱!"
LANGUAGE.obtained_a_inv								= "%s放进了背包"
LANGUAGE.you_already_have_this_trinket				= "你的背包里已有此物品"
LANGUAGE.they_already_have_this_trinket				= "ta们的背包中已有此物品"
LANGUAGE.you_cannot_carry_more_comps				= "你不能携带更多的组件"
LANGUAGE.they_cannot_carry_more_comps				= "ta们没法携带更多的组件了"
LANGUAGE.obtained_inv_item_from_z					= "Obtained %s from %s added to inventory"
LANGUAGE.deployable_lost							= "你的%s被摧毁了"
LANGUAGE.deployable_claimed							= "你白嫖到了 %s."
LANGUAGE.trinket_consumed							= "你的 %s 已经激活并启用."
LANGUAGE.ran_out_of_ammo						 	= "你的 %s 没子弹了."
LANGUAGE.trinket_recharged							= "你的 %s 已经充能完毕并能重新使用."
LANGUAGE.evolves_in_to_x_on_wave_y					= "将在第%s波中进化为%s."

-- Sigils point objectives
LANGUAGE.sigil										= "水晶印记"
--LANGUAGE.sigil_destroyed							= "A Sanity Sigil has been destroyed. The Undead grow stronger!"
LANGUAGE.sigil_corrupted							= "一个水晶印记被破坏了!丧尸们的突变更严重了!"
LANGUAGE.sigil_corrupted_last						= "所有的水晶印记都被破坏了!,丧尸们突变已达到最严重了"
LANGUAGE.sigil_uncorrupted							= "一个水晶印记已被净化,丧尸已削弱!"
--[[LANGUAGE.sigil_destroyed_only_one_remain_h		= "只剩下一个理智符印！"
LANGUAGE.sigil_destroyed_only_one_remain_z			= "只剩下一个理智符印！"
LANGUAGE.sigil_destroyed_x_remain					= "%d remaining."]]
LANGUAGE.sigil_corrupted_x_remain					= "%d未被损坏"
--[[LANGUAGE.last_sigil_destroyed_all_is_lost		= "The Undead have destroyed the last Sanity Sigil..."
LANGUAGE.last_sigil_destroyed_all_is_lost2			= "Time to die!"]]
LANGUAGE.prop_obj_exit_h							= "逃离!"
LANGUAGE.prop_obj_exit_z							= "阻止TA们!"
LANGUAGE.x_sigils_appeared							= "%d水晶印记已经出现了,人类可以在它们之间进行传送"
LANGUAGE.has_survived								= "已逃离成功!"

-- Skill system messages
LANGUAGE.unspent_skill_points_press_x				= "你有未使用的技能点,按下%q来使用"
LANGUAGE.x_requires_a_skill_you_dont_have			= "%s需要的前置技能你还没有"
LANGUAGE.you_ascended_to_level_x					= "你已升至%d级!"
LANGUAGE.you_have_remorted_now_rl_x					= "你已转生并升至转生等级%d!"
LANGUAGE.you_now_have_x_extra_sp					= "你现在有了%d个额外技能点!"
LANGUAGE.x_has_remorted_to_rl_y						= "%s转生了！现在他有额外的%d技能点!!"
LANGUAGE.you_have_reset_all							= "你的所有经验,技能,技能点已重置"

-- Message beacon messages
-- 消息信标消息
LANGUAGE.message_beacon_1            = "在这里见面"
LANGUAGE.message_beacon_2                  = "这里需要防御"
LANGUAGE.message_beacon_3 = "这里需要炮塔"
LANGUAGE.message_beacon_4 = "这里需要武器箱"
LANGUAGE.message_beacon_5 = "这里需要医生"
LANGUAGE.message_beacon_6 = "这里是补给箱"
LANGUAGE.message_beacon_7 = "这里是武器箱"
LANGUAGE.message_beacon_8 = "这里需要力场"
LANGUAGE.message_beacon_9 = "这里需要炸药"
LANGUAGE.message_beacon_10 = "僵尸来自这里"
LANGUAGE.message_beacon_11  = "请勿进入！！"
LANGUAGE.message_beacon_12 = "别出去"
LANGUAGE.message_beacon_13 = "保卫这个地区"
LANGUAGE.message_beacon_14 = "保卫这里"
LANGUAGE.message_beacon_15 = "这里有医生"
LANGUAGE.message_beacon_16 = "从我的箱子里购买"
LANGUAGE.message_beacon_17 = "这里有路障"
LANGUAGE.message_beacon_18 = "不要在这里设置路障"
LANGUAGE.message_beacon_19 = "不要让僵尸进来"
LANGUAGE.message_beacon_20 = "这会坏掉"
LANGUAGE.message_beacon_21 = "这个地方很危险！"
LANGUAGE.message_beacon_22 = "小心毒药！"
LANGUAGE.message_beacon_23 = "僵尸正在这里突破！"
LANGUAGE.message_beacon_24 = "僵尸来了。建立防线！"
LANGUAGE.message_beacon_25 = "这里是 B 计划"
-- Class names
LANGUAGE.class_zombie								= "僵尸"
LANGUAGE.class_zombie_gore_blaster					= "血液僵尸"
LANGUAGE.class_poison_zombie						= "剧毒僵尸"
LANGUAGE.class_wild_poison_zombie					= "野生剧毒僵尸"
LANGUAGE.class_fast_zombie							= "快速丧尸"
LANGUAGE.class_fast_zombie_slingshot				= "弹射僵尸"
LANGUAGE.class_bloated_zombie						= "肿胀僵尸"
LANGUAGE.class_vile_bloated_zombie					= "恶毒肿胀僵尸"
LANGUAGE.class_classic_zombie						= "经典僵尸"
LANGUAGE.class_super_zombie							= "超级丧尸"
LANGUAGE.class_fresh_dead							= "刚死的"
LANGUAGE.class_recent_dead							= "近死的"
LANGUAGE.class_agile_dead							= "敏捷僵尸"
LANGUAGE.class_ghoul								= "食尸鬼"
LANGUAGE.class_chilled_ghoul						= "寒冰食尸鬼"
LANGUAGE.class_elderghoul							= "老食尸鬼"
LANGUAGE.class_noxiousghoul							= "剧毒食尸鬼"
LANGUAGE.class_headcrab								= "猎头蟹"
LANGUAGE.class_fast_headcrab						= "快速猎头蟹"
LANGUAGE.class_bloodsucker_headcrab					= "吸血猎头蟹"
LANGUAGE.class_poison_headcrab						= "剧毒猎头蟹"
LANGUAGE.class_barbed_headcrab						= "剧毒猎头蟹"
LANGUAGE.class_the_tickle_monster					= "触手怪"
LANGUAGE.class_nightmare							= "梦魇"
LANGUAGE.class_ancient_nightmare					= "远古梦魇"
LANGUAGE.class_devourer								= "吞噬者"
LANGUAGE.class_pukepus								= "呕吐者"
LANGUAGE.class_bonemesh								= "投骨"
LANGUAGE.class_crow									= "乌鸦"
LANGUAGE.class_wilowisp								= "致盲恶灵"
LANGUAGE.class_coolwisp								= "寒冰恶灵"
LANGUAGE.class_zombie_torso							= "僵尸上半身"
LANGUAGE.class_zombie_legs							= "僵尸下半身"
LANGUAGE.class_wraith								= "改造幽灵"
LANGUAGE.class_tormented_wraith						= "被折磨的改造幽灵"
LANGUAGE.class_fast_zombie_legs						= "快速丧尸下半身"
LANGUAGE.class_fast_zombie_torso					= "快速丧尸上半身"
LANGUAGE.class_fast_zombie_torso_slingshot			= "弹射僵尸上半身"
LANGUAGE.class_chem_burster							= "自爆僵尸"
LANGUAGE.class_shade								= "万磁王"
LANGUAGE.class_frostshade							= "冰霜万磁王"
LANGUAGE.class_butcher								= "屠夫"
LANGUAGE.class_gravedigger							= "掘墓者"
LANGUAGE.class_flesh_creeper						= "筑巢者"
LANGUAGE.class_gore_child							= "巨大熊孩子"
LANGUAGE.class_giga_gore_child						= "暗影熊孩子"
LANGUAGE.class_shadow_gore_child					= "黑暗熊孩子"
LANGUAGE.class_giga_shadow_child					= "暗影黑暗熊孩子"
LANGUAGE.class_asskicker							= "踢屁股冠军"
LANGUAGE.class_shitslapper							= "巨大爬行者"
LANGUAGE.class_doomcrab								= "末日猎头蟹!"
LANGUAGE.class_red_marrow							= "血肉红骨"
LANGUAGE.class_skeletal_walker						= "骷髅兵"
LANGUAGE.class_skeletal_shambler					= "黄金骷髅!"
LANGUAGE.class_skeletal_lurker						= "骷髅爬行者"
LANGUAGE.class_shadow_lurker						= "暗影骷髅"
LANGUAGE.class_shadow_walker						= "暗影爬行者"
LANGUAGE.class_frigid_revenant						= "冰冻骷髅"
LANGUAGE.class_initial_dead							= "最初的死者"
LANGUAGE.class_lacerator							= "撕裂者"
LANGUAGE.class_lacerator_charging					= "袭击者"
LANGUAGE.class_eradicator							= "毁灭者"
LANGUAGE.class_howler								= "恐惧咆哮"
LANGUAGE.class_extinctioncrab						= "灭绝猎头蟹"
LANGUAGE.class_yongying								= "雄鹰 恐惧之眸"
LANGUAGE.class_biochemicalZombie          = "生化僵尸"
LANGUAGE.class_espionage                  = "内鬼僵尸"
LANGUAGE.class_nugget                     = "伪装者猎头蟹"

-- Class descriptions
LANGUAGE.description_zombie							= "这个基础僵尸很耐打并且有强力的爪子.\n很难被击杀，如果不是命中头部的话."
LANGUAGE.description_zombie_gore_blaster			= "血腥冲击波僵尸在被杀死时会自爆，这会造成轻微伤害。\n他的爪子会让人类流血."
LANGUAGE.description_poison_zombie					= "这种变异的僵尸不仅血厚，而且能造成更高的伤害.\n它的身体是剧毒的，甚至他会投出自己的毒素来攻击人类."
LANGUAGE.description_wild_poison_zombie				= "一种遭受核辐射的毒僵尸，使它变得更强壮.\n他抛出的毒素会更加零散和致命的."
LANGUAGE.description_fast_zombie					= "这个僵尸比其他僵尸脆的多但他有比其他僵尸更快的移动速度.\n它们本身并不是什么威胁，但它们可以用锋利的爪子爬到几乎任何地方\n他们也可以不费力的击杀低血量的人类."
LANGUAGE.description_fast_zombie_slingshot			= "一个变得异常快速的僵尸.\n他可以施加很强大的力量，但是这会摧毁他的上半身，上半身则会被以极快的速度弹出\n上半身命中会是人类减速."
LANGUAGE.description_bloated_zombie					= "它们的身体是由挥发性有毒化学物质组成的.\n尽管移动速度缓慢，但他们可以承受更高的伤害."
LANGUAGE.description_vile_bloated_zombie			= "它们的身体是由挥发性有毒化学物质组成的，它们可以在相当远的地方投毒.\n它们比普通的肿胀僵尸要快一点，但代价是没有那么强壮."
LANGUAGE.description_fresh_dead						= "这些是新鲜的僵尸.\n它们的血量不如那些僵尸但速度比僵尸快。"
LANGUAGE.description_agile_dead						= "这些是最近复活的僵尸。\n这些刚死去的人类能够在墙壁上爬行."
LANGUAGE.description_ghoul							= "这个僵尸身上有剧毒的化学物质\n它略弱于其他僵尸，但毒素弥补了它的攻击。\n它的爪子可以在短时间内削弱人类的防御力，造成其他攻击的伤害增加，并且它可以投掷粘液来减缓它们的移动速度。."
LANGUAGE.description_chilled_ghoul					= "一个从北极诞生的僵尸。\n它略弱于其他僵尸，但他能够减缓人类的攻击速度"
LANGUAGE.description_frigid_revenant				= "他的身体由寒冷的骨架和附着在上面的冰组成\n源于寒冷的食尸鬼，具有暗影行者抵抗近战攻击的能力。\n他的攻击会让人类失明并减慢他们的速度."
LANGUAGE.description_elderghoul						= "一个年老的食尸鬼，有一具剧毒的尸体，他们向远处的受害者投掷毒素。\n它们脆弱的身体在受到伤害时会向周围的人释放毒素。"
LANGUAGE.description_noxiousghoul					= "一个年迈的食尸鬼，身上有剧毒的毒液.\n他们的毒液会减慢和削弱不幸的浪B，他们的身体会向攻击者释放毒素并造成伤害伤害."
LANGUAGE.description_headcrab						= "头蟹是一切问题的开端.\n没有人知道他们来自哪里.\n它们的攻击方法是利用腹部的牙齿来撕咬受害者。"
LANGUAGE.description_fast_headcrab					= "快速猎头蟹比普通头蟹快得多，但不够身体强度不如普通头蟹.\n无论哪种方式，他们都同样令人讨厌和致命."
LANGUAGE.description_bloodsucker_headcrab			= "吸血猎头蟹是比较粗壮的快头蟹，他能使对方无法被治疗.\n每一次成功的攻击都会恢复自身少量的生命值。"
LANGUAGE.description_poison_headcrab				= "这种头蟹充满了致命的神经毒素.\n一口通常足以杀死一个人.\n他也能吐出威力较小的毒素来远程攻击\n如果毒素打到脸上，毒素将会使他短暂失明."
LANGUAGE.description_barbed_headcrab				= "这只头蟹有锋利的牙齿\n这只头蟹会投出一个利齿，被命中的人会短暂流血."
LANGUAGE.description_the_tickle_monster				= "据说是晚上躲在你衣柜里把你从床上拖下来拉去啪啪啪的怪物.\n触手怪那有弹性的手臂使它能攻击的很远，他们也使它成为一个理想的防线破坏者."
LANGUAGE.description_nightmare						= "一种极为罕见的变异赋予了梦魇异常的能力。\n在几乎所有方面都强于所有的僵尸，梦魇是一种不可忽视的威胁。\n它的爪子一下就足以把人类打死."
LANGUAGE.description_ancient_nightmare				= "一个古老的梦魇，在这片土地上游荡了很久。\n它的身体经过多年的锻炼，变得更结实，移速减慢，但他仍然具有威胁."
LANGUAGE.description_devourer						= "一种可怕的骨骼和肌肉畸形，有一根可以投出的肋骨，刺入受害者体内，将他们卷走。\n它的速度不是很快，但它仍然非常危险."
LANGUAGE.description_pukepus						= "吐翔者的身体完全由产生毒素的器官组成。\n它能一次吐出几加仑的毒液，这使它非常危险。"
LANGUAGE.description_bonemesh						= "整个身体由畸形的脸部和肉块组成，投骨者能够投掷血弹。\n每颗炸弹都是由骨头和肉组成的，这些骨头和肉会在给其他僵尸加血的同时伤害人类。"
LANGUAGE.description_crow							= "腐肉乌鸦比感染前更像是一种害虫.\n它们以受感染的肉为食并变成 '感染体' 为亡灵.\n你为什么要让这个类不被隐藏?\n你怎么了?"
LANGUAGE.description_wilowisp						= "一个从黑暗中诞生的亡灵\n造成的伤害很小，但能够致盲人类，并在被杀死时爆炸。\n几乎不会让人恐慌."
LANGUAGE.description_coolwisp						= "一个从南极诞生的亡灵，它能减缓人类的移动速度和攻击速度\n冰霜降低枪械的射击速度和换弹速度。"
LANGUAGE.description_zombie_torso					= "You shouldn't even be seeing this."
LANGUAGE.description_zombie_legs					= "You shouldn't even be seeing this."
LANGUAGE.description_wraith							= "僵尸还是幽灵？\n没有人知道他们的目的\n独特的隐身能力和锋利的爪子把东西切成麻瓜。"
LANGUAGE.description_tormented_wraith				= "一个更扭曲的幽灵。\n这种变种能够在受到伤害后变得疯狂，加速攻击和移动.\n它们的攻击速度要快得多，但每次攻击造成的伤害要小得多.\n"
LANGUAGE.description_fast_zombie_torso				= "You shouldn't even be seeing this."
LANGUAGE.description_fast_zombie_torso_slingshot	= "You shouldn't even be seeing this."
LANGUAGE.description_fast_zombie_legs				= "You shouldn't even be seeing this."
LANGUAGE.description_chem_burster					= "整个身子由挥发性有毒化学物质组成。\n它除了被杀死希望在附近的人类旁边爆炸之外，没有其他攻击手段。"
LANGUAGE.description_shade							= "通过在自己周围创造一个强大的磁场和一个单向的盾牌，所有的子弹和投掷物都变得无用，直到盾牌被摧毁。\n它们可以将任何未固定的物体以高速抛向人类，造成毁灭性的影响。"
LANGUAGE.description_frostshade						= "冰霜万磁怪制造的护盾和投射物比普通的护盾，但是一旦冰霜被粉碎，它就会杀伤人类.\n寒冷会减缓他们的行动，冰冻他们的武器，使他们的射击速度减慢."
LANGUAGE.description_butcher						= "一个疯狂的僵尸屠夫。任何不幸到它附近的人都会被它被撕成碎片。"
LANGUAGE.description_gravedigger					= "一个精神错乱的僵尸。它挥舞着一把用骨头做成的铲子。"
LANGUAGE.description_flesh_creeper					= "筑钱者拥有筑巢的能力。\n从这些巢穴中会出现的其他僵尸生物。\n他们的筑巢方式是未知的，但当务之急是摧毁所有的巢穴和筑巢者。"
LANGUAGE.description_gore_child						= "一个僵尸化的婴儿，未出生的孩子也会受到感染。\n他们没有特殊的能力，他们的力量来自于他们的数量。"
LANGUAGE.description_giga_gore_child				= "这是一个长期被感染孩子的结果。令人恐怖的是，他们庞大的身体是僵尸干细胞的结果。\n他们也成了僵尸婴儿的首领，他们总是被发现和它在一起。"
LANGUAGE.description_giga_shadow_child				= "一个堕落的孩子能够刺激人类的视觉。\n比其他儿童更不结实，但对近战武器有很高的抵抗力。\n它创造的投掷物具有同样的抵抗力和视觉模糊能力。"
LANGUAGE.description_shadow_gore_child				= "一个从黑暗中诞生的婴儿"
LANGUAGE.description_asskicker						= "是时候去提一提敌人的Ass了."
LANGUAGE.description_shitslapper					= "这个踢敌人?"
LANGUAGE.description_doomcrab						= "一种巨大的头蟹，跳到受害者身上压碎他们。\n也有投掷虚弱之球的能力来让敌人虚弱."
LANGUAGE.description_red_marrow						= "变异的红细胞增多症赋予红骨排出大量血液的能力。\n受到200的伤害后，会产生一个血盾，这使得红骨免疫绝大部分伤害。"
LANGUAGE.description_skeletal_walker				= "骷髅虽然没有太多的生命，但是子弹对它们的伤害很小。"
LANGUAGE.description_skeletal_shambler				= "一种骨骼的庞然大物，速度不行，但也能承受最小的子弹伤害。\n它们也有能力制造席卷人类"
LANGUAGE.description_skeletal_lurker				= "失去双腿功能的骷髅战士\n骷髅虽然没有太多的生命，但是子弹对它们的伤害很小。"
LANGUAGE.description_shadow_lurker					= "极难在黑暗中看到，并抵抗近战攻击。它的攻击会致盲人类。"
LANGUAGE.description_shadow_walker					= "暗影潜伏者的一种进化形式，行动不便。\n在黑暗中很难被看见，并且能抵抗近战攻击。它的攻击会致盲人类."
LANGUAGE.description_lacerator						= "撕裂者在几乎所有方面都与快速僵尸相同。\n尽管它们有相似之处，但它们甚至更具杀伤力。"
LANGUAGE.description_lacerator_charging				= "尽管这些僵尸有这巨大的身体，但他们在冲锋时却能跑得很快.\n他们冲锋的力量能把任何人都打倒."
LANGUAGE.description_eradicator						= "死亡和毁灭的使者。需要大量的火力才能消灭他。\n除非头部中枪，否则他们几乎可以保证再次站起来。"
LANGUAGE.description_howler							= "一个发出刺耳尖叫的可怕的巨人.\n它的嚎叫能够强化僵尸，并让人类恐慌."
LANGUAGE.description_extinctioncrab					= "邪恶的疾病在这个巨大的头蟹体内。它吐出的孢子会折磨它附近的人，降低治愈的效果。"
LANGUAGE.description_yongying					=  "感染病毒的鸡精会士兵\n他是可以拿枪滴！现在用枪去射爆这些闸总人类吧."
LANGUAGE.description_biochemicalZombie      = "身体由许多化学物质组成\n唯一的攻击方式就是死在人类身边自爆"
LANGUAGE.description_espionage              = "敏捷并且非常的危险！它们会伪装成你的队友，然后发动偷袭！"
LANGUAGE.description_nugget                 = "外观上与普通的猎头蟹一样，但是可别小看它，它的牙齿极为锋利！可以轻易撕裂人类！"

-- Class control schemes
LANGUAGE.controls_zombie							= "> 左键: 爪子攻击\n> 右键: 尖叫\n> R键: 呻吟\n> Shift: 假死\n> 腿部致命一击: 复活 / 转换(躯干或腿部)"
LANGUAGE.controls_zombie_gore_blaster				= "> 左键: 爪子攻击\n> 击中人类: 流血\n> 右键: 尖叫\n> Shift: 假死\n> 死亡: 血液冲击"
LANGUAGE.controls_poison_zombie						= "> 左键: 爪子攻击\n> 右键: 突袭攻击\n> R键: 尖叫"
LANGUAGE.controls_wild_poison_zombie				= "> 左键: 爪子攻击\n> 右键: 突袭攻击\n> R键: 尖叫"
LANGUAGE.controls_fast_zombie						= "> 左键: 爪子攻击\n> 右键: 突袭攻击 / 爬墙(靠近墙壁)\n> R键: 尖叫\n> 腿部致命一击: 转换(躯干或腿部)"
LANGUAGE.controls_fast_zombie_slingshot				= "> 左键: 爪子攻击\n> 右键: 弹射攻击(转换为躯干僵尸) / 爬墙(靠近墙壁)\n> R键: 尖叫\n> 弹射攻击命中人类: 造成减速"
LANGUAGE.controls_bloated_zombie					= "> 左键: 爪子攻击\n> 右键: 呻吟\n> Shift: 假死\n> 死亡: 中毒爆炸"
LANGUAGE.controls_vile_bloated_zombie				= "> 左键: 爪子攻击\n> 右键: 喷射毒液\n> Shift: 假死"
LANGUAGE.controls_fresh_dead						= "> 左键: 爪子攻击\n> 右键: 尖叫\n> Shift: 假死"
LANGUAGE.controls_agile_dead						= "> 左键: 爪子攻击\n> 右键: 爬墙(靠近墙壁)"
LANGUAGE.controls_ghoul								= "> 左键: 毒爪攻击\n> 右键: 投掷减速粘液\n> Shift: 假死\n> R键: 尖叫\n> 击中人类: 造成减速和易损"
LANGUAGE.controls_chilled_ghoul						= "> 左键: 霜冻之爪\n> 右键: 投掷霜冻冰块\n> Shift: 假死\n> R键: 尖叫\n> 击中人类: 造成霜冻效果(减少攻击速度和移动速度)"
LANGUAGE.controls_frigid_revenant					= "> 左键: 霜冻&致盲之爪\n> 右键: 投掷霜冻&致盲冰块\n> 击中人类: 霜冻和致盲(减少攻击速度和移动速度且减少视野可见度)"
LANGUAGE.controls_elderghoul						= "> 左键: 毒爪攻击\n> 右键: 喷射毒液\n> R键: 尖叫\n> 受到伤害时: 毒液喷射"
LANGUAGE.controls_noxiousghoul						= "> 左键: 毒爪攻击\n> 右键: 投掷减速粘液\n> R键: 尖叫\n> 受到伤害时: 毒液喷射\n> 击中人类: 造成中毒和易损"
LANGUAGE.controls_headcrab							= "> 左键: 突袭攻击\n> R键: 潜行"
LANGUAGE.controls_fast_headcrab						= "> 左键: 突袭攻击"
LANGUAGE.controls_bloodsucker_headcrab				= "> 左键: 突袭攻击\n> 击中人类: 流血并治愈少量生命值"
LANGUAGE.controls_poison_headcrab					= "> 左键: 突袭攻击\n> 右键: 发射毒刺\n> 击中人类: 造成中毒\n> 命中眼睛: 造成致盲和流血\n> R键: 尖叫"
LANGUAGE.controls_barbed_headcrab					= "> 左键: 突袭攻击\n> 右键: 喷射毒液\n> 击中人类: 造成流血\n> R键: 尖叫"
LANGUAGE.controls_the_tickle_monster				= "> 左键: 弹力之爪\n> 右键: 呻吟"
LANGUAGE.controls_nightmare							= "> 左键: 死亡之触\n> 右键: 呻吟"
LANGUAGE.controls_ancient_nightmare					= "> 左键: 死亡之爪\n> 右键: 呻吟"
LANGUAGE.controls_devourer							= "> 左键: 爪子攻击\n> 右键: 用投骨标枪拉扯目标"
LANGUAGE.controls_pukepus							= "> 左键: 喷射毒液\n> 受到伤害时: 毒液喷射\n> 死亡: 中毒爆炸"
LANGUAGE.controls_bonemesh							= "> 左键: 爪子攻击\n> 右键: 投掷血肉炸弹"
LANGUAGE.controls_wraith							= "> 左键: 爪子攻击\n> 右键: 尖叫\n> 基于移动和查看距离的隐身性"
LANGUAGE.controls_tormented_wraith					= "> 左键: 爪子攻击\n> 右键: 尖叫\n> 基于移动和查看距离的隐身性\n> 受到低于 70 HP 的伤害时会狂暴"
LANGUAGE.controls_chem_burster						= "> 左键: 死亡冲锋\n> 死亡: 毒液喷射 (基于充电时间的功率)"
LANGUAGE.controls_shade								= "> 左键: 投掷(需要跟R键和右键配合)\n> 右键: 控制物体\n> R键: 从地面拉起石头\n> Shift: 盾牌(持续充能)"
LANGUAGE.controls_frostshade						= "> 左键: 投掷\n> 右键: 控制物体\n> R键: 从地面拉起冰块\n> Shift: 霜冻盾牌(持续充能)"
LANGUAGE.controls_butcher							= "> 左键: 疯狂挥斩"
LANGUAGE.controls_gravedigger						= "> 左键: 巨力之爪"
LANGUAGE.controls_flesh_creeper						= "> 左键: 粉碎攻击\n> 右键: 筑巢\n> R键: 飞行"
LANGUAGE.controls_gore_child						= "> 左键: 爪子攻击"
LANGUAGE.controls_giga_gore_child					= "> 左键: 粉碎攻击\n> 右键: 投掷小熊孩子\n> R键: 击倒呐喊"
LANGUAGE.controls_giga_shadow_child					= "> 左键: 粉碎攻击\n> 右键: 投掷小暗影熊孩子\n> R键: 击倒呐喊且造成视野模糊\n> 击中人类: 造成致盲\n> 受到来自近战伤害: 降低来自近战的伤害"
LANGUAGE.controls_shadow_gore_child					= "> 左键: 爪子攻击\n> 命中人类: 造成致盲\n> 受到来自近战伤害: 降低来自近战的伤害"
LANGUAGE.controls_asskicker							= "> 左键: 左踢腿攻击\n> 右键: 右踢腿攻击"
LANGUAGE.controls_shitslapper						= "> 左键: 巨爪攻击"
LANGUAGE.controls_doomcrab							= "> 左键: 跳跃攻击\n> 右键: 厄运之球"
LANGUAGE.controls_red_marrow						= "> 左键: 爪子攻击\n> 右键: 尖叫\n> 每受到 200 次伤害: 发动血液护盾(血液护盾持续时间无敌)"
LANGUAGE.controls_skeletal_walker					= "> 左键: 爪子攻击\n> 右键: 尖叫\n> R键: 呻吟\n> Shift: 假死\n> 被子弹击中: 降低来自子弹的伤害"
LANGUAGE.controls_skeletal_shambler					= "> 左键: 爪子攻击\n> 右键: 尖叫\n> R键: 呻吟\n> Shift: 假死\n> 被子弹击中: 降低来自子弹的伤害\n> 腿部致命一击: 复活"
LANGUAGE.controls_skeletal_lurker					= "> 左键: 爪子攻击\n> 右键: 呻吟\n> 被子弹击中: 降低来自子弹的伤害"
LANGUAGE.controls_wilowisp							= "> 左键: 震撼大地\n> 右键: 呻吟\n> 死亡: 致盲爆炸"
LANGUAGE.controls_coolwisp							= "> 左键: 霜冻大地\n> 右键: 呻吟\n> 死亡: 霜冻爆炸"
LANGUAGE.controls_shadow_lurker						= "> 左键: 爪子攻击\n> 命中人类: 降低视野可见度\n> 受到来自近战伤害: 降低来自近战的伤害"
LANGUAGE.controls_lacerator							= "> 左键: 爪子攻击\n> 右键: 突袭攻击 / 爬行(靠近墙壁)\n> R键: 尖叫"
LANGUAGE.controls_lacerator_charging				= "> 左键: 流血之爪\n> 击中人类: 造成流血\n> 右键: 冲锋\n> R键: 尖叫"
LANGUAGE.controls_eradicator						= "> 左键: 爪子攻击\n> 右键: 尖叫\n> 致命一击: 复活"
LANGUAGE.controls_howler							= "> 左键: 爪子攻击\n> 右键: 怒吼\n> R键: 呻吟"
LANGUAGE.controls_extinctioncrab					= "> 左键: 突袭攻击\n> 右键: 灭绝孢子"
LANGUAGE.controls_biochemicalZombie       = "> 死亡：毒液爆炸\n> 被动：50码范围内的人类持续受到来自你的伤害(每秒造成1点伤害)"
LANGUAGE.controls_espionage               = "> 左键：攻击\n> 被动：你背刺敌人造成双倍伤害"
LANGUAGE.controls_nugget                  = "> 左键：突袭攻击\n> R键：潜行(潜行状态下你免疫近战和子弹的伤害)"

-- The help file... Quite big! I wouldn't blame you if you didn't translate this part.
LANGUAGE.help_cat_introduction						= "介绍"
LANGUAGE.help_cat_survival							= "幸存者"
LANGUAGE.help_cat_barricading						= "路障系统"
LANGUAGE.help_cat_upgrades							= "升级改造"
LANGUAGE.help_cat_being_a_zombie					= "关于僵尸"
LANGUAGE.help_cont_introduction						= [[<p>    欢迎来到《僵尸生存》，这是一款（僵尸）生存模拟器。ZS允许你对抗僵尸的攻击，创建防线，甚至成为僵尸的一部分。</p>

<p>有两支队伍：幸存者和僵尸。如果人类能在每一波中存活下来，他们就会获胜。有些关卡有特殊的目标需要完成，这些目标可能是可选的，也可能是获胜的必要条件。
如果人类被杀，那么他们会作为僵尸回来，这使得剩下的人类更加困难。</p>

<p>僵尸的目标是杀死所有的人类，使他们都成为僵尸，导致每个人都输掉这一轮。
另外，一个僵尸可以杀死四个人类来获得救赎。这使他们有了第二次生存和胜利的机会。
记住，赢得一个回合的唯一方法是在回合结束时是幸存者. 严格来说，僵尸不能赢得游戏，僵尸只能让其他人都输掉!</p>

<p>一定数量的人被选中（或自愿）成为起始僵尸。这个数量在回合开始前显示在你的屏幕底部。</p>

<p><b>使用上面的按钮来获得更多具体事物的帮助。</b></p>

<p>本节小贴士:
<ul><li>如果你以人类身份离开游戏，那么你将以僵尸身份重新加入。</li>
<li>在一定的时间过去后，即使是新玩家也会作为僵尸加入游戏</li>
<li>当你需要只和本队说话时,默认情况下按U可以和自己阵营说话</li>
</ul></p>
]]
LANGUAGE.help_cont_survival							= [[<p>本节小贴士:
<ul><li>按住ZOOM键（默认：Z）可以让你在极慢的行走中自由地穿越路障。</li>
<li>你只能在回合休息购买更多的物品，如武器和弹药，但你也可以从倒下的战友身上抢夺弹药、武器和工具。</li>
<li>如果人类被僵尸直接杀死，那么无论他们站在哪里，都会重新复活。请确保在他们在把你杀了之前干掉他们。</li>
<li>你只有一定数量的Worth点数(初始点数)来购买东西，所以要仔细考虑你购买什么!</li>
<li>你可以通过按F2键创建、保存、加载、删除和标记为默认购物车。 这节省了大量的时间，这些时间可以更好地用于建造防线或规划本局游戏。</li>
<li>一会儿觉得安全的地方可能是一个死亡陷阱，有更多或不同类型的僵尸在周围游荡。如果事情变得不妙，一定要留出退路和 "B计划"。</li>
<li>如果你不做任何事情来帮助你的团队，你就没有用处。你对自己更是毫无用处，因为你没有得到任何积分或更大的武器!</li>
<li>通过按住你的Shift键约10秒钟，同时看着你拥有的部署对象，你可以把它们打包，以便以后使用。</li>
<li>没有主人的炮塔(蓝光)可以通过按E来重设主人。没有主人的炮塔将不会扫描目标!</li>
<li>没有钉住的素材不是好素材,除非他们真的很重</li>
<li>只要有足够的伤害,门就可以拆下来.</li>
<li>大多数道具会随着越来越多的伤害而变成红色。</li>
<li>如果附近没有人的话，僵尸可以在巢穴复活</li>
<li>大多数近战武器的攻击范围都比僵尸的爪子长。如果你坚持用近战武器防守，请利用这一点</li>
<li>同一队的玩家不会互相伤害或碰撞，可以自由地射击，穿过对方。</li>
<li>确保你利用有防线的优势，呆在防线后面，与僵尸保持一定距离。枪支有无限的射程，僵尸的爪子则没有。</li>
<li>中毒效果会随着时间推移而减弱,但如果你不治疗,仍然可以杀死你</li>
<li>你的队友不一定总是正确的,不要沉默寡言，多沟通</li>
<li>僵尸可以看到你的健康状况，甚至透过墙壁。受伤时一定要退后，因为僵尸很可能会试图进攻你。</li>
<li>不要躲藏，僵尸可以通过墙壁和完全黑暗的环境感知你。.</li>
<li>屏幕底部的 "部落表 "显示你有多少伤害和击退阻力。在攻克据点时，与其他僵尸挤在一起，可以获得很大的抵抗力!</li>
<li>如果你没有足够的僵尸来攻下一个防线，可以尝试在其他地方获取新的 "队友"。</li>
<li>不要在绿色气体中射击僵尸! 它能迅速治愈他们，而你只是在浪费弹药!</li>
<li>僵尸对胸部的伤害有抵抗力，对胳膊和腿的伤害更是如此。确保你的目标是头部，因为如果你不这样做，有些僵尸有能力再次站起来。!</li>
<li>虽然僵尸在腿部受到的伤害较小，但在那里开枪会让它们在短时间内减速，足以让你或团队成员逃跑.</li>
</ul></p>
]]
LANGUAGE.help_cont_barricading						= [[<p>防线是生存中极其重要的部分。看起来僵尸在早期并不构成威胁，但最终它们会强大到足以在几秒钟内杀死你的整个团队。</p>

<p>唯一能阻止僵尸进入的是建造良好且维护良好的防线。</p>

<p>有几个工具可以让您进行设置。一个最有用的工具是锤子和钉子。这使您可以确定道具,僵尸必须拆掉防线才能把你击杀。
通过按E来定位要钉住的道具，将其捡起。您可以在按住Shift让素材不乱动,但人可以走动。 然后拿锤子用右键对着物品，这样它就被钉起来了.最好将道具钉在坚固的物体上，例如墙壁而不是其他道具。
请记住，当道具被钉住时，它会将它对钉子本身的伤害传递给钉子本身。 您可以通过用锤子敲击钉子来修复钉子，但最终它们因无法使用而废弃。 您可以在拿出锤子的情况下按住Shift，以查看屏幕上部署的每个钉子以及所有者。
如果您认为钉子的位置不好，或者想重新定位道具，可以通过指向钉子并按R键来移除钉子。请注意，如果您移除不属于您的钉子，那么您将被处以罚款。
还有一件事要记住：一般来说较大较重的物品血量也厚,记得钉4个钉子来是血量达到最大值</p>

<p>另一个工具是“宙斯盾”路障套件。这个快速部署工具允许您在任何表面上放置木板或将它们部署在两面墙之间。 它甚至不需要道具。当可以放置木板时,预览图会变绿来提醒您。
按左键来放置木板.按右键或R键来旋转你要放置的角度.它使用板子作为弹药，所以你从板包(国服通常被翻译为垃圾包)中获得的板子可以作为额外的弹药！ 您可以通过按Shift来回收已经放置的木板。</p>

<p>另一个值得注意的工具是炮塔.它会自动攻击挡住激光(通常是绿光)的僵尸. 您可以通过按E键来补充弹药。这将为您提供帮助团队的奖励积分。
放置炮塔需要让预览图变为绿色. 它必须在地面或者墙壁上(素材上不行). 使用右键和R键来旋转炮塔。如果你搞砸了，你可以通过按Shift来回收炮塔。 请记住，炮塔只会向穿过其跟踪光束的僵尸开火。</p>

<p>本节提示:
<ul>
<li>杀死正在攻击防线的僵尸可获得 25% 的额外点数加成！</li>
<li>记得建造防线的时候给自己留射击孔.</li>
</ul></p>]]
LANGUAGE.help_cont_upgrades							= [[<p>点数是通过杀死僵尸、治疗队友和建立防御来获得的。
然后，您可以在附近有商店的情况下按F2或者对商店按E来购买物品。</p>

<p>本节提示:
<ul>
<li>尝试提前计划,好好利用初始商店(就是Worth的那个)</li>
<li>你仍然可以获得助攻得分。高一半的积分归击杀者所有，较小的一半归协助击杀的人。</li>
<li>初始点数(游戏开始前绿色,左下角的那个)和点数(游戏开始后左上角那个)</li>
<li>攻击商店和补给箱对僵尸来说是很有价值的,所以记得保护好他们(注释:在默认情况在水晶是不具备商店的功能的,所以你商店爆了就等死吧)</li>
<li>你可以在回合开始前或者开始后按F2去购买BUFF(饰品,就是图标是钻石的那一栏)去购买随身商店.注意随身商店会阻挡炮塔,重组机的放置.</li>
</ul></p>]]
LANGUAGE.help_cont_being_a_zombie					= [[<p>本节提示:
<ul>
<li>你有无限的生命，人类只有一个。不要害怕攻击，攻击，攻击！(托词geigei！)</li>
<li>如果没有人类在周围看到僵尸，僵尸可以相互叠加生成。检查屏幕底部骷髅头的眼睛。如果它们是绿色的，那么你就是一个有效的生成点!</li>
<li>只要有足够的练习（应该就是指技术,带物理学家)，你可以使用道具从远处将它们撞向人类。物理杀警告！</li>
<li>摧毁炮塔等可部署物品，尤其是商店和补给箱，使人类瘫痪.</li>
<li>只要有足够的伤害，门就可以从铰链上拆下来。</li>
<li>大多数物品会随着越来越多的伤害而变红。</li>
<li>幽灵在静止不动或远处站立时是完全看不见的。</li>
<li>快速僵尸的右键攻击伤害取决于你在空中的时间长短。您获得的空气时间越多，伤害就越大。近距离使用爪子攻击！</li>
<li>毒僵尸还可以撕下自己的毒肉块，并通过按R键位将它们扔给人类。</li>
<li>大多数僵尸爪子有两次机会击中目标.如果你在点击鼠标按钮时“击中”你的目标，那么只要他们保持在范围内，你就保证被击中。</li>
<li>毒头蟹的毒球如果击中人类的头部，会致盲人类。</li>
<li>去找滴血量的人！其他僵尸也被它们所吸引，所以它们应该是最简单的目标。</li>
<li>屏幕底部的危险指示您有多少伤害和击退抗性。与其他僵尸挤在一起，在摧毁据点时进行大抵抗！(机翻,没看懂啥意思可能是僵尸聚在一块会有伤害减免)</li>
<li>如果你没有足够的僵尸来拆除防线，试着在其他地方寻找新的'队友'。</li>
<li>如果某个区域太暗，请尝试按下手电筒按钮(默认是F)切换夜视功能(觉得太刺眼按F4设置里面关掉高级处理还是什么的就好了.)。</li>
</ul></p>
]]

-- Place any custom stuff below here...
