# '1'은 스위치 켜짐, '0'은 스위치 꺼짐
# 남학생은 스위치 번호가 자기가 받은 수의 배수면 스위치 상태바꿈
# 여학생은 자기가 받은 수와 같은 번호가 붙은 스위치를 중심으로 좌우 대칭이면서 가장 많은 스위치 포함하는 구간 바꿈

N = int(input()) # N은 스위치 개수
switchState = [] # 스위치 상태 리스트

for _ in range(N):
    switchState.append(list(map(int, input().split())))

studentCount = int(input()) # 학생 수

def switchStateChanged(currentState):
    if currentState == 1:
        return 0
    else:
        return 1


for _ in range(studentCount):
    sex, studentNumber = map(int, input().split()) # 학생 성별(1 -> 남자, 2 -> 여자), 학생이 받은 수
    if sex == 1: # 성별이 남자일 경우
        for i in range(len(switchState) // studentNumber):
            print(i)
            switchState[i] = switchStateChanged(switchState[i])
    else: # 성별이 여자일 경우
        leftSwitchIndex = studentNumber - 2
        rightSwitchIndex = studentNumber

        switchState[studentNumber - 1] = switchStateChanged(switchState[studentNumber - 1]) # 현재 사용자번호 해당하는 스위치 상태 변경
        print(leftSwitchIndex)
        print(rightSwitchIndex)
        while (leftSwitchIndex >= 0 and rightSwitchIndex < len(switchState)):
            if switchState[leftSwitchIndex] == switchState[rightSwitchIndex]:
                switchState[leftSwitchIndex] = switchStateChanged(switchState[leftSwitchIndex])
                switchState[rightSwitchIndex] = switchStateChanged(switchState[rightSwitchIndex])
                # 점점 인덱스 늘려감
                leftSwitchIndex -= 1
                rightSwitchIndex += 1
            else:
                break

            

print(" ".join(switchState))


