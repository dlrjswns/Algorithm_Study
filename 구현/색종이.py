paperCount = int(input()) # 색종이 수

array = [[0 for _ in range(100)] for _ in range(100)]

for _ in range(paperCount):
    leftDistance, bottomDistance = map(int, input().split())
    for left in range(leftDistance, leftDistance + 10):
        for right in range(bottomDistance, bottomDistance + 10):
            array[left][right] = 1

result = 0
for m in array:
    result += m.count(1)

print(result)
