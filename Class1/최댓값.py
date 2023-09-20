list = []
for _ in range(9):
    list.append(int(input()))


print(max(list))
print(list.index(max(list)) + 1)