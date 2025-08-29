local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\56-59Plaguelands',
  [[
author TUGs
next GENERATED\\59-60BS
startlevel 56
step
accept Demon Dogs##5542
step
accept Carrion Grubbage##5544
step
accept Blood Tinged Skies##5543
step
Do the 3 quests on the side now
step
turnin Sister Pamela##5601
step
accept Pamela's Doll##5149
step
Do: Pamela's Doll |q 5149
step
turnin Pamela's Doll##5149
step
accept Auntie Marlene##5152
step
accept Uncle Carlin##5241
step
turnin Duke Nicholas Zverenhoff##6030
step
turnin Uncle Carlin##5241
step
accept Defenders of Darrowshire##5211
step
accept Zaeldarr the Outcast##6021
step
Finish the 3 Tirionquests (Demon Dogs, Carrion Grubbage & Blood Tinged Skies)
step
Do: Defenders of Darrowshire |q 5211
step
turnin Demon Dogs##5542
step
turnin Carrion Grubbage##5544
step
turnin Blood Tinged Skies##5543
step
accept Redemption##5742
step
Do: Redemption |q 5742
step
turnin Redemption##5742
step
accept Of Forgotten Memories##5781
step
Do: Of Forgotten Memories |q 5781
step
Do: Zaeldarr the Outcast |q 6021
step
accept Hameya's Plea##6024
step
turnin Of Forgotten Memories##5781
step
accept Of Lost Honor##5845
step
turnin Zaeldarr the Outcast##6021
step
turnin Defenders of Darrowshire##5211
step
use Hearthstone##6948
step
turnin Return to Chillwind Camp##5223
step
accept Target: Gahrron's Withering##5225
step
turnin Auntie Marlene##5152
step
accept A Strange Historian##5153
step
Do: A Strange Historian |q 5153
step
turnin A Strange Historian##5153
step
accept The Annals of Darrowshire##5154
step
accept A Matter of Time##4971
step
Do: The Annals of Darrowshire |q 5154
step
Do: A Matter of Time |q 4971
step
turnin The Annals of Darrowshire##5154
step
turnin A Matter of Time##4971
step
accept Brother Carlin##5210
step
fpath Eastern Plaguelands
step
turnin Brother Carlin##5210
step
accept Villains of Darrowshire##5181
step
accept Heroes of Darrowshire##5168
step
Do: Of Lost Honor |q 5845
step
Do: Hameya's Plea |q 6024
step
turnin Troubled Spirits of Kel'Theril##5245
step
accept Fragments of the Past##5246
step
Do: A Plague Upon Thee |q 5903
step
Do: Villains of Darrowshire |q 5181
step
Do: TODO: Add specific questparts |q 5181
step
turnin Hameya's Plea##6024
step
turnin Of Lost Honor##5845
step
accept Of Love and Family##5846
step
Do: Heroes of Darrowshire |q 5168
step
turnin Target: Gahrron's Withering##5225
step
accept Return to Chillwind Camp##5226
step
turnin Of Love and Family##5846
step
accept Of Love and Family##5848
step
turnin Return to Chillwind Camp##5226
step
turnin Mission Accomplished!##5238
step
turnin A Plague Upon Thee##5903
step
accept A Plague Upon Thee##5904
step
Do: A Plague Upon Thee |q 5904
step
turnin A Plague Upon Thee##5904
step
accept A Plague Upon Thee##6389
step
accept Unfinished Business##6004
step
Do: Unfinished Business |q 6004
step
turnin Unfinished Business##6004
step
accept Unfinished Business##6023
step
Do: Unfinished Business |q 6023
step
Do: TODO: Add specific questparts |q 6023
step
turnin Unfinished Business##6023
step
accept Unfinished Business##6025
step
If youre in a group do the next step,if not skip it
step
Do: TODO: Add specific questparts |q 5168
step
Do: Unfinished Business |q 6025
step
turnin Unfinished Business##6025
step
fpath Eastern Plaguelands
step
turnin Villains of Darrowshire##5181
step
turnin Heroes of Darrowshire##5168
step
fpath Ironforge
]]
)
