#!/usr/bin/env lua

print ("The samples are located in " .. scriptPath .. filesystem.preferred("/Samples"))

local samples =

    {
        "bass_strings - E1.wav",
        "bass_strings - A1.wav",
        "bass_strings - D2.wav",
        "bass_strings - G2.wav",

    }

instrument.groups:reset()

local g = Group()
instrument.groups:add(g)
g.name = "Cue"

for index, file in pairs(samples) do


    z = Zone()
    g.zones:add(z)

   z.file = scriptPath .. "/Samples/" ..file

end

local E1 = 28
local key = E1

for index, zone in pairs(g.zones) do

    zone.velocityRange.high = 127
    zone.velocityRange.low = 0

    zone.rootKey = key
    zone.keyRange.low = key
    zone.keyRange.high = key + 5
    key = key + 6
    


end