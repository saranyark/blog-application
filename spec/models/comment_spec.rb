require 'rails_helper'

RSpec.describe Comment, type: :model do
    context 'with valid attributes' do
      subject { build(:comment) }
      it { is_expected.to be_valid }
    end

    context 'with no body' do
      subject { build(:comment, body: nil) }
      it { is_expected.not_to be_valid }
    end

    context 'length of body in comment' do
      it { should validate_length_of(:body).is_at_least(3).is_at_most(100) }
    end
    
    describe 'assosiation' do
      it { is_expected.to belong_to(:post) }
    end
end
