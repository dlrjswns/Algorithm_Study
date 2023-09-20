# N = int(input()) # 상근이 가지고 있는 숫자 카드 개수
# nList = list(map(int, input().split()))

# M = int(input()) # 상근이가 가지고있는지 확인해야할 카드 개수
# mList = list(map(int, input().split()))

# nList.sort()

# count = {}

# for n in nList:
#     if n in count:
#         count[n] += 1
#     else:
#         count[n] = 1

# def binary_search(arr, target, start, end):
#     if start > end:
#         return 0

#     mid = (start + end) // 2
    
#     if arr[mid] == target:
#         return count.get(target)
#     elif arr[mid] < target:
#         return binary_search(arr, target, mid + 1, end)
#     else:
#         return binary_search(arr, target, start, mid - 1)

# for m in mList:
#     print(binary_search(nList, m, 0, len(nList) - 1))

from itertools import count


N = int(input()) # 상근이 가지고 있는 숫자 카드 개수
nList = list(map(int, input().split()))

M = int(input()) # 상근이가 가지고있는지 확인해야할 카드 개수
mList = list(map(int, input().split()))

nList.sort()

def binary_search(arr, target, start, end):
    if start > end:
        return None

    mid = (start + end) // 2
    
    if arr[mid] == target:
        return target
    elif arr[mid] < target:
        return binary_search(arr, target, mid + 1, end)
    else:
        return binary_search(arr, target, start, mid - 1)

count = {}

for m in mList:
    if binary_search(nList, m, 0, len(nList) - 1) != None:
        if m in count:
            count[m] += 1
        else:
            count[m] = 1

print(count)