module Record.Sample

import extensible_records
import Data.List

-- All functions must be total
%default total

-- *** Initial records ***
r1 : Record [("surname", String), ("age", Int)]
r1 = ("surname" .=. "Bond") .*.
     ("age" .=. 30) .*.
     emptyRec

r2 : Record [("surname", String), ("name", String)]
r2 = ("surname" .=. "Bond") .*.
     ("name" .=. "James") .*.
     emptyRec
    
r3 : Record [("name", String), ("code", String)]
r3 = ("name" .=. "James") .*.
     ("code" .=. "007") .*.
     emptyRec
     
-- *** Lookup ***

r1Surname : String
r1Surname = r1 .!. "surname"
-- "Bond"

r1Age : Int
r1Age = r1 .!. "age"
-- 30

-- *** Append ***

rAppend : Record [("surname", String), ("age", Int), ("name", String), ("code", String)]
rAppend = r1 .++. r3
-- { "surname" = "Bond", "age" = 30, "name" = "James", "code" = "007" }

-- *** Update ***

rUpdate : Record [("surname", String), ("age", Int)]
rUpdate = updR "surname" r1 "Dean"
-- { "surname" = "Dean", "age" = 30 }


-- *** Delete ***

rDelete : Record [("age", Int)]
rDelete = "surname" .//. r1
-- { "age" = 30 }

-- *** Delete Labels ***

rDeleteLabels1 : Record [("age", Int), ("name", String)]
rDeleteLabels1 = ["surname", "code"] .///. rAppend

rDeleteLabels2 : Record [("age", Int), ("name", String)]
rDeleteLabels2 = ["code", "surname"] .///. rAppend
-- { "age" = 30, "name" = "James" }
