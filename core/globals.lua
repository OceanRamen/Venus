local lovely = require("lovely")
VERSION = "1.0.0b"
VERSION = VERSION .. "-FULL"
MOD_PATH = lovely.mod_dir .. "/Venus/"

function Venus:set_globals()
  self.VERSION = VERSION
  self.MOD_PATH = MOD_PATH

  self.LANGUAGES = {}
  self.LOC_DATA = {}
end

V = Venus()