class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'バーレーンGP' },
    { id: 3, name: 'イタリアGP' },
    { id: 4, name: 'ポルトガルGP' },
    { id: 5, name: 'スペインGP' },
    { id: 6, name: 'モナコGP' },
    { id: 7, name: 'アゼルバイジャンGP' },
    { id: 8, name: 'フランスGP' },
    { id: 9, name: 'オーストリアGP(1回目)' },
    { id: 10, name: 'オーストリアGP(2回目)' },
    { id: 11, name: 'ハンガリーGP' },
    { id: 12, name: 'オランダGP' },
    { id: 13, name: 'イタリアGP(2回目)' },
    { id: 14, name: 'ロシアGP' },
    { id: 15, name: 'トルコGP' },
    { id: 16, name: '日本GP' },
    { id: 17, name: 'アメリカGP' },
    { id: 18, name: 'メキシコGP' },
    { id: 19, name: 'ブラジルGP' },
    { id: 20, name: 'サウジアラビアGP' },
    { id: 21, name: 'アブダビGP' },
    { id: 22, name: 'Youtube企画系動画' },
    { id: 23, name: 'Instagram, Twitter動画' },
    { id: 24, name: 'その他GP動画' },
  ]

  include ActiveHash::Associations
  has_many :questions

  end