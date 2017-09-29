
module Password_generator
  UPPERCASE_LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
  # LOWERCASE_LETTERS = "abcdefghijklmnopqrstuvwxyz"
  # NUMBER = "0123456789"
  # SPECIAL = "!$%&*@^"
  def self.generate_password(length,
    _uppercase,
    _lowercase = false,
    _number = false,
    _special = false)

    valid_characters = UPPERCASE_LETTERS

    get_character(valid_characters) * length
  end

  def self.uppercase
    UPPERCASE_LETTERS
  end

  private

  def self.get_character(valid_characters)
    valid_characters[rand(0..valid_characters.length-1)]
  end
end
