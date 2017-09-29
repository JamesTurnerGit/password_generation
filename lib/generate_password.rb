UPPERCASE_LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
# LOWERCASE_LETTERS = "abcdefghijklmnopqrstuvwxyz"
# NUMBER = "0123456789"
# SPECIAL = "!$%&*@^"

def generate_password(length,
                      _uppercase,
                      _lowercase = false,
                      _number = false,
                      _special = false)

  valid_characters = UPPERCASE_LETTERS

  def get_character(valid_characters)
    valid_characters[rand(0..valid_characters.length)]
  end

  getCharacter(valid_characters) * length
end
