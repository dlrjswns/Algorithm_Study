def solution(s, skip, index):
    answer = ''
    alpha = "abcdefghijklmnopqrstuvwxyz"
    for k in skip:
        alpha = alpha.replace(k, "")
    
    for l in s:
        answer += alpha[(alpha.find(l) + index) % len(alpha)]
            
    
    return answer
