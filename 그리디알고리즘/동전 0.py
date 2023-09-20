import sys

N, K = map(int, sys.stdin.readline().split()) 
# N은 가지고있는 동전 종류, K는 만들고자하는 가치의 합

result = 0
coinList = []

for _ in range(N):
    coinList.append(int(sys.stdin.readline()))

for i in reversed(range(len(coinList))):
    result += K // coinList[i]
    K = K % coinList[i]

print(result)
            

