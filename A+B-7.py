x, y = map(int, input().split())
chessPan = []
result = 0

for _ in range(x):
    letter = input()
    chessPan.append(list(letter))


for i in range(x):
    for k in range(y):
        if chessPan[0][0] == "W":
            if k % 2 == 0 and chessPan[i][k] != "W":
                result += 1
            elif k % 2 == 1 and chessPan[i][k] != "B":
                result += 1
            elif i % 2 == 0 and chessPan[i][k] != "W":
                result += 1
            elif i % 2 == 1 and chessPan[i][k] != "B":
                result += 1
        elif chessPan[0][0] == "B":
            if k % 2 == 0 and chessPan[i][k] != "W":
                result += 1
            elif k % 2 == 0 and chessPan[i][k] != "B":
                result += 1
            elif i % 2 == 0 and chessPan[i][k] != "B":
                result += 1
            elif i % 2 == 1 and chessPan[i][k] != "W":
                result += 1

print(result)

