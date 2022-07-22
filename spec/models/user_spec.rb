require 'rails_helper'

RSpec.describe User, type: :model do
    context 'without first name' do
        subject { build(:user, name: nil) }
        it { is_expected.not_to be_valid }
    end
    context 'without last name' do
        subject { build(:user, lastname: nil) }
        it { is_expected.not_to be_valid }
    end
    context 'without email ' do
        subject { build(:user, email: nil) }
        it { is_expected.not_to be_valid }
    end
    
end
