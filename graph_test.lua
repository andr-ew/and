local g = require('luagraphs.data.graph').create(6, true)
g:addEdge(0, 5)
g:addEdge(2, 4)
g:addEdge(2, 3)
g:addEdge(1, 2)
g:addEdge(0, 1)
g:addEdge(3, 4)
g:addEdge(3, 5)
g:addEdge(0, 2)
local dfs = require('luagraphs.search.DepthFirstSearch').create()
local s = 0
dfs:run(g, s)

for k = 0, g:vertexCount()-1 do
    local v = g:vertexAt(k)
    if v ~= s and dfs:hasPathTo(v) then
        print('has path to ' .. v)
        local path = dfs:getPathTo(v)
        local pathText = ''
        while path:isEmpty() == false do
            local x = path:pop()
            if pathText == '' then
                pathText = pathText .. x
            else
                pathText = pathText .. ' -> ' .. x
            end
        end
        print(pathText)

    end
end
