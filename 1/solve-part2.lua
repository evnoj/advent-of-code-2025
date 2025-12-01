current = 50
count = 0

for line in io.lines("input.txt") do
    dir = string.sub(line, 1, 1)

    if dir == 'L' then
        mult = -1
    elseif dir == 'R' then
        mult = 1
    end

    n = tonumber(string.sub(line, 2))

    while n > 0 do
        current = (current + 1 * mult) % 100

        if current == 0 then
            count = count + 1
        end

        n = n - 1
    end
end

print(count)
