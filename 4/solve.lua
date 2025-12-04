grid = {}

for line in io.lines("input.txt") do
    local row = {}

    for i=1,#line do
        table.insert(row, string.sub(line,i,i))
    end

    table.insert(grid,row)
end

sum = 0

function get_pos(y,x)
    if y > 0 and x > 0 and y <= #grid and x <= #grid[y] then
        return grid[y][x]
    else
        return '.'
    end
end

function remove_rolls()
    local removed_rolls = 0
    for i=1,#grid do
        local row = grid[i]
        for j=1,#row do
            if row[j] == "@" then
                local adjacent_rolls = 0

                for k=-1,1 do
                    for l=-1,1 do
                        if k ~= 0 or l ~= 0 then
                            if get_pos(i + k, j + l) == '@' then
                                adjacent_rolls = adjacent_rolls + 1
                            end
                        end
                    end
                end

                if adjacent_rolls < 4 then
                    sum = sum + 1
                    grid[i][j] = '.'
                    removed_rolls = removed_rolls + 1
                end
            end
        end
    end

    return removed_rolls
end

removed_rolls = remove_rolls()

while removed_rolls ~= 0 do
    removed_rolls = remove_rolls()
end

print(sum)
