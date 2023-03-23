def solution(x):
    sum1 = sum(list(map(int, str(x))))
    if x % sum1 == 0:
        return True
    return False
