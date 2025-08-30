local ft = require("guard.filetype")
ft("python"):fmt("black")
ft("c"):fmt("clang-format")
--ft("rust"):fmt("rustfmt")
