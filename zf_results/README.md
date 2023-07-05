# This is the file tracking tests run for Zero Forcing 

## ILT 
### K2 3 clone steps (16 vertices)
#### Initial set size: 7
- no sets that fully force
- max amount of forces for any set is 3
- file: partialForces_K2_ILT_3.txt

#### Initial set size: 8
- 180 sets that fully forced (out of 16C8 = 12870 sets)
- all successful sets contained vertex 1 or 2 (or both) as part of the initially forced set
- vertices that were the forcers were all higher number vertices (13, 14, 15, 16)

### K2 4 clone steps (32 vertices)
#### Initial set: first 16 verices + 7 of last 16
- no sets that fully force
- max amount of forces for any set is 4
- 290 sets that force 4 times
- file: partialForces_K2_ILT_4.txt

#### Initial set: first 16 verices + 8 of last 16
- 1921 sets that fully force 

## ILAT 
### K2 3 clone steps (16 vertices)

#### Initial set size: 8
- 808 sets that fully forced (out of 16C8 = 12870 sets)
- all successful sets contained vertex 1 or 2 (or both) as part of the initially forced set

#### Initial set size: 7
- no sets that fully force
- max amount of forces for any set is 7, 378 forces that forced that many times
- partial forces seem to match that of full forces (sets of 8) except with 1 vertex missing
