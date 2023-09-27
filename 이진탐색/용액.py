# 산성용액은 양수, 알칼리성 용액은 음수
# 산성용액 + 알칼리성 용액 -> 최대한 0에 가깝게 

N = int(input()) # 전체 용액의 수
yongekList = list(map(int, input().split())) #용액의 특성값 리스트, 오름차순으로 입력

start = 0
end = N - 1

gijun = abs(yongekList[start] + yongekList[end])
first = 0
second = 0


while start < end:
    temp = yongekList[start] + yongekList[end]
    absTemp = abs(temp)

    if absTemp <= gijun:
        gijun = absTemp
        first = yongekList[start]
        second = yongekList[end]

    if temp > 0:
        end -= 1
    else:
        start += 1




print(first, second)