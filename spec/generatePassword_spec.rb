require 'generatePassword'
describe '#generatePassword' do

  it 'accepts five arguments' do
    expect{generatePassword(5,true,false,false,false)}.not_to raise_error
  end

  it 'uses first var and returns something of the same length' do
    length = rand(0..10)
    password = generatePassword(length,true)
    expect(password.length).to eq length
  end

  it 'can generate using uppercase only' do
    password = generatePassword(10,true)
    expect(password.chars - UPPERCASE_LETTERS.chars).to be_empty
  end
end
