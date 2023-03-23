def solution(dartResult):
    num = ''
    score = []
    for n in dartResult:
        if n.isnumeric():
            print(n)
            num += n
        elif n == 'S':
            score.append(int(num) ** 1)
            num = ''
        elif n == 'D':
            score.append(int(num) ** 2)
            num = ''
        elif n == 'T':
            score.append(int(num) ** 3)
            num = ''
        elif n == '*':
            if len(score) < 2:
                score[-1] = score[-1] * 2
            else:
                score[-2] = score[-2] * 2
                score[-1] = score[-1] * 2
            
        elif n == '#':
            score[-1] = score[-1] * (-1)
        
    return sum(score)
