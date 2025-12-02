local file = io.open("input.txt", "r")
local content = file:read("*all")
file:close()

local ranges = {}
for range in content:gmatch("[^,]+") do
    table.insert(ranges, range)
end

local invalid_ids = {}

for _,range in ipairs(ranges) do
    local low,high = range:match("(.+)%-(.+)")
    low = tonumber(low)
    high = tonumber(high)

    for id=low,high do
        n = tostring(id)
        if #n % 2 == 0 and string.sub(n, 1, #n/2 ) == string.sub(n, #n/2+1, #n) then
            table.insert(invalid_ids, id)
        end
    end
end

local sum = 0
for _,id in ipairs(invalid_ids) do
    sum = sum + id
end

print(sum)
