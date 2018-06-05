require './mystruct'

hash = { a: 1, b: 2, ab: 'asd' }
s = MyStruct.new(hash)
s.a = 17
s.abc = 24
p s['abc']
p s.b
p s.methods[0..10]
