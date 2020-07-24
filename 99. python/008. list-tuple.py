# list 사용법 / element(요소)
a = [ 38, 21, 30, 9 ]
p = [ "jason", 1, 45, True ]

# 빈 리스트 생성
a = []
b = list()

# range 생성 방법
h = list(range(10))
  # h = [0,1,2,3,4,5,6,7,8,9]
h = list(range(5,12))
  # h = [5,6,7,8,9,10,11]
h = list(range(-4,10,2))
  # h = [-4,-2,0,2,4,6,8]
h = list(range(10,0,-2))
  # h = [10,8,6,4,2]

# 튜플 사용법
y = (34,36,390,30)
y = 34,36,390,30
(70,)
a = tuple(range(10))
  # a = (0,1,2,3,4,5,6,7,8,9)
a = tuple(range(3,8))
  # a = (3,4,5,6,7)
a = tuple(range(-4,10,2))
  # h = (-4,-2,0,2,4,6,8)

# list <-> tuple
a = list(range(10))
tuple(a)
b = tuple(range(10))
list(b)

# list unpacking / tuple unpacking
x = [1,2,3]
a,b,c = x
print(a,b,c)
  # 1,2,3
y  = (4,5,6)
d,e,f = y
print(d,e,f)
  # 4,5,6