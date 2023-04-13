def solution(n, m, section):
    answer = 0
    where = 0
    for paint in section:
        if paint >= where:
            where = paint + m
            answer += 1
    
    return answer
