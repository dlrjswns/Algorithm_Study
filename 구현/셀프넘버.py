numList = set()
natural = set(range(1, 10000))

def constructor(num):
    total = int(num)
    for num in str(num):
        total += int(num)

    return total

for num in natural:
    total = constructor(num)
    numList.add(total)

sortedList = sorted(natural - numList)
for selfNumber in sortedList:
    print(selfNumber)


