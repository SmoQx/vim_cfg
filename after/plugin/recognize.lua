local commnet = require("comment_and_format")
commnet.setup({{ filetype = "lua", comment_symbol = "--", formatter = nil},
              { filetype = "python", comment_symbol = "#", formatter = "autopep8 -i %"},
              { filetype = "cs", comment_symbol = "\\/\\/", formatter = "dotnet csharpier %"}})
