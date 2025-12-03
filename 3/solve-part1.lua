banks = {}

for line in io.lines("input.txt") do
    table.insert(banks,line)
end

total_joltage = 0

for _,bank in ipairs(banks) do
    largest_tens = 0
    largest_tens_index = nil
    largest_ones = 0

    for i=1,#bank-1 do
        local n = tonumber(string.sub(bank,i,i))
        if n > largest_tens then
            largest_tens = n
            largest_tens_index = i
        end
    end

    for i=largest_tens_index+1,#bank do
        local n = tonumber(string.sub(bank,i,i))
        if n > largest_ones then
            largest_ones = n
        end
    end

    total_joltage = total_joltage + 10 * largest_tens + largest_ones
end

print(total_joltage)
