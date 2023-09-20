from enum import unique


letter = input().upper()
maxList = []
uniqueLetter = list(set(letter))

for i in uniqueLetter:
    maxList.append(letter.count(i))

if maxList.count(max(maxList)) > 1:
    print("?")
else:
    maxCount = max(maxList)
    index = maxList.index(maxCount)
    print(uniqueLetter[index])
    


