UPPERCASE_LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#LOWERCASE_LETTERS = "abcdefghijklmnopqrstuvwxyz"
#NUMBER = "0123456789"
#SPECIAL = "!$%&*@^"

def generatePassword length,
                     uppercase,
                     lowercase = false,
                     number = false,
                     special = false
                     
  valid_characters = UPPERCASE_LETTERS

  def getCharacter valid_characters
    valid_characters[rand(0..valid_characters.length)]
  end

  getCharacter(valid_characters) * length
end
