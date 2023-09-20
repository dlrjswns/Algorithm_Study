testCount = int(input())
list = []

for _ in range(testCount):
    list.append(map(int, input().split()))  # H: 호텔의 층 수, W: 각 층이 방 수, N: 몇번째 손님인지


for li in list:
    H, W, N = li
    count = 0
    floor = 0
    room = 0

    if N % H == 0:
        floor = H
    else:
        floor = N % H
        room = N // H + 1

        print(floor * 100 + room) 