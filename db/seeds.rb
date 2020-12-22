#親
parents_array = ['しごと','くらし','趣味','雑誌','コミック','エンタメ','その他']

#子
child_array = [
  #しごと
  ['IT','金融・経済','人材育成','就職・転職','自己啓発','その他'],
  #くらし
  ['住まい','健康','料理','子育て','ファッション','その他'],
  #趣味
  ['スポーツ','車・バイク','旅行','アウトドア','その他'],
  #雑誌
  ['男性誌','女性誌','生活','健康','グルメ','スポーツ','その他'],
  #コミック
  ['少年マンガ','少女マンガ','青年マンガ','女性マンガ','その他'],
  #エンタメ
  ['映画','音楽','テレビ','タレント本','ゲーム','サブカルチャー','その他'],
  #その他
  ['文庫','資格','絵本','アート','その他']
]

parents_array.each do |parent|
  Category.create(name: parent)
end

@parents = Category.where(ancestry: nil)

c = 0
@parents.each do |parent|
  child_array[c].each do |child|
    parent.children.create(name: child)
  end
  c += 1
end