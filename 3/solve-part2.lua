banks = {}

for line in io.lines("input.txt") do
    table.insert(banks,line)
end

total_joltage = 0

for _,bank in ipairs(banks) do
    local max_joltage = ""
    local prev_index = 0

    for i=12,1,-1 do
        local max = 0
        prev_index = prev_index+1
        for j=prev_index,#bank-i+1 do
            local n = tonumber(string.sub(bank,j,j))
            if n > max then
                max = n
                prev_index = j
            end
        end

        max_joltage = max_joltage..max
    end

    total_joltage = total_joltage + tonumber(max_joltage)
end

print(total_joltage)
