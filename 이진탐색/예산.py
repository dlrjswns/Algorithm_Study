N = int(input()) # N은 지방의 수 
accountList = list(map(int, input().split())) # 지방에서 요청하는 예산 리스트
M = int(input()) # M은 총 예산

start = 1
end = max(accountList)
answer = 0

while start <= end:
    mid = (start + end) // 2
    accountSum = 0
    for account in accountList:
        if mid <= account:
            accountSum += mid
        else:
            accountSum += account
    print(accountSum)
    if accountSum > M:
        end = mid - 1
    else:
        answer = mid
        start = mid + 1

print(answer)