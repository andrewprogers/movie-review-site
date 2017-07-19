require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:movie) }
  
  it { should have_valid(:rating).when(1, 2, 3, 4, 5, 6, 7) }
  it { should_not have_valid(:rating).when('', nil, 0, 8, 3.5, -1) }

  it { should have_valid(:body).when('this is a great movie', '') }
end
