
--
-- Copyright (C) 2020 Taxin2012
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--



--	Writed by Taxin2012
--	https://steamcommunity.com/id/Taxin2012/



PLUGIN.GunData[ "tfa_ins2_ak74m" ] = {
	--Weapon can be Blacklisted and item will be not auto-generated
	BlackList = false,
	
	Slot = "primary",
	Model = "path_to_model_of_item",
	iconCam = {
		tpos = Vector( 0, 0, 0 ),
		tang = Angle( 0, 0, 0 ),
		tfov = 0
	},
	Width = 4,
	Height = 2,
	Weight = 3,
	Price = 2000,
	
	--Weapon Parameters
	--Prim == Primary
	Prim = {
		Ammo = "assault",
		Damage = 31,
		KickUp = 0.4,
		KickDown = 0.4,
		KickHorizontal = 0.35,
		Spread = .021,
		IronAccuracy = .01
	},
	
	--Sec == Secondary
	Sec = {}
}

PLUGIN.GunData[ "rw_sw_dc15a_o" ] = {
	Name = "DC-15A",
	Slot = "primary",
	Category = "Клоническое оружие",
	Model = "models/sw_battlefront/weapons/dc15a_rifle.mdl",
	iconCam = {
    pos = Vector(-15, -197, -19),
    ang = Angle(-6, 88.561, 0),
    fov = 13
	},
	Width = 4,
	Height = 2,
	Desc = "Стандартная бластерная автоматическая винтовка армии Республики и подразделений клонов. Крайне скорострельная и имеет большой магазин, однако мощностей не хватает для большого урона. Тем не менее, это оружие является отличным выбором для штурмовых подразделений.",
	Price = 3000,
	Firerate = 430,
	Damage = 35,
	MagazineCapacity = 45,
	Accuracy = 0.025,
}

PLUGIN.GunData[ "rw_sw_dc15s" ] = {
	Name = "DC-15S",
	Slot = "primary",
	Category = "Клоническое оружие",
	Model = "models/sw_battlefront/weapons/dc15s_carbine.mdl",
	iconCam = {
    pos = Vector(-11, -197, -20),
    ang = Angle(-6, 88.561, 0),
    fov = 6
	},
	Width = 3,
	Height = 2,
	Desc = "Бластерный автоматический точный карабин для клонов-солдат. Является удешевленной модификацией винтовки DC-15A и обладает уменьшенной скорострельностью и магазином на двадцать выстрелов, однако обладает повышенной точностью и пробивной способностью. Хорошее оружие для стрелков поддержки.",
	Price = 1000,
	Firerate = 205,
	Damage = 50,
	MagazineCapacity = 20,
	Accuracy = 0.015,
}

PLUGIN.GunData[ "rw_sw_dc15x" ] = {
	Name = "DC-15X",
	Slot = "primary",
	Category = "Клоническое оружие",
	Model = "models/cs574/weapons/dc15x.mdl",
	iconCam = {
    pos = Vector(-19, -197, -19),
    ang = Angle(-6, 88.561, 0),
    fov = 16
	},
	Width = 5,
	Height = 2,
	Desc = "Снайперская полуавтоматическая модификация для винтовки DC-15A. Крайне высокая точность, убойность и дальность соседствуют с крайне скудной скорострельностью, очень малым магазином, большим весом и нулевой эргономикой. Имеет оптику высокой кратности, позволяющую держать приличную дистанцию, ведя эффективный и прицельный огонь. Идеальна для ликвидации целей высокой важности.",
	Price = 5000,
	Firerate = 50,
	Damage = 140,
	MagazineCapacity = 6,
	Accuracy = 0.001,
	Rarity = 3,
}

PLUGIN.GunData[ "rw_sw_dc17" ] = {
	Name = "DC-17",
	Slot = "sidearm",
	Category = "Клоническое оружие",
	Model = "models/sw_battlefront/weapons/dc17_blaster.mdl",
	iconCam = {
    pos = Vector(-5.147154, 84.922607, 6.976974),
    ang = Angle(4.435, 272.247, 0.000),
    fov = 9
	},
	Width = 2,
	Height = 1,
	Desc = "Бластерный пистолет армии Республики и клонических подразделений. Часто встречается у коммандос, разведчиков, санитаров в самых разных вариациях. Несмотря на малый размер, все еще обладает хорошим магазином и способен помочь выжить в критической ситуации.",
	Price = 300,
	Firerate = 315,
	Damage = 25,
	MagazineCapacity = 15,
	Accuracy = 0.03,
}

