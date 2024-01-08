import collections
import sys
from collections import deque

testcase = int(input()) # 테스트케이스의 수

for _ in testcase:
    N, M = map(int, input().split()) # N은 문서의 개수, M은 궁금한게 큐에서 몇번째 놓여있는지
    priorityQueue = deque(sys.stdin.readline().split())

    while priorityQueue:
        firstElement = priorityQueue.popleft()
        priority = priorityQueue[M] # 이놈이 몇번째로 인쇄되는지 알아야함
