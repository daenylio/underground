require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :microposts }

  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to validate_presence_of(:password) }

  it { is_expected.to validate_uniqueness_of(:email) }

  it { is_expected.to validate_length_of(:password).is_at_least(6) }
end
