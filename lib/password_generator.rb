
module Password_generator
  UPPERCASE_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze
  LOWERCASE_CHARS = 'abcdefghijklmnopqrstuvwxyz'.freeze
  NUMBER_CHARS = '0123456789'.freeze
  SPECIAL_CHARS = '!$%&*@^'.freeze

  def self.generate_password(length,
                             uppercase,
                             lowercase = false,
                             number = false,
                             special = false)

    valid_characters = build_valid_characters(uppercase,
                                              lowercase,
                                              number,
                                              special)

    generate_password_using_chars(length, valid_characters)

  end

  private

  def self.build_valid_characters(uppercase, lowercase, number, special)
    valid_characters = ""
    valid_characters += UPPERCASE_CHARS if uppercase
    valid_characters += LOWERCASE_CHARS if lowercase
    valid_characters += NUMBER_CHARS if number
    valid_characters += SPECIAL_CHARS if special
    valid_characters
  end

  def self.generate_password_using_chars(length, valid_characters)
    password = ""
    length.times do
      password += get_character(valid_characters)
    end
    password
  end

  def self.get_character(valid_characters)
    valid_characters[rand(0..valid_characters.length-1)]
  end
end
