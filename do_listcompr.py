#!/usr/bin/env python36
# _*_coding: utf-8 _*_


print([x * x for x in range(1, 11)])
print([x * x for x in range(1, 11) if x % 2 == 0])
print([m + n for m in 'ABC' for n in 'XYZ'])

d = {'x': 'a', 'y': 'b', 'z': 'c' }
print([k + '=' + v for k, v in d.items()])

L = ['Hello,' 'World', 'IBM', 'APPLE']
print([s.lower() for s in L])
