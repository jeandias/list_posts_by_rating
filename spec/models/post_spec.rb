require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { create(:post, up: 6, down: 4) }

  context 'when created' do
    it 'should update rate' do
      expect(subject.rate).to be(60.0)
      subject.update(up: 8)
      expect(subject.rate).to be(66.66666666666666)
    end
  end
end
