N, X = map(int, input().split())
list = list(map(int, input().split()))

for num in list:
    if num < X:
        print(num, end=' ')