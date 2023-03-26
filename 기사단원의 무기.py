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

# 코딩테스트를 하면서 처음 겪었던건데 문제를 풀었는데 시간에 못미쳐서 풀지못한 문제이다
# 처음 코딩할때 약수를 구하기위해 1~n까지 전부 순회하였는데 루트n까지만 반복하면서 시간을 낮추었다
# 그리고 좀 헷갈린 부분이였는데 num != n ** 2 조건은 중복된 약수를 방지하기위함이다
# 개선해야할점이라고 한다면 나는 약수를 받아온 yaksu를 다시 순회하면서 limit보다 클 경우 power로 변경해주었는데
# 굳이 이같은 과정을 겪지않고 처음 돌때 조건문을 걸어주었다면 좀 더 빠르지않을까싶
