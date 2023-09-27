N, M = map(int, input().split()) # N은 강의의 수, M은 블루레이개수
courseList = list(map(int, input().split())) # 강의리스트
courseList.sort()

start = 1
end = sum(courseList)
answer = 0
while start <= end:
    mid = (start + end) // 2
    sum = 0
    count = 1
    for i in range(N):
        if sum + courseList[i] > mid:
            count += 1
            sum = 0
        sum += courseList[i]

    if count > M:
        start = mid + 1
    else:
        answer = mid
        end = mid - 1

print(answer)
