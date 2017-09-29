require 'password_generator'
describe Password_generator do
  it 'accepts five arguments' do
    expect { subject.generate_password(5, true, false, false, false) }.not_to raise_error
  end

  it 'uses first var and returns something of the same length' do
    length = rand(0..10)
    password = subject.generate_password(length, true)
    expect(password.length).to eq length
  end

  it 'can generate using uppercase only' do
    password = subject.generate_password(10, true)
    expect(password.chars - subject.uppercase.chars).to be_empty
  end
end
