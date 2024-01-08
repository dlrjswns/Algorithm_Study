import sys
from collections import deque

N, K = map(int, sys.stdin.readline().split())
# 1번 ~ N번까지 N명 사람이 있음
# 순서대로 K번째 사람 제거

currentPosition = K # 현재 위치 인덱스 
numberQueue = deque([i for i in range(1, N + 1)])

print("<", end='')

while numberQueue:
    for _ in range(K-1):
        numberQueue.append(numberQueue.popleft())
    print(numberQueue.popleft(), end='')
    if numberQueue:
        print(', ', end='')    

print('>', end='')


