#!/usr/bin/python3

x = 10
y = 'hello world'
type(x) # class int
type(y) # class str

x, y, z = 10, 20, 30
x = y = z = 10
del z
z = None

a = 10
a += 20 # a = a + 20
a -= 20 # a = a - 20
a *= 20 # a = a * 20
a /= 20 # a = a / 20
a //= 20 # a = a // 20

x = input()
    # hello world
print(x)    # hello world

a = int(input())
b = float(input())

a, b = input().split() # string
a, b = map(int, input().split)
a, b = map(float, input().split())
a, b = map(int, input().split(','))