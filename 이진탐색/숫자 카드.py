N = int(input()) # N은 상근이가 가지고있는 숫자 카드 개수
sangGun_cardList = list(map(int, input().split())) # 상근이가 가지고있는 카드리스트
sangGun_cardList.sort()

M = int(input()) # 상근이가 가지고있는지 확인해야할 카드 개수
check_cardList = list(map(int, input().split())) # 상근이가 가지고있는지 확인해야할 카드리스트

def binary_search(start, end, target):
    if start > end:
        return 0

    mid = (start + end) // 2
    if sangGun_cardList[mid] == target:
        return 1
    elif sangGun_cardList[mid] < target:
        return binary_search(mid + 1, end, target)
    else: 
        return binary_search(start, mid - 1, target)

for card in check_cardList:
    print(binary_search(0, len(sangGun_cardList) - 1, card))