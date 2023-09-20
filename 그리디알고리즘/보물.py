N = int(input())

A = list(map(int, input().split()))
B = list(map(int, input().split())) # B는 재배열 금지

A.sort() # A를 오름차순 정렬
BSort = sorted(B, reverse=True) # 내림차순

result = 0

for i in range(len(B)):
    idx = B.index(BSort[i])
    result += A[i] * B[idx]

print(result)

