require 'generatePassword'
describe '#generatePassword' do
  it 'accepts five arguments' do
    expect{generatePassword(5,true,false,false,false)}.not_to raise_error
  end
  it 'uses first var and returns something of the same length' do
    length = rand(0..10)
    password = generatePassword(length,true,false,false,false)
    expect(password.length).to eq length
  end
end
