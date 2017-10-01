require 'password_generator'
describe PasswordGenerator do
  describe '#generate_password' do
    let(:chars_string) { 'this string' }
    let(:password) { 'password' }
    before(:each) do
      allow(PasswordGenerator).to receive(:build_valid_characters).and_return(chars_string)
      allow(PasswordGenerator).to receive(:generate_password_using_chars).and_return(password)
    end
    it 'calls #build_valid_characters with the boolean values' do
      subject.generate_password(8, true, false, true, true)
      expect(PasswordGenerator).to have_received(:build_valid_characters).with(true, false, true, true)
    end
    it 'calls #generate_password_using_chars and returns the result' do
      length = 8
      expect(subject.generate_password).to eq password
      expect(PasswordGenerator).to have_received(:generate_password_using_chars).with(length, chars_string)
    end
  end

  describe '#build_valid_characters' do
    it 'returns uppercase chars only if told' do
      chars = subject.build_valid_characters(true, false, false, false)
      expect(chars).to eq subject::UPPERCASE_CHARS
    end

    it 'returns lowercase only if told' do
      chars = subject.build_valid_characters(false, true, false, false)
      expect(chars).to eq subject::LOWERCASE_CHARS
    end

    it 'returns numbers only if told' do
      chars = subject.build_valid_characters(false, false, true, false)
      expect(chars).to eq subject::NUMBER_CHARS
    end

    it 'returns special chars only if told' do
      chars = subject.build_valid_characters(false, false, false, true)
      expect(chars).to eq subject::SPECIAL_CHARS
    end

    it 'builds whatever mix you ask for' do
      chars = subject.build_valid_characters(false, true, false, true)
      expect(chars).to eq (subject::LOWERCASE_CHARS + subject::SPECIAL_CHARS)
      chars = subject.build_valid_characters(true, false, true, false)
      expect(chars).to eq (subject::UPPERCASE_CHARS + subject::NUMBER_CHARS)
    end
  end

  describe '#generate_password_using_chars' do
    it 'uses first var and returns something of the same length' do
      length = rand(1..10)
      password = subject.generate_password_using_chars(length, 'abc')
      expect(password.length).to eq length
    end

    it 'uses the RNG to select letters from the list' do
      srand 1
      password = subject.generate_password_using_chars(5, subject::UPPERCASE_CHARS)
      expect(password).to eq 'FLMIJ'
      srand 2
      password = subject.generate_password_using_chars(5, subject::UPPERCASE_CHARS)
      expect(password).to eq 'IPNIW'
    end

    it 'raises if everything is false' do
      error = 'need at least one set of characters to build a password'
      expect { subject.generate_password_using_chars(10, '') }.to raise_error error
    end

    it 'raises if length is 0' do
      error = 'password must be at least one character long'
      expect { subject.generate_password_using_chars(0, 'abc') }.to raise_error error
    end
  end
end
