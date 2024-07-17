Venus = Object:extend()

function Venus:init()
	V = self

	self:set_globals()
end

function Venus:start_up()
  self:fetch_languages()
end

function Venus:add_font()
end

function Venus:add_languages(LANGUAGES)
	for _, lang in pairs(self.LANGUAGES) do
    LANGUAGES[lang.key] = lang
	end
  return LANGUAGES
end

function Venus:fetch_languages()
  local nativefs = require("nativefs")
  local lovely = require("lovely")

  local path = self.MOD_PATH.."languages/"
  local files = nativefs.getDirectoryItems(path)

  for _, file in ipairs(files) do
    if file:sub(-4) == ".lua" then
      local lang = assert(dofile(path..file))
			self.LANGUAGES[lang.key] = {
				font = lang.font,
				label = lang.label,
				key = lang.key,
				button = "Language Feedback",
				warning = lang.warning,
        custom = true,
			}
      self.LOC_DATA[lang.key] = lang.localizations
    end
  end
end