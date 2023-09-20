peopleCount = int(input()) # 사람의 수
timeList = [] # 각 사람이 돈을 인출하는데 걸리는 시간
sum = 0


timeList = list(map(int, input().split()))

timeList.sort()

for i in range(len(timeList) + 1):
    for a in range(i):
        sum += timeList[a]

print(sum)

