# 산성은 양수, 알칼리성 용액은 음수로 나타냄

N = int(input()) # 전체 용액의 수
yongekList = list(map(int, input().split())) # 용액 리스트
yongekList.sort()

start = 0
end = N - 1
first = yongekList[start]
second = yongekList[end]

result = abs(yongekList[start] + yongekList[end])
while start < end:
    temp = yongekList[start] + yongekList[end]
    absTemp = abs(temp) 

    if result > absTemp:
        result = absTemp
        first = yongekList[start]
        second = yongekList[end]

    if temp > 0:
        end -= 1
    else:
        start += 1

print(first, second)

    



