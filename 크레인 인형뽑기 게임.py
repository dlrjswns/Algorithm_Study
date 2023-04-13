def solution(board, moves):
    answer = 0
    result = []
    for move in moves:
        for idx in range(len(board)):
            if board[idx][move - 1] != 0: # 해당 위치에 인형이 존재하면
                result.append(board[idx][move - 1])
                board[idx][move - 1] = 0
                if len(result) > 1:
                    if result[-1] == result[-2]:
                        result.pop(-1)
                        result.pop(-1)
                        answer += 2
                break
    return answer
