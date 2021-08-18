require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = FactoryBot.build(:question)
    @user = FactoryBot.build(:user)
  end
  describe '質問投稿' do
    context '質問が投稿できる場合' do
      it 'URL, time, text が全て入力されていると質問が投稿できる' do
        expect(@question).to be_valid
      end
      it 'text が空でも質問が投稿できる' do
        @question.text = ''
        expect(@question).to be_valid
      end
    end
    context '質問が投稿できない場合' do
      it 'urlが空だと登録できない' do
        @question.url = ''
        @question.valid?
        expect(@question.errors.full_messages).to include '動画のリンクを入力してください'
      end
      it 'timeが空だと登録できない' do
        @question.time = ''
        @question.valid?
        expect(@question.errors.full_messages).to include '動画内の時間を入力してください'
      end
      it 'category_idが1だと登録できない' do
        @question.category_id = 1
        @question.valid?
        expect(@question.errors.full_messages).to include 'カテゴリーを選択してください'
      end
    end
  end
end
