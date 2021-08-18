require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @answer = FactoryBot.build(:answer)
    @user = FactoryBot.build(:user)
    @question = FactoryBot.build(:question)
  end
  describe '回答投稿' do
    context '質問が投稿できる場合' do
      it 'text が入力されていると回答が投稿できる' do
        expect(@answer).to be_valid
      end
    end
    context '質問が投稿できない場合' do
      it 'textが空だと登録できない' do
        @answer.text = ''
        @answer.valid?
        expect(@answer.errors.full_messages).to include '翻訳を入力してください'
      end
    end
  end
end
