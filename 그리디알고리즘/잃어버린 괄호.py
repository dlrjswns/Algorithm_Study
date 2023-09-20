sik = input().split('-')
result = 0


for i in sik[0].split('+'):
    result += int(i)

for si in sik[1:]:
    splitSi = si.split('+')
    for s in splitSi:
        result -= int(s)

print(result)

    