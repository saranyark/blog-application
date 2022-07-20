require 'rails_helper'

RSpec.describe Post, type: :model do
    context 'with valid attributes' do
      subject { build(:post) }
      it { is_expected.to be_valid }
    end

    context 'with no title' do
      subject { build(:post, title: nil) }
      it { is_expected.not_to be_valid }
    end

    context 'with no description' do
      subject { build(:post, description: nil) }
      it { is_expected.not_to be_valid }
    end

    context 'length of title and description' do
      it { should validate_length_of(:title).is_at_least(3).is_at_most(10) }
      it { should validate_length_of(:description).is_at_least(10).is_at_most(100) }
    end

    context 'if length of title less than 3' do
      let(:post) { build :post, title: 'ab' } 
      it { is_expected.not_to be_valid }
    end

    context 'if length of description less than 10' do
      let(:post) { build :post, description: 'cd' } 
      it { is_expected.not_to be_valid }
    end

    context 'if length of title greater than 10' do
      let(:post) { build :post, title: 'post title not valid' } 
      it { is_expected.not_to be_valid }
    end
    
    describe 'assosiation' do
      it { is_expected.to have_many(:comments) } 
    end
end