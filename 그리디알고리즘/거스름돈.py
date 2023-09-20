rest = [500, 100, 50, 10, 5, 1] # 잔돈 종류

money = 1000 - int(input()) # 잔돈 금액
count = 0


for r in rest:
    if money % r >= 0:
        count += money // r
        money = money % r
        # print(money)
        # print(count)

print(count)
