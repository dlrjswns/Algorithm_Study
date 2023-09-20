# x좌표기준으로 오름차순 정렬, y좌표 기준으로 오름차순 정렬
import sys

N = int(input())
xyList = []

for _ in range(N):  
    xyList.append(list(map(int, sys.stdin.readline().split())))

xyList.sort(key=lambda a:a[1])
xyList.sort(key=lambda a:a[0])

for xy in xyList:
    x, y = xy
    print(x, y)