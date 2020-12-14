require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'contentの値とimageが存在していれば保存できるということ' do
      expect(@message).to be_valid
    end

    it 'contentの値が空でも保存できるということ' do
      @message.content = ''
      expect(@message).to be_valid
    end

    it 'imageの値が空でも保存できるということ' do
      @message.image = nil
      expect(@message).to be_valid
    end

    it 'contentの値が空でimageの値が空だと保存できないということ' do
      @message.content = nil
      @message.image = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end

    it 'roomが紐付いていないと保存できないということ' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Room must exist")
    end

    it 'userが紐付いていないと保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("User must exist")
    end
  end
end
