def solution(A,B):
    sum = 0
    A.sort(reverse = True)
    B.sort()
    print(A)
    for i in range(len(A)):
        sum += A[i] * B[i]
            
    return sum
