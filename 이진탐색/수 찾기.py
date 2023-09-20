N = int(input())

nList = list(map(int, input().split()))

M = int(input())
mList = list(map(int, input().split()))

nList.sort()

def binary_search (arr, target, start, end):
    
    if start > end:
        return None
    
    # 중간 인덱스는 시작 인덱스와 마지막 인덱스 사이의 중간 인덱스
    # 몫만 구하기 위해 // 연산자 활용
    mid = (start + end) // 2
    
    # 중간 인덱스의 값이 타겟 데이터와 같은 경우 탐색 종료
    if arr[mid] == target:
        return mid
        
    # 중간 인덱스의 값이 타겟 데이터보다 큰 경우
    # 마지막 인덱스를 중간 인덱스의 한 칸 앞으로 이동
    elif arr[mid] > target:
        return binary_search(arr, target, start, mid-1)
        
    # 중간 인덱스의 값이 타겟 데이터보다 작은 경우
    # 시작 인덱스를 중간 인덱스의 한 칸 뒤로 이동
    else:
        return binary_search(arr, target, mid+1, end)

for m in mList:
    res = binary_search(nList, m, 0, len(nList) - 1)
    if res == None:
        print(0)
    else:
        print(1)