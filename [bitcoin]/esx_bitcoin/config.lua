Config              = {}
Config.MarkerType   = 23
Config.DrawDistance = 0
Config.ZoneSize     = {x = 3.0, y =3.0, z = 3.2}
Config.MarkerColor  = {r = 100, g = 204, b = 100}

--======BITCOIN=======

Config.TimeToFarmBitcoin = 10 * 1000

--====================
Config.Locale = 'en'


Config.OutCoords = {x = 263.13,	y = 2592.32,	z = 44.94}
Config.InCoords = {x = 1137.93,	y = -3198.71,	z = -39.67}

Config.OutCoordsPolice1 = {x = 452.16,	y = -984.1,	z = 26.67} -- edited
Config.InCoordsPolice1 = {x = 1848.51,	y = 3690.17,	z = 34.27}

Config.OutCoordsPolice2 = {x = -448.51,	y = 6008.09,	z = 31.72} -- edited
--Config.InCoordsPolice2 = {x = 417.4,	y = -1002.8,	z = -99.0}



Config.OutCoordsHospital_lossantos = {x = 315.45,y = -583.07,	z = 43.27} 
Config.OutCoordsHospital_sandy = {x = 1838.75,	y = 3673.6,	z = 34.28}
Config.OutCoordsHospital_paleto = {x = -248.68,	y = 6332.28,	z = 32.43}

Config.OutCoordsPolice_lossantos = {x = 452.16,y = -984.1,	z = 26.67} 
Config.OutCoordsPolice_sandy = {x = 1848.51,	y = 3690.17,	z = 34.27}
Config.OutCoordsPolice_paleto = {x = -448.51,	y = 6008.09,	z = 31.72}
Config.Morga = {x = 251.53,	y = -1370.05,	z = 24.54}

