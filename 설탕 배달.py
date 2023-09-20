sugar = int(input())
bag = 0

while sugar > 0:
    if bag % 5 == 0:
        bag += (bag // 5)
        print(bag)
        break
    else:
        sugar -= 3
        bag += 1
else:
    print(-1)