PLUGIN.GunData[ "rw_sw_dc17s" ] = {
	Name = "DC-17S",
	Slot = "sidearm",
	Category = "Клоническое оружие",
	Model = "models/fisher/dc17s/dc17s.mdl",
	iconCam = {
	pos = Vector(307.9, 34.91, 145.03),
	ang = Angle(25.29, 186.03, 0),
	fov = 4.92
},
	Width = 3,
	Height = 1,
	Desc = "Автоматическая облегченная модификация бластера DC-17. Данная модификация была специально сделана для противотанковых юнитов пехоты в качестве оружия самообороны. Автоматика данного бластера позволяет выдавать солидную скорострельность в малых габаритах, однако ценой за это послужила точность и мощность. Все еще способен дать отпор в тот момент, когда основное оружие неэффективно на близкой дистанции.",
	Price = 1200,
	Firerate = 450,
	Damage = 20,
	MagazineCapacity = 25,
	Accuracy = 0.045,
	Rarity = 1,
}

PLUGIN.GunData[ "rw_sw_dc17ext" ] = {
	Name = "DC-17M",
	Slot = "sidearm",
	Category = "Клоническое оружие",
	Model = "models/fisher/extendeddc17/extendeddc17.mdl",
	iconCam = {
    pos = Vector(-135.323250, -3.201272, 2.428876),
    ang = Angle(1.178, 3.483, 0.000),
    fov = 8
	},
	Width = 2,
	Height = 1,
	Desc = "Модификация стандартного пистолета DC-17 армии клонов. Имеет пониженную скорострельность и уменьшенный магазин, однако повышенную точность и мощность. Не попал в массовое производство из-за своей дороговизны и тяжести, но для солдат, предпочитающих мощность и точность в малых размерах, этот пистолет незаменим.",
	Price = 750,
	Firerate = 265,
	Damage = 45,
	MagazineCapacity = 8,
	Accuracy = 0.02,
	Rarity = 2,
}

PLUGIN.GunData[ "rw_sw_dual_dc17" ] = {
	Name = "Парные DC-17",
	Slot = "sidearm",
	Category = "Клоническое оружие",
	Model = "models/sw_battlefront/weapons/dc17_blaster.mdl",
	iconCam = {
    pos = Vector(-5.147154, 84.922607, 6.976974),
    ang = Angle(4.435, 272.247, 0.000),
    fov = 9
	},
	Width = 2,
	Height = 2,
	Desc = "Парные пистолеты DC-17 с кустарной модификацией для стрельбы с двух рук. Спусковой крючок был сильно облегчен, что позволяет стрелять быстрее, чем с обычных бластеров, однако точность из-за отсутствия прицельной стрельбы сильно страдает. Очень популярны у капитанов и командиров, которые хотят поливать своего противника градом плазменных снарядов.",
	Price = 650,
	Firerate = 400*2,
	Damage = 25,
	MagazineCapacity = 30,
	Accuracy = 0.06,
	Rarity = 1,
}

PLUGIN.GunData[ "rw_sw_dp23" ] = {
	Name = "DP-23",
	Slot = "primary",
	Category = "Клоническое оружие",
	Model = "models/cs574/weapons/dp23.mdl",
	iconCam = {
    pos = Vector(-10, -197, -19),
    ang = Angle(-6, 88.561, 0),
    fov = 9
	},
	Width = 4,
	Height = 2,
	Desc = "Штурмовой полуавтоматический дробовик. Его кучность и точность оставляют желать лучшего, однако за возможность накрыть плазмой отряд противника на близкой дистанцией приходится платить дорого. Высокая скорострельность опустошает невысокий боезапас магазина крайне быстро, также как и испепеляет неприятеля, если эффективная дальность позволяет это сделать. Крайне популярен у штурмовых отрядов.",
	Price = 5000,
	Firerate = 250,
	Damage = 25,
	MagazineCapacity = 8,
	Accuracy = 0.5,
	Rarity = 1,
}

