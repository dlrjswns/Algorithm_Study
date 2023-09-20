testCase = int(input())
list = []

for _ in range(testCase):
    list.append(input().split())

for i in list:
    R, S = i
    for s in S:
        print(s * int(R), end='')
    print()