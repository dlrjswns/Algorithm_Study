testCase = int(input())
answer = []
correctAnswer = [] # 

for _ in range(testCase):
    answer.append(input())

for result in answer:
    count = 0
    for c in result:
        if c == "O":
            count += 1
            correctAnswer.append(count)
        else:
            count = 0
            correctAnswer.append(count)
    print(sum(correctAnswer))
    correctAnswer = []