Config.pccomponents = {

	["cpui56400"] =   {comptype = 'cpu',label ='Процесор: i5-6400',socket = '1151-67',power = 10},
	["cpui56500"] =   {comptype = 'cpu',label ='Процесор: i5-6500',socket = '1151-67',power = 15},
    ["cpui56600"] =   {comptype = 'cpu',label ='Процесор: i5-6600',socket = '1151-67',power = 20},	
	["cpui56600k"] =  {comptype = 'cpu',label ='Процесор: i5-6600k',socket = '1151-67',power = 25},
	["cpui57400"] =   {comptype = 'cpu',label ='Процесор: i5-7400',socket = '1151-67',power = 30},
	["cpui57500"] =   {comptype = 'cpu',label ='Процесор: i5-7500',socket = '1151-67',power = 35},
	["cpui57600"] =   {comptype = 'cpu',label ='Процесор: i5-7600',socket = '1151-67',power = 40},
	["cpui57600k"] =  {comptype = 'cpu',label ='Процесор: i5-7600k',socket = '1151-67',power = 45},
	["cpui58500"] =   {comptype = 'cpu',label ='Процесор: i5-8500',socket = '1151-89',power = 50},
	["cpui58600"] =   {comptype = 'cpu',label ='Процесор: i5-8600',socket = '1151-89',power = 55},
	["cpui58600k"] =  {comptype = 'cpu',label ='Процесор: i5-8600k',socket = '1151-89',power = 60},
	["cpui59600"] =   {comptype = 'cpu',label ='Процесор: i5-9600',socket = '1151-89',power = 65},

    ["cpui77700"] =   {comptype = 'cpu',label ='Процесор: i7-7700',socket = '1151-67',power = 70},
	["cpui77700k"] =  {comptype = 'cpu',label ='Процесор: i7-7700k',socket = '1151-67',power = 75},
	["cpui78700"] =   {comptype = 'cpu',label ='Процесор: i7-8700',socket = '1151-89',power = 80},
	["cpui78700k"] =  {comptype = 'cpu',label ='Процесор: i7-8700k',socket = '1151-89',power = 85},
	["cpui79700"] =   {comptype = 'cpu',label ='Процесор: i7-9700',socket = '1151-89',power = 90},
	["cpui79700k"] =  {comptype = 'cpu',label ='Процесор: i7-9700k',socket = '1151-89',power = 95},

	["cpui99900"] =   {comptype = 'cpu',label ='Процесор: i9-9900',socket = '1151-89',power = 100},
	["cpui99900k"] =  {comptype = 'cpu',label ='Процесор: i9-9900k',socket = '1151-89',power = 105},
	["cpui97900x"] =  {comptype = 'cpu',label ='Процесор: i9-7900x',socket = '2066',power = 110},
	["cpui97920x"] =  {comptype = 'cpu',label ='Процесор: i9-7920x',socket = '2066',power = 115},
	["cpui97940x"] =  {comptype = 'cpu',label ='Процесор: i9-7940x',socket = '2066',power = 120},
	["cpui97960x"] =  {comptype = 'cpu',label ='Процесор: i9-7960x',socket = '2066',power = 125},
    ["cpui97980xe"] = {comptype = 'cpu',label ='Процесор: i9-7980xe',socket = '2066',power = 135},

    ["videocard960"] =   {comptype = 'videocard',label ='Видео Карта: GTX 960',power = 80},
	["videocard970"] =  {comptype = 'videocard',label ='Видео Карта: GTX 970',power = 160},
	["videocard980"] =   {comptype = 'videocard',label ='Видео Карта: GTX 980',power = 240},
	["videocard980ti"] =   {comptype = 'videocard',label ='Видео Карта: GTX 980ti',power = 250},
	["videocard1050"] =   {comptype = 'videocard',label ='Видео Карта: GTX 1050',power = 40},
	["videocard1050ti"] =  {comptype = 'videocard',label ='Видео Карта: GTX 1050ti',power = 110},
	["videocard10603gb"] =   {comptype = 'videocard',label ='Видео Карта: GTX 1060 3gb',power = 130},
	["videocard10606gb"] =   {comptype = 'videocard',label ='Видео Карта: GTX 1060 6gb',power = 190},
	["videocard1660ti"] =   {comptype = 'videocard',label ='Видео Карта: GTX 1660ti',power = 290},
	["videocard1070"] =  {comptype = 'videocard',label ='Видео Карта: GTX 1070',power = 280},
	["videocard1080"] =   {comptype = 'videocard',label ='Видео Карта: GTX 1080',power = 350},
	["videocard1080ti"] =   {comptype = 'videocard',label ='Видео Карта: GTX 1080ti',power = 470},

	["videocard2060"] =   {comptype = 'videocard',label ='Видео Карта: RTX 2060',power = 320},
	["videocard2060super"] =  {comptype = 'videocard',label ='Видео Карта: RTX 2060 SUPER',power = 380},
	["videocard2070"] =   {comptype = 'videocard',label ='Видео Карта: RTX 2070',power = 410},
	["videocard2070super"] =   {comptype = 'videocard',label ='Видео Карта: RTX 2070 SUPER',power = 440},
	["videocard2080"] =   {comptype = 'videocard',label ='Видео Карта: RTX 2080',power = 500},
	["videocard2080super"] =  {comptype = 'videocard',label ='Видео Карта: RTX 2080 SUPER',power = 530},
	["videocard2080ti"] =   {comptype = 'videocard',label ='Видео Карта: RTX 2080TI',power = 560},
   
    ["psu500"] =      {comptype = 'psu',label ='Захранване: 500W',power = 5},
    ["psu550"] =      {comptype = 'psu',label ='Захранване: 550W',power = 10},
    ["psu600"] =      {comptype = 'psu',label ='Захранване: 600W',power = 15},
    ["psu650"] =      {comptype = 'psu',label ='Захранване: 650W',power = 20},
    ["psu700"] =      {comptype = 'psu',label ='Захранване: 700W',power = 25},
    ["psu750"] =      {comptype = 'psu',label ='Захранване: 750W',power = 30},
    ["psu800"] =      {comptype = 'psu',label ='Захранване: 800W',power = 35},
    ["psu850"] =      {comptype = 'psu',label ='Захранване: 850W',power = 40},
    ["psu900"] =      {comptype = 'psu',label ='Захранване: 900W',power = 45},
    ["psu950"] =      {comptype = 'psu',label ='Захранване: 950W',power = 50},
    ["psu1000"] =     {comptype = 'psu',label ='Захранване: 1000W',power = 55},
    ["psu1100"] =     {comptype = 'psu',label ='Захранване: 1100W',power = 60},
    ["psu1200"] =     {comptype = 'psu',label ='Захранване: 1200W',power = 65},

    ["hdd50"] =       {comptype = 'hdd',label ='Хард Диск: 50gb',storage = 5},
    ["hdd100"] =      {comptype = 'hdd',label ='Хард Диск: 100gb',storage = 10},
    ["hdd500"] =      {comptype = 'hdd',label ='Хард Диск: 500gb',storage = 15},
    ["hdd1000"] =     {comptype = 'hdd',label ='Хард Диск: 1TB',storage = 20},

    ["mobob250m"] =   {comptype = 'mobo',label ='Дъно: B250m',socket = '1151-67'},
    ["moboz390"] =    {comptype = 'mobo',label ='Дъно: Z390',socket = '1151-89'},
    ["mobob365m"] =   {comptype = 'mobo',label ='Дъно: B365M',socket = '1151-89'},
    ["mobob360m"] =    {comptype = 'mobo',label ='Дъно: 360M',socket = '1151-89'},
    ["moboh110"] =    {comptype = 'mobo',label ='Дъно: H110',socket = '1151-67'},
    ["moboh310m"] =    {comptype = 'mobo',label ='Дъно: 310M',socket = '1151-89'},
    ["mobox299"] =    {comptype = 'mobo',label ='Дъно: X299',socket = '2066'},

    ["casemasterboxpro5rgb"] =       {comptype = 'case',label ='Кутия'},
    ["coolernoctua"] =               {comptype = 'cooler',label ='Охлаждане: Noctua',socket = {'1151-67','1151-89'},power=10},
    ["coolermasterliquid"] =         {comptype = 'cooler',label ='Водно Охлаждане',socket = '2066-1151',power=20},

    ["ram8gbddr4"] =     {comptype = 'ram',storage = '8',label ='Рам: 8gb 2666mhz ddr4',ramtype ='ddr4',power=50},
    ["ram4gbddr4"] =     {comptype = 'ram',storage = '4',label ='Рам: 4gb 2133mhz ddr4',ramtype ='ddr4',power=30},
    ["ram4gbddr3"] =     {comptype = 'ram',storage = '4',label ='Рам: 4gb 2400mhz ddr4',ramtype ='ddr4',power=35},
    ["ram8gbddr3"] =     {comptype = 'ram',storage = '8',label ='Рам: 8gb 2400mhz ddr4',ramtype ='ddr4',power=45},
}


