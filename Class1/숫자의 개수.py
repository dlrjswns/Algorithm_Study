sum = 1

for _ in range(3):
    num = int(input())
    sum *= num

strSum = str(sum)

for i in range(10):
    count = strSum.count(str(i))
    print(count)