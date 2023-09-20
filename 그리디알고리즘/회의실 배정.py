N = int(input()) # N은 회의의 수
studyList = []

for _ in range(N):
    studyList.append(list(map(int, input().split())))

startTime = 0
count = 0

studyList.sort(key=lambda a:a[0])
studyList.sort(key=lambda a:a[1])

for study in studyList:
    if study[0] >= startTime:
        startTime = study[1]
        count += 1

print(count)