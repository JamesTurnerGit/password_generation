# Generates a password of a specified length containing various characters
module PasswordGenerator
  UPPERCASE_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
  LOWERCASE_CHARS = 'abcdefghijklmnopqrstuvwxyz'.freeze
  NUMBER_CHARS = '0123456789'.freeze
  SPECIAL_CHARS = '!$%&*@^'.freeze

  def self.generate_password(length = 8,
                             uppercase = true,
                             lowercase = false,
                             number = false,
                             special = false)
    raise 'need at least one valid set of characters to build a password' unless uppercase || lowercase || number || special
    raise 'password must be at least one character long' if length < 1
    valid_characters = build_valid_characters(uppercase,
                                              lowercase,
                                              number,
                                              special)

    generate_password_using_chars(length, valid_characters)
  end

  def self.build_valid_characters(uppercase, lowercase, number, special)
    valid_characters = ''
    valid_characters += UPPERCASE_CHARS if uppercase
    valid_characters += LOWERCASE_CHARS if lowercase
    valid_characters += NUMBER_CHARS if number
    valid_characters += SPECIAL_CHARS if special
    valid_characters.chars
  end

  def self.generate_password_using_chars(length, valid_characters)
    password = ''
    length.times do
      password += valid_characters.sample
    end
    password
  end
end
