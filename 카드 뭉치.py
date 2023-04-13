def solution(cards1, cards2, goal):
    answer = "Yes"
    card1Idx = 0
    card2Idx = 0
    for word in goal:
        if len(cards1) > card1Idx and word == cards1[card1Idx]:
            card1Idx += 1
        elif len(cards2) > card2Idx and word == cards2[card2Idx]:
            card2Idx += 1
        else:
            answer = "No"
            break
            
    return answer
