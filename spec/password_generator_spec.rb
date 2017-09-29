require 'password_generator'
describe PasswordGenerator do
  describe '#generate_password' do
    it 'uses first var and returns something of the same length' do
      length = rand(0..10)
      password = subject.generate_password(length, true)
      expect(password.length).to eq length
    end
    it 'can generate using uppercase only' do
      password = subject.generate_password(10, true)
      valid_characters = subject::UPPERCASE_CHARS
      expect(password.chars - valid_characters.chars).to be_empty
    end
    it 'can generate using lowercase only' do
      password = subject.generate_password(10, false, true)
      valid_characters = subject::LOWERCASE_CHARS
      expect(password.chars - valid_characters.chars).to be_empty
    end
    it 'can generate using Numbers only' do
      password = subject.generate_password(10, false, false, true)
      valid_characters = subject::NUMBER_CHARS
      expect(password.chars - valid_characters.chars).to be_empty
    end
    it 'can generate using Special chars only' do
      password = subject.generate_password(10, false, false, false, true)
      valid_characters = subject::SPECIAL_CHARS
      expect(password.chars - valid_characters.chars).to be_empty
    end
    it 'can generate passwords using mixtures' do
      password = subject.generate_password(10, true, false, false, true)
      valid_characters = subject::SPECIAL_CHARS + subject::UPPERCASE_CHARS
      expect(password.chars - valid_characters.chars).to be_empty
    end
  end
end