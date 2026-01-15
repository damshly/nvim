local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local M = {}

M.setup = function()
  ls.add_snippets("javascript", {
    s("clg", {
      t 'console.log(" ~ ',
      f(function() return vim.fn.expand "%:t" end),
      t ' ~ : ", ',
      i(1, "value"),
      t ");",
    }),

    s("afn", {
      t "const ",
      i(1, "name"),
      t " = (",
      i(2),
      t ") => {",
      t { "", "  " },
      i(3),
      t { "", "};" },
    }),
  })

  ls.filetype_extend("typescript", { "javascript" })
end

return M