PLUGIN.GunData[ "rw_sw_z6" ] = {
	Name = "Z-6",
	Slot = "primary",
	Category = "Клоническое оружие",
	Model = "models/sw_battlefront/weapons/z6_rotary_cannon.mdl",
	iconCam = {
    pos = Vector(-24.859064, -183.075546, -17.458178),
    ang = Angle(-6.000, 88.561, 0.000),
    fov = 14
	},
	Width = 5,
	Height = 2,
	Desc = "Тяжелый роторный пулемет поддержки, используемый тяжелой пехотой в подразделениях солдат-клонов. Тяжелый и неудобный, однако если он раскрутится, то сможет без единого шанса для противника выкосить пехоту или даже уничтожить легкую бронетехнику. Бешеная скорострельность не только подавляет противника, но и быстро тратит плазму и выводит из строя газоблоки, так что рекомендуется носить с собой дополнительный боекомплект, чтобы в ответственный момент пулемет не остался без боеприпасов.",
	Price = 10000,
	Firerate = 1200,
	Damage = 20,
	MagazineCapacity = 250,
	Accuracy = 0.035,
	Rarity = 3,
}

PLUGIN.GunData[ "rw_sw_pinglauncher" ] = {
	Name = "Гранатный метатель",
	Slot = "sidearm",
	Category = "Клоническое оружие",
	Model = "models/sw_battlefront/weapons/pinglauncher.mdl",
	iconCam = {
    pos = Vector(-9, -197, -17),
    ang = Angle(-6, 88.561, 0),
    fov = 8
	},
	Width = 3,
	Height = 1,
	Desc = "Устройство механического метания гранатных снарядов. Легкий, эргономичный и компактный, стреляет снарядами, взрывающимеся сразу при попадании, однако требует перезарядки после каждого выстрела. Часто используется бойцами поддержки для уничтожения укреплений пехоты, станковых точек, баррикад или скоплений пехоты.",
	Firerate = 1000,
	Price = 8000,
	Damage = 200,
	Radius = 7,
	Rarity = 3,
}

PLUGIN.GunData[ "rw_sw_plx1" ] = {
	Name = "PLX-1",
	Slot = "primary",
	Category = "Клоническое оружие",
	Model = "models/props/starwars/weapons/rep_launcher.mdl",
	iconCam = {
	pos = Vector(-8, 60, 7.7),
	ang = Angle(-0.75, 270, 0),
	fov = 45
	},
	Width = 5,
	Height = 2,
	Desc = "Тяжелый ракетомет общего назначения, являющийся стандартным для пехоты поддержки в армии Республики. Выпускает снаряд, способный пробивать щиты и уничтожать цели с одного попадания, однако, он раскрывается поздно, из-за чего нужно держать ощутимое расстояние. Крайне большой и тяжелый, но эффективный против любой техники и, иногда, против тяжелой пехоты.",
	Price = 14000,
	Firerate = 1000,
	Damage = 500,
	Radius = 15,
	Rarity = 2,
}

PLUGIN.GunData[ "rw_sw_e60r" ] = {
	Name = "E60-R",
	Slot = "primary",
	Category = "Конфедеративное оружие",
	Model = "models/weapons/glcw_weps_battlefront/cis_rocket_launcher.mdl",
	iconCam = {
    pos = Vector(-160.761108, 15.201555, -0.944953),
    ang = Angle(-0.521, -0.348, 0.000),
    fov = 22
	},
	Width = 5,
	Height = 2,
	Desc = "Стандартный ракетомет для армии Конфедерации и дроидов в частности. При стрельбе выпускает ракету, которая может с одного попадания уничтожать как целый отряд пехотинцев, так и легкую, а иногда и тяжелую бронетехнику. Явно нежеланное оружие в руках противника, но крайне востребованное в собственных рядах. Особенно, если поблизости нет собственного ракетомета.",
	Price = 14000,
	Firerate = 1,
	Damage = 450,
	Radius = 12,
	Rarity = 2,
}

