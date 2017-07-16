#!/usr/bin/python


def names(q1,q2):
	x=[]
	for a in q1:
		if a in q2:
			x.append(a)
	return x

b=names([2,3,4],[3,4,5])
print b

