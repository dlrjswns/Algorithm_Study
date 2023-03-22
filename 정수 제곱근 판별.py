def solution(n):
    num = n ** 0.5
    if num == int(num):
        return (num + 1) ** 2
    return -1
