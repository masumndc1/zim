#!/usr/bin/python3

# these all are taken from python one liner book
## Data
txt = ['lambda functions are anonymous functions.',
       'anonymous functions dont have a name.',
       'functions are objects in Python.']
## One-Liner
mark = map(lambda s: (True, s) if 'anonymous' in s else (False, s), txt)
## Result
print(list(mark))


## Data
letters_amazon = '''
We spent several years building our own database engine,
Amazon Aurora, a fully-managed MySQL and PostgreSQL-compatible
service with the same or better durability and availability as
the commercial engines, but at one-tenth of the cost. We were
not surprised when this worked.
'''
## One-Liner
find = lambda x, q: x[x.find(q)-18:x.find(q)+18] if q in x else -1
## Result
print(find(letters_amazon, 'SQL'))

## Data (daily stock prices ($))
price = [[9.9, 9.8, 9.8, 9.4, 9.5, 9.7],
         [9.5, 9.4, 9.4, 9.3, 9.2, 9.1],
         [8.4, 7.9, 7.9, 8.1, 8.0, 8.0],
         [7.1, 5.9, 4.8, 4.8, 4.7, 3.9]]
## One-Liner
sample = [line[::2] for line in price]
## Result
print(sample)

## The Data 
n = 5
## The One-Liner
factorial = lambda n: n * factorial(n-1) if n > 1 else 1
## The Result
print(factorial(n))

# another example of lambda
#>>> z=lambda s: s ** 2 if (s > 10 and s is not None) else 1
#>>> print(z(0))
#1
#>>>

# another example of lambda
#>>> z=lambda s: s ** 2 if (s > 10 and s is not None) else 1
#>>> [print(z(y)) for y in range(12)]
z=lambda s: s ** 2 if (s > 10 and s is not None) else 1
for y in range(13):
   print(z(y))

#print(z(12))
#1
#121
#144
#>>>
