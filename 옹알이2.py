def solution(babbling):
    answer = 0
    anounce = ["aya", "ye", "woo", "ma"]
    for babble in babbling:
        for text in anounce:
            if text * 2 not in babble:
                babble = babble.replace(text, ' ')
        if babble.strip() == '':
            answer += 1
    return answer
