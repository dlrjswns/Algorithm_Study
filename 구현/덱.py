import sys

N = int(sys.stdin.readline()) # N은 주어진 명령의 수
dequeue = [] # 정수를 저장하는 덱

for _ in range(N):
    letter = sys.stdin.readline().split()

    if letter[0] == 'push_back':
        num = int(letter[1])
        dequeue.append(num)
    elif letter[0] == 'push_front':
        num = int(letter[1])
        dequeue.insert(0, num)
    elif letter[0] == 'front':
        if len(dequeue) == 0:
            print(-1)
        else:
            print(dequeue[0])
    elif letter[0] == 'back':
        if len(dequeue) == 0:
            print(-1)
        else:
            print(dequeue[-1])
    elif letter[0] == 'size':
        print(len(dequeue))
    elif letter[0] == 'empty':
        if len(dequeue) == 0:
            print(1)
        else:
            print(0)
    elif letter[0] == 'pop_front':
        if len(dequeue) == 0:
            print(-1)
        else:
            firstElement = dequeue.pop(0)
            print(firstElement)
    elif letter[0] == 'pop_back':
        if len(dequeue) == 0:
            print(-1)
        else:
            lastElement = dequeue.pop(-1)
            print(lastElement)