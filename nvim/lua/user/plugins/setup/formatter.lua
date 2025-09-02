local ft = require("guard.filetype")
ft("python"):fmt("ruff")
ft("c"):fmt("clang-format")
--ft("rust"):fmt("rustfmt")
