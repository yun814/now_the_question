class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'グルメ・生活' },
    { id: 2, name: '趣味・雑学' },
    { id: 3, name: '語学・文学' },
    { id: 4, name: 'スポーツ' },
    { id: 5, name: '芸能' },
    { id: 6, name: '社会' },
    { id: 7, name: 'アニメ・ゲーム' },
    { id: 8, name: '文系学問' },
    { id: 9, name: '理系学問' },
    { id: 10, name: 'なぞなぞ' },
    { id: 11, name: 'ノンジャンル' }
  ]

  include ActiveHash::Associations
  has_many :drills
end
