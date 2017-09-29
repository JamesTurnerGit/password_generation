require 'generatePassword'
describe '#generatePassword' do
  it 'accepts five arguments' do
    expect{generatePassword(5,true,false,false,false)}.not_to raise_error
  end
end
