require "rails_helper"
RSpec.describe Direction, type: :model do

  it { should validate_presence_of(:step) }
  it { should validate_presence_of(:recipe) }

end
