require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it 'name, email, passwordとpassword_confirmation,が適切な値であれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'ニックネームを入力してください'
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレスを入力してください'
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレスは不正な値です'
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'メールアドレスはすでに存在します'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = '11111a'
        @user.password_confirmation = '11111b'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = '1111a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
    end
  end
end
