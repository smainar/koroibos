require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :olympians }
  end

  describe 'relationships' do
    it { should validate_presence_of :name }
  end
end
