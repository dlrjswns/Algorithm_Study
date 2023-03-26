def solution(number, limit, power):
    answer = 0
    yaksu = []
    size = 0
    for num in range(1, number + 1):
        for n in range(1, int(num**0.5) + 1):
            if num % n == 0:
                size += 1
                if num != n ** 2:
                    size += 1
                    
        yaksu.append(size)
        size = 0
    
    for idx in range(len(yaksu)):
        if yaksu[idx] > limit:
            yaksu[idx] = power
    return sum(yaksu)
