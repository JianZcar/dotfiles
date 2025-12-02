local add, dir = MiniDeps.add, vim.fn.stdpath("config") .. "/lua/plugins"

for _, f in ipairs(vim.fn.readdir(dir, [[v:val =~ '\.lua$']])) do
  if f ~= "init.lua" then
    for _, spec in ipairs(require("plugins." .. f:gsub("%.lua$", ""))) do
      add(spec)
    end
  end
end