PLUGIN.GunData[ "bf2017_e5" ] = {
	Name = "E-5",
	Slot = "primary",
	Category = "Конфедеративное оружие",
	Model = "models/vsw/starwars/weapons/w_baw e-5.mdl",
	iconCam = {
    pos = Vector(-2, -197, -20),
    ang = Angle(-6, 88.561, 0),
    fov = 5.5
	},
	Width = 2,
	Height = 2,
	Desc = "Стандартный карабин армии дроидов и сил Конфедерации. Дешевизна и доступность в обращении сделали его очень массовым. Иногда его берут в руки и клоны, если им нужен еще более мелкий карабин, однако низкая точность, малый боезапас и посредственная скорострельность не делают это оружие желанным трофеем среди бойцов.",
	Price = 900,
	Firerate = 225,
	Damage = 30,
	MagazineCapacity = 25,
	Accuracy = 0.035,
}
PLUGIN.GunData[ "rw_sw_dc17m" ] = {
	Name = "DC-17m",
	Slot = "primary",
	Category = "Коммандос оружие",
	Model = "models/vsw/starwars/weapons/rc_weapons/w_dc-17m.mdl",
	iconCam = {
	pos = Vector(0, 38, 0),
	ang = Angle(0, 270, 0),
	fov = 42
	},
	Width = 3,
	Height = 2,
	Desc = "Конфигурационная боевая система, созданная специально для клонов-коммандос. Является модификацией DC-15A. Конкретно эта модель является бластерным карабином высокой точности с большим боезапасом и поразительной скорострельностью. Редкий образец вооружения, но идеальный для элитных войск.",
	Price = 900,
	Firerate = 500,
	Damage = 40,
	MagazineCapacity = 50,
	Accuracy = 0.01,
	Rarity = 4,
}
PLUGIN.GunData[ "rw_sw_dc17m_shotgun" ] = {
	Name = "DC-17m Штурмовой",
	Slot = "primary",
	Category = "Коммандос оружие",
	Model = "models/vsw/starwars/weapons/rc_weapons/w_dc-17m_antiarmor.mdl",
	iconCam = {
	pos = Vector(-1.65, -28.93, 0.24),
	ang = Angle(1.38, 87.63, 0),
	fov = 45
	},
	Width = 3,
	Height = 2,
	Desc = "Штурмовая конфигурация DC-17m, созданная для зачистки помещений или траншей. Малый боезапас компенсируется огромным уроном и скорострелностью, а также хорошей точностью как для дробовика. Отлично подойдет как для устранения одиночных, так и для групповых целей в узких пространствах.",
	Price = 900,
	Firerate = 275,
	Damage = 50,
	MagazineCapacity = 8,
	Accuracy = 0.04,
	Rarity = 4,
}
PLUGIN.GunData[ "rw_sw_dc17m_sniper" ] = {
	Name = "DC-17m Снайперский",
	Slot = "primary",
	Category = "Коммандос оружие",
	Model = "models/vsw/starwars/weapons/rc_weapons/w_dc-17m_sniper.mdl",
	iconCam = {
	pos = Vector(2.5, 42.5, 0),
	ang = Angle(0, 270, 0),
	fov = 45
	},
	Width = 4,
	Height = 2,
	Desc = "Снайперская конфигурация DC-17m. Огромная мощность, средняя скорострельность и невероятная точность позволяют снимать цели с большого расстояния за пару быстрых выстрелов. Боезапас ограничен всего пятью патронами, поэтому стоит целиться с умом.",
	Price = 900,
	Firerate = 180,
	Damage = 200,
	MagazineCapacity = 5,
	Accuracy = 0.001,
	Rarity = 4,
}

PLUGIN.GunData[ "bf2017_e5s" ] = {
	Name = "E5-S",
	Slot = "primary",
	Category = "ADMIN WEAPONS",
	Model = "models/weapons/glcw_weps_battlefront/cis_sniper_rifle.mdl",
	iconCam = {
    pos = Vector(-2, -197, -20),
    ang = Angle(-6, 88.561, 0),
    fov = 5.5
	},
	Width = 5,
	Height = 2,
	Desc = "Снайперская винтовка Конфедерации.",
	Price = 900,
	Firerate = 228,
	Damage = 120,
	MagazineCapacity = 30,
	Accuracy = 0.001337,
}

PLUGIN.GunData[ "bf2017_e5c" ] = {
	Name = "E5-С",
	Slot = "primary",
	Category = "ADMIN WEAPONS",
	Model = "models/weapons/glcw_weps_battlefront/rep_chaingun.mdl",
	iconCam = {
    pos = Vector(-2, -197, -20),
    ang = Angle(-6, 88.561, 0),
    fov = 5.5
	},
	Width = 4,
	Height = 2,
	Desc = "Пулемёт Конфедерации.",
	Price = 900,
	Firerate = 333,
	Damage = 30,
	MagazineCapacity = 100,
	Accuracy = 0.8814,
}

PLUGIN.GunData[ "bf2017_rg4d" ] = {
	Name = "RG-4D",
	Slot = "sidearm",
	Category = "ADMIN WEAPONS",
	Model = "models/sw_battlefront/weapons/dl44_pistol.mdl",
	iconCam = {
    pos = Vector(-2, -197, -20),
    ang = Angle(-6, 88.561, 0),
    fov = 5.5
	},
	Width = 2,
	Height = 1,
	Desc = "Пистолет Конфедерации.",
	Price = 900,
	Firerate = 200,
	Damage = 25,
	MagazineCapacity = 20,
	Accuracy = 0.1,
}