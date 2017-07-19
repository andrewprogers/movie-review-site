require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should have_many(:reviews) }

  it { should have_valid(:name).when('Sathvik', 'Andrew', 'George', 'Mike') }
  it { should_not have_valid(:name).when('', nil) }
  it { should have_valid(:description).when('Sathvik', 'Andrew', 'George', 'Mike') }
end
