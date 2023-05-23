module pt_07

import StdEnv
// NEPTUN: B9XP3X
/* Create record `City`. It should contain 3 fields: name(String), area(Int)
and population(Int). Write `smallCityCount` function which takes list of Cities
and returns number of cities that have area less than 100 or population less than 300 000.
*/

:: City = { name        :: String,
            area        :: Int,
            population  :: Int
		  }

budapest={name="Budapest", area=525, population=1756000}
kutaisi={name="Kutaisi", area=67, population=147000}
debrecen={name="Debrecen", area=461, population=202000}
berlin={name="Berlin", area=891, population=3645000}
pisa={name="Pisa", area=185, population=90000}

smallCityCount :: [City] -> Int
smallCityCount rs = sum [1 \\ {area,  population} <- rs | (area < 100 || population < 300000)]

//Start = smallCityCount [] // 0
//Start = smallCityCount [budapest,kutaisi,debrecen,berlin,pisa] // 3
//Start = smallCityCount [budapest,berlin] // 0
Start = smallCityCount [kutaisi] // 1
