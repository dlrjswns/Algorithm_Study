remainList = []
for _ in range(10):
    num = int(input())
    remainList.append(num % 42)

uniqueRemainList = list(set(remainList))
print(len(uniqueRemainList))

