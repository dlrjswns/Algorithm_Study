def solution(n):
    answer = 0
    count = 0
    for element in range(1, n+1):
        if n % element == 0:
            answer += element
    return answer
print(solution(12))
