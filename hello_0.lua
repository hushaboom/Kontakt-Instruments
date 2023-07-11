#!user/bin/env lua

-- Check for valid instrument
if not instrument then

    print("The following error message informs you that the Creator Tools are not "..
          "focused on a Kontakt instrument. To solve this, load an instrument in "..
          "Kontakt and select it from the instrument dropdown menu on top.")
end

print("Hello, World!")  --prints to messages.
print(scriptPath)
print(filesystem)

print ("The samples are located in " .. scriptPath .. filesystem.preferred("/Samples"))

local samples =
{
    "C2.wav",
    "D#2.wav",
    "F2.wav",
}


instrument.groups:reset()

---- and then create a new group:

local g = Group()
instrument.groups:add(g)
g.name = "Cue"

for index, file in pairs(samples) do


    z = Zone()
    g.zones:add(z)

   z.file = scriptPath .. "/Samples/" ..file

end


---- Now you can set the correct key ranges of the zones, starting from C1:


local C1 = 36


for index, zone in pairs(g.zones) do

    -- map all zones to one key per zone, starting from C1:
    local key = C1 + index
    zone.rootKey = key
    zone.keyRange.low = key
    zone.keyRange.high = key

    -- add set the velocity range:
    zone.velocityRange.low = 0
    zone.velocityRange.high = 127
    
end

for n,g in pairs(instrument.groups) do
    print(n, g.name, g.volume, g.tune, g.zones)
end