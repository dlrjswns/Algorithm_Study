K, N = map(int, input().split()) # 오영식이 이미 가지고있는 랜선의 개수는 K, 필요한 랜선의 개수는 N

# 랜선의 길이는 모두 같은 길이여야하며 N개를 만들어야 함
lensun_list = []

for _ in range(K):
    lensun_list.append(int(input()))

def binary_search(min, max):
    if min > max:
        return max

    mid = (min + max) // 2 # 자른 이후 랜선의 길이

    target = K

    for lensun in lensun_list:
        target += lensun // mid - 1

    # if target == N:
    #     return mid
    if target < N:
        return binary_search(min, mid - 1)
    else:
        return binary_search(mid + 1, max)

print(binary_search(1, max(lensun_list)))