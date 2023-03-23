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

# isnumeric()은 해당 문자열에 숫자에 관련된게 존재할 경우 True 반환
# 리스트에 대한 요소의 길이를 구할때 len(리스트)를 통해서 구할 수 있음
# 리스트에 대한 인덱스로 접근할때 -1과 같은 음수를 통해서 맨 마지막 요소에 접근 가
