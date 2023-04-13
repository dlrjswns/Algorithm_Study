def solution(participant, completion):
    
    participant.sort()
    completion.sort()
    
    for i in range(len(completion)):
        if participant[i] != completion[i]:
            return participant[i]
        
    return participant[-1]

# 2개의 리스트에서 중복된 값을 빼고싶은 경우에 해당 리스트를 sort시킨 이후 for문을 통해 받아온 인덱스값을
# 이용해서 비교하는 것도 유용한 방법!!
