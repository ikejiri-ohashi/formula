class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '----' },
    { id: 2, name: 'バーレーンGP(2021年)' },
    { id: 3, name: 'イタリアGP(2021年)' },
    { id: 4, name: 'ポルトガルGP(2021年)' },
    { id: 5, name: 'スペインGP(2021年)' },
    { id: 6, name: 'モナコGP(2021年)' },
    { id: 7, name: 'アゼルバイジャンGP(2021年)' },
    { id: 8, name: 'フランスGP(2021年)' },
    { id: 9, name: 'オーストリアGP(1回目)(2021年)' },
    { id: 10, name: 'オーストリアGP(2回目)(2021年)' },
    { id: 11, name: 'ハンガリーGP(2021年)' },
    { id: 12, name: 'オランダGP(2021年)' },
    { id: 13, name: 'イタリアGP(2回目)(2021年)' },
    { id: 14, name: 'ロシアGP(2021年)' },
    { id: 15, name: 'トルコGP(2021年)' },
    { id: 16, name: '日本GP(2021年)' },
    { id: 17, name: 'アメリカGP(2021年)' },
    { id: 18, name: 'メキシコGP(2021年)' },
    { id: 19, name: 'ブラジルGP(2021年)' },
    { id: 20, name: 'サウジアラビアGP(2021年)' },
    { id: 21, name: 'アブダビGP(2021年)' },
    { id: 22, name: 'Youtube企画系動画' },
    { id: 23, name: 'Instagram, Twitter動画' },
    { id: 24, name: 'その他GP動画' },
  ]

  include ActiveHash::Associations
  has_many :questions

  end