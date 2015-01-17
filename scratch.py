# encoding: utf-8
import collections

def benot(s):
    t = s.replace('0','x').replace('1','0').replace('x','1')
    return t

text = '''&#21359;&#29300
&#17513;&#29544
&#25971;&#17017
&#17263;&#29556
&#20069;&#30836
&#17263;&#28278
&#25970;&#29764
&#26995;&#26702;&#24941
&#25971;&#21615
&#20085;&#28002
&#25970;&#29505
&#18803;&#20334
&#25922;&#18803
&#21623;&#28483
&#18803;&#21608
&#29285;&#25925;&#29795
&#18025;&#28257
&#27756;&#31041
&#25700;&#21872;&#20085
&#28002;&#25970
&#29517;&#28516
&#30060;&#28500
&#30565;&#28276
&#31059;&#27000'''

data = text.splitlines()


code = []
bincode = []
for i in data:
    line = i.split(";")
    for i in line:
        i = i.replace('&#','')
        code.append(i)

bincode = []
for s in code:
    bincode.append("{0:16b}".format(int(s)).replace(' ','0'))


print code
print len(code)


total = ''.join(code)
bintotal = ''.join(bincode)
# print bintotal

bintotal_list = bintotal.split()
big_total = "".join(bintotal_list)

utf8_list = []
ascii_list = []
reverse_utf8_list = []
reverse_ascii_list = []

for i in range(0,len(big_total),8):
    eight_bit_chunk = big_total[i:i+8]
    ascii_list.append(unichr(int(eight_bit_chunk, 2)))
    reverse_ascii_list.append(unichr(int(benot(eight_bit_chunk), 2)))


print ''.join(ascii_list)
print ''.join(reverse_ascii_list)
