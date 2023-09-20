import sys

N, M = map(int, input().split()) # N은 나무의 수, M은 상근이가 집에 가져가려하는 나무의 길이
# M만큼의 나무를 가져가기위한 절단기의 최대높이를 구하라

treeHeightList = list(map(int, sys.stdin.readline().split())) # 나무의 높이
treeHeightList.sort()

def binary_search(start, end):
    if start > end:
        return end

    mid = (start + end) // 2
    
    mTotal = 0

    for treeHeight in treeHeightList:
        if treeHeight - mid >= 0:
            mTotal += treeHeight - mid

    if mTotal == M:
        return mid
    elif mTotal > M:
        return binary_search(mid + 1, end)
    else:
        return binary_search(start, mid - 1)

print(binary_search(1, max(treeHeightList)))