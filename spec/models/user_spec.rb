require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:reviews) }

  it { should have_valid(:first_name).when('Sathvik', 'Andrew', 'George', 'Mike')}
  it { should_not have_valid(:first_name).when('', nil)}

  it { should have_valid(:last_name).when('Sathvik', 'Andrew', 'George', 'Mike')}
  it { should_not have_valid(:last_name).when('', nil)}

  it { should have_valid(:username).when('ssudi', 'arog', 'geoooorge', 'miiiiiiiiiikey')}
  it { should_not have_valid(:username).when('', nil)}

  it { should have_valid(:email).when('sathvik@yahoo.com', 'andrew@gmail.com')}
  it { should_not have_valid(:email).when('', nil, 'user', 'a.com')}

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'another'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
