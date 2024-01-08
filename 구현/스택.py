N = int(input())
stack = []

for _ in N:
    command = input().split()
    firstCommand = command[0]
    if firstCommand == 'push':
        stack.append(command[1])
    elif firstCommand == 'top':
        print(stack[-1])
    elif firstCommand == 'size':
        print(len(stack))
    elif firstCommand == 'pop':
        print(stack.pop(-1))
    elif firstCommand == 'empty':
        if len(stack) == 0:
            print(1)
        else:
            print(0)