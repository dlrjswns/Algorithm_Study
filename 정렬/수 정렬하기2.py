import sys

N = int(input())
numberList = []

for _ in range(N):
    numberList.append(int(sys.stdin.readline()))

numberList.sort()

for number in numberList:
    print(number)