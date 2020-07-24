#!/usr/bin/python3

'Python' == 'python' # False
'Python' != 'python' # True

1 is 1.0 # False
1 is not 1.0 # Ture

# and
True and True # True
True and False # False
False and True # False
False and False # False
# or
True or True # True
True or False # True
False or True # True
False or False # False
# not
not True # False
not False # True
# not -> and -> or (nao)

# bool
bool(1) # True
bool(0) # False
bool(0.0) # False
bool(1.0) # True
bool('string') # True

# short-circuit evalution
True and 'python' # 'python'
'python' and True # True
0 and 'python' # 0
True or 'python' # True
'python' or True # 'python'
False or 'python' # 'python'
