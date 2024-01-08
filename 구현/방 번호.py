N = int(input())

countList = [0 for _ in range(10)]

for strNum in str(N):
    num = int(strNum)
    if num == 6 or num == 9:
        if countList[6] < countList[9]:
            countList[6] += 1
        else:
            countList[9] += 1
    else:
        countList[num] += 1

print(max(countList))