def solution(arr):
    answer = 0
    total = 0
    for element in arr:
        total += element
    answer = total / len(arr)
    return answer

def solution1(arr):
    return sum(arr) / len(arr)

print(solution([1, 2, 3, 4, 5]))
