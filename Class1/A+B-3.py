T = int(input())
list = []
for _ in range(T):
    list.append(map(int, input().split()))

for li in list:
    A, B = li
    print(A+B)