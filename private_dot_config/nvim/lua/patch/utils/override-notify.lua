local banned_messages = { 'No information available', 'warning: multiple different client offset_encodings' }
vim.notify = function(msg, ...)
  for _, banned in ipairs(banned_messages) do
    if type(msg) == 'string' and string.match(msg, banned) then
      return
    end
  end

  require 'notify'(msg, ...)
end
