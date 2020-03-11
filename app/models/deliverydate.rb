class Deliverydate < ActiveHash::Base
  self.data = [
      {id: 0, name: '選択してください'},
      {id: 1, name: '１〜2日で配送'}, {id: 2, name: '２〜3日で配送'},  {id: 3, name: '４〜７日で配送'}
  ]
end