Config.BuyerPlaces = {

	Buyer_1 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 787.78, y = 1288.87, z = 360.3},rotation=230.0},
			['veh2'] = {vehname='dubsta2',pos={x = 787.03, y = 1277.21, z = 359.86},rotation=306.78}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = 788.88, y = 1281.15, z = 360.3, h= 261.75},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = 788.61, y = 1284.76, z = 360.3, h= 261.75},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = 789.49, y = 1283.06, z = 360.3, h= 261.75},buyer=true}

	     }},

	Buyer_2 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 1432.61, y = 6588.12, z = 12.63},rotation=163.35},
            ['veh2'] = {vehname='dubsta2',pos={x = 1436.9, y = 6591.76, z = 12.13},rotation=243.26},
            ['veh3'] = {vehname='dubsta2',pos={x = 1433.79, y = 6583.62, z = 13.09},rotation=222.22}


	         },peds = {

			['ped1'] = {type=4,hash=-636391810,pos={x = 1435.1, y = 6590.01, z = 12.79, h= 218.8},buyer=false},
            ['ped2'] = {type=4,hash=-636391810,pos={x = 1434.65, y = 6586.77, z = 13.15, h= 293.21},buyer=false},
            ['ped3'] = {type=4,hash=-1755309778,pos={x = 1433.93, y = 6588.21, z = 13.02, h= 249.98},buyer=true}

	     }},

	Buyer_3 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = -674.96, y = 5793.75, z = 16.86},rotation=184.05},
            ['veh2'] = {vehname='dubsta2',pos={x = -667.77, y = 5790.75, z = 16.86},rotation=143.26}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = -670.62, y = 5791.07, z = 17.33, h= 159.33},buyer=false},
            ['ped2'] = {type=4,hash=-1395868234,pos={x = -672.74, y = 5791.78, z = 17.33, h= 159.33},buyer=false},
            ['ped3'] = {type=4,hash=-1755309778,pos={x = -671.81, y = 5790.37, z = 17.33, h= 159.33},buyer=true}

	     }}, 

	Buyer_4 = {vehicles = {

			['veh1'] = {vehname='guardian',pos={x = 3325.39, y = 5159.75, z = 18.73},rotation=216.42},
            ['veh2'] = {vehname='dubsta2',pos={x = 3333.32, y = 5159.9, z = 17.86},rotation=154.37},
            ['veh3'] = {vehname='dubsta2',pos={x = 3335.25, y = 5151.58, z = 17.87},rotation=101.0}


	         },peds = {

			['ped1'] = {type=4,hash=-920443780,pos={x = 3327.96, y = 5156.68, z = 18.31, h= 220.6},buyer=false},
            ['ped2'] = {type=4,hash=-920443780,pos={x = 3333.7, y = 5156.74, z = 18.29, h= 115.3},buyer=false},
            ['ped3'] = {type=4,hash=691061163,pos={x = 3332.17, y = 5157.45, z = 18.3, h= 143.15},buyer=true}

	     }},     
  

	Buyer_5 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = -1904.29, y = 2056.78, z = 140.29},rotation=128.66},
            ['veh2'] = {vehname='dubsta2',pos={x = -1911.23, y = 2061.73, z = 140.29},rotation=167.51}


	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = -1906.94, y = 2058.33, z = 140.74, h= 149.44},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = -1909.23, y = 2059.7, z = 140.74, h= 160.06},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = -1908.52, y = 2058.4, z = 140.74, h= 143.6},buyer=true}

	     }},

	Buyer_6 = {vehicles = {

			['veh1'] = {vehname='contender',pos={x = 2941.07, y = 2802.02, z = 41.36},rotation=356.56},
            ['veh2'] = {vehname='contender',pos={x = 2945.53, y = 2798.3, z = 41.14},rotation=285.99},
            ['veh3'] = {vehname='brickade',pos={x = 2959.02, y = 2799.7, z = 41.69},rotation=95.04},
            ['veh4'] = {vehname='mesa3',pos={x = 2936.04, y = 2812.02, z = 43.0},rotation=7.04}


	         },peds = {

			['ped1'] = {type=4,hash=-920443780,pos={x = 2946.75, y = 2806.28, z = 41.46, h= 291.51},buyer=false},
            ['ped2'] = {type=4,hash=-920443780,pos={x = 2948.87, y = 2803.75, z = 41.41, h= 0.3},buyer=false},
            ['ped4'] = {type=4,hash=1846523796,pos={x = 2946.0, y = 2800.09, z = 41.07, h= 345.26},buyer=false},
            ['ped3'] = {type=4,hash=-1922568579,pos={x = 2947.82, y = 2805.07, z = 41.45, h= 311.63},buyer=true}


	     }},

	Buyer_7 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 2269.09, y = 1704.77, z = 67.66},rotation=202.64},
			['veh2'] = {vehname='dubsta2',pos={x = 2276.44, y = 1704.37, z = 67.66},rotation=150.02},
			['veh3'] = {vehname='Cognoscenti2',pos={x = 2283.08, y = 1706.05, z = 67.66},rotation=89.39}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = 2274.16, y = 1704.12, z = 68.1, h= 162.27},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = 2271.22, y = 1704.08, z = 68.11, h= 162.88},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = 2272.45, y = 1702.34, z = 68.32, h= 153.77},buyer=true}

	     }},

	Buyer_8 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 715.29, y = 4170.91, z = 40.27},rotation=305.95},
			['veh2'] = {vehname='dubsta2',pos={x = 713.59, y = 4179.24, z = 40.27},rotation=262.82}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = 715.66, y = 4173.88, z = 40.71, h= 283.11},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = 714.9, y = 4176.6, z = 40.71, h= 283.11},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = 716.15, y = 4175.3, z = 40.71, h= 283.11},buyer=true}

	     }},
	Buyer_9 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 2632.39, y = 3277.68, z = 54.81},rotation=204.3},
			['veh2'] = {vehname='dubsta2',pos={x = 2626.19, y = 3268.75, z = 54.79},rotation=260.75},
			['veh3'] = {vehname='Cognoscenti2',pos={x = 2626.7, y = 3276.68, z = 54.89},rotation=188.63}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = 2628.09, y = 3270.58, z = 55.23, h= 230.69},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = 2631.22, y = 3275.1, z = 55.23, h= 230.69},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = 2630.7, y = 3272.09, z = 55.23, h= 230.69},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = 2628.16, y = 3276.86, z = 55.23, h= 230.69},buyer=false}

	     }}, 
	Buyer_10 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 412.8, y = 2983.46, z = 40.22},rotation=153.91},
			['veh2'] = {vehname='dubsta2',pos={x = 406.01, y = 2997.33, z = 39.87},rotation=239.77},
			['veh3'] = {vehname='Cognoscenti2',pos={x = 412.32, y = 2992.1, z = 39.98},rotation=203.4}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = 411.21, y = 2983.94, z = 40.63, h= 57.24},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = 405.24, y = 2995.75, z = 40.26, h= 216.38},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = 412.07, y = 2989.11, z = 40.41, h= 147.08},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = 410.67, y = 2992.3, z = 40.24, h= 169.22},buyer=false}

	     }},
	Buyer_11 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = -8.19, y = -2645.52, z = 5.58},rotation=68.12},
			['veh2'] = {vehname='dubsta2',pos={x = -19.46, y = -2649.68, z = 5.57},rotation=303.63},
			['veh3'] = {vehname='dubsta2',pos={x = -3.92, y = -2660.9, z = 5.57},rotation=28.16},
			['veh4'] = {vehname='Cognoscenti2',pos={x = -12.37, y = -2662.94, z = 5.62},rotation=316.86}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = -9.89, y = -2646.43, z = 6.0, h= 70.99},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = -18.73, y = -2647.13, z = 6.0, h= 335.81},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = -11.86, y = -2659.61, z = 6.0, h= 4.47},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = -14.44, y = -2662.63, z = 6.0, h= 351.86},buyer=false},
			['ped5'] = {type=4,hash=-1613485779,pos={x = -5.62, y = -2661.27, z = 6.0, h= 36.69},buyer=false}

	     }}, 
	Buyer_12 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = -592.32, y = -2362.74, z = 13.39},rotation=24.92},
			['veh2'] = {vehname='dubsta2',pos={x = -587.02, y = -2355.18, z = 13.39},rotation=82.25},
			['veh3'] = {vehname='Cognoscenti2',pos={x = -586.31, y = -2360.74, z = 13.44},rotation=56.78}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = -591.54, y = -2360.75, z = 13.83, h= 21.49},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = -588.63, y = -2356.64, z = 13.83, h= 68.31},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = -589.55, y = -2358.74, z = 13.83, h= 53.38},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = -587.53, y = -2362.78, z = 13.83, h= 33.18},buyer=false}

	     }}, 
	Buyer_13 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = -1600.71, y = 3171.24, z = 29.7},rotation=195.35},
			['veh2'] = {vehname='dubsta2',pos={x = -1611.18, y = 3165.38, z = 29.67},rotation=227.01},
			['veh3'] = {vehname='dubsta2',pos={x = -1608.25, y = 3184.55, z = 29.79},rotation=204.45},
			['veh4'] = {vehname='Cognoscenti2',pos={x = -1607.53, y = 3174.61, z = 29.76},rotation=188.64}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = -1602.23, y = 3169.44, z = 30.13, h= 192.31},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = -1608.89, y = 3165.88, z = 30.08, h= 220.96},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = -1606.5, y = 3170.43, z = 30.09, h= 200.08},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = -1605.36, y = 3183.56, z = 30.28, h= 191.88},buyer=false},
			['ped5'] = {type=4,hash=-1613485779,pos={x = -1606.04, y = 3176.72, z = 30.17, h= 192.89},buyer=false}

	     }}, 
	Buyer_14 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = -1147.13, y = 4928.33, z = 220.69},rotation=219.22},
			['veh2'] = {vehname='dubsta2',pos={x = -1150.43, y = 4918.46, z = 220.26},rotation=276.98},
			['veh3'] = {vehname='Cognoscenti2',pos={x = -1155.4, y = 4923.62, z = 221.68},rotation=278.06}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = -1147.62, y = 4926.01, z = 221.16, h= 253.3},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = -1149.16, y = 4920.63, z = 220.86, h= 270.0},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = -1149.69, y = 4923.62, z = 221.26, h= 256.09},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = -1155.81, y = 4926.48, z = 222.34, h= 262.67},buyer=false}

	     }},  
	Buyer_15 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 1433.33, y = -2601.67, z = 47.68},rotation=45.78},
			['veh2'] = {vehname='dubsta2',pos={x = 1448.28, y = -2589.78, z = 47.83},rotation=71.96},
			['veh3'] = {vehname='dubsta2',pos={x = 1451.42, y = -2605.78, z = 48.0},rotation=100.25},
			['veh4'] = {vehname='Cognoscenti2',pos={x = 1443.03, y = -2604.58, z = 47.89},rotation=78.36}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = 1434.04, y = -2599.96, z = 48.12, h= 336.59},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = 1444.8, y = -2589.13, z = 48.21, h= 131.44},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = 1441.85, y = -2602.43, z = 48.24, h= 33.27},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = 1450.51, y = -2604.19, z = 48.41, h= 60.54},buyer=false},
			['ped5'] = {type=4,hash=-1613485779,pos={x = 1441.64, y = -2607.56, z = 48.26, h= 25.14},buyer=false}

	     }}, 
	Buyer_16 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 2749.95, y = 1353.3, z = 24.09},rotation=321.83},
			['veh2'] = {vehname='dubsta2',pos={x = 2760.33, y = 1356.8, z = 24.09},rotation=54.38},
			['veh3'] = {vehname='dubsta2',pos={x = 2751.63, y = 1339.37, z = 24.09},rotation=310.8},
			['veh4'] = {vehname='Cognoscenti2',pos={x = 2758.09, y =1346.81, z = 24.14},rotation=22.36}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = 2752.69, y = 1353.16, z = 24.52, h= 355.29},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = 2757.9, y = 1355.73, z = 24.52, h= 19.45},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = 2756.47, y = 1350.57, z = 24.52, h= 1.6},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = 2751.09, y = 1341.27, z = 24.52, h= 354.16},buyer=false},
			['ped5'] = {type=4,hash=-1613485779,pos={x = 2757.1, y = 1344.79, z = 24.52, h= 89.02},buyer=false}

	     }},  
	Buyer_17 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 1911.88, y = 571.79, z = 175.28},rotation=213.3},
			['veh2'] = {vehname='dubsta2',pos={x = 1906.25, y = 561.6, z = 175.38},rotation=267.79},
			['veh4'] = {vehname='Cognoscenti2',pos={x = 1906.83, y =567.9, z = 175.43},rotation=218.62}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = 1911.21, y = 569.52, z = 175.71, h= 186.98},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = 1908.09, y = 563.29, z = 175.82, h= 242.56},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = 1909.65, y = 565.62, z = 175.72, h= 217.1},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = 1908.28, y = 569.14, z = 175.82, h= 194.27},buyer=false}

	     }}, 
	Buyer_18 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = 1193.41, y = -2176.21, z = 39.98},rotation=283.92},
			['veh2'] = {vehname='dubsta2',pos={x = 1195.23, y = -2167.84, z = 39.96},rotation=228.07},
			['veh4'] = {vehname='Cognoscenti2',pos={x = 1188.84, y = -2169.95, z = 39.78},rotation=248.62}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = 1195.3, y = -2170.47, z = 40.28, h= 244.74},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = 1194.5, y = -2173.99, z = 40.33, h= 240.23},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = 1192.58, y = -2171.52, z = 40.1, h= 242.84},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = 1189.78, y = -2167.23, z = 40.3, h= 241.06},buyer=false}

	     }}, 
	Buyer_19 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = -2775.22, y = 1426.56, z = 100.49},rotation=323.5},
			['veh2'] = {vehname='dubsta2',pos={x = -2785.44, y = 1433.85, z = 100.49},rotation=233.58},
			['veh4'] = {vehname='Cognoscenti2',pos={x = -2785.52, y = 1429.23, z = 100.54},rotation=235.05}

	         },peds = {

			['ped1'] = {type=4,hash=-1717894970,pos={x = -2772.57, y = 1428.42, z = 100.93, h= 358.9},buyer=false},
			['ped2'] = {type=4,hash=-1395868234,pos={x = -2782.67, y = 1433.99, z = 100.93, h= 207.13},buyer=false},
			['ped3'] = {type=4,hash=-1755309778,pos={x = -2782.25, y = 1428.12, z = 100.93, h= 302.24},buyer=true},
			['ped4'] = {type=4,hash=-1613485779,pos={x = -2785.7, y = 1431.51, z = 100.93, h= 230.38},buyer=false}

	     }}, 
	Buyer_20 = {vehicles = {

			['veh1'] = {vehname='dubsta2',pos={x = -1447.77, y = 5423.04, z = 22.04},rotation=199.94},
            ['veh2'] = {vehname='dubsta2',pos={x = -1453.61, y = 5417.63, z = 22.75},rotation=249.4},
            ['veh3'] = {vehname='cognoscenti2',pos={x = -1456.93, y = 5423.06, z = 22.69},rotation=268.16}


	         },peds = {

			['ped1'] = {type=4,hash=71501447,pos={x = -1446.74, y = 5420.13, z = 23.09, h= 215.83},buyer=false},
            ['ped2'] = {type=4,hash=71501447,pos={x = -1450.55, y = 5416.84, z = 23.17, h= 244.84},buyer=false},
            ['ped4'] = {type=4,hash=71501447,pos={x = -1453.76, y = 5422.56, z = 23.19, h= 238.76},buyer=false},
            ['ped3'] = {type=4,hash=988062523,pos={x = -1450.15, y = 5419.8, z = 23.26, h= 224.26},buyer=true}

	     }},                                                      
	          
}