# -*- coding: utf-8 -*

def to_unicode(string):
 
    ret = ''
    for v in string:
        ret = ret + hex(ord(v)).upper().replace('0X', '\\u')
 
    return ret

print(to_unicode("？"))