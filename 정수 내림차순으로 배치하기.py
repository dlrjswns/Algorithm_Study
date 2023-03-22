def solution(n):
    ls = list(str(n))
    ls.sort(reverse = True)
        
    return int("".join(ls))

# list(map(int, str(n)))대신에 list(str(n))을 하는 이유는
# 전자는 정수리스트가 후자는 문자리스트가 리턴되게 되는데 맨 마지막 join함수를 사용하기위해선
# 초기 구분자를 ""로 했기때문에 ls가 문자리스트여야만 원하는 값을 얻을 수 있
