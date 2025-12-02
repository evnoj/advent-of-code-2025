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
        for size=1,#n/2 do
            if #n % size == 0 then
                local sub = string.sub(n, 1, size)
                for i=2,#n/size do
                    if sub ~= string.sub(n, size*(i-1)+1, size*i) then
                        goto nextsize
                    end
                end
                table.insert(invalid_ids, id)
                goto nextid
            end
            ::nextsize::
        end
        ::nextid::
    end
end

local sum = 0
for _,id in ipairs(invalid_ids) do
    sum = sum + id
end

print(sum)

