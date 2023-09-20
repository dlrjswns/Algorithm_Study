def solution(s):
    if s[0] == ')':
        return False
    
    data = []
    for i in s:
        if i == '(':
            data.append(i)
        else:
            if data != []:
                data.pop()
            else:
                return False
                
    return data == []
