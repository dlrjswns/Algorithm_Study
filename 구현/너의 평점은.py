N = 20 # 과목 수 20개

scoreInfo = {
    'A+': 4.5,
    'A0': 4.0,
    'B+': 3.5,
    'B0': 3.0,
    'C+': 2.5,
    'C0': 2.0,
    'D+': 1.5,
    'D0': 1.0,
    'F': 0
}

sumPerSubject = 0 # 전공과목별의 합
sumScore = 0 # 학점의 총합

for _ in range(N):
    inputLetter = input().split()
    subjectName = inputLetter[0] # 과목 이름
    score = float(inputLetter[1]) # 과목 학점
    level = inputLetter[2] # 과목 등급

    if level == 'P':
        continue


    averageSubject = scoreInfo[level] # 과목평점
    sumPerSubject += averageSubject * score
    
    sumScore += score

print(sumPerSubject / sumScore) # 전공평점