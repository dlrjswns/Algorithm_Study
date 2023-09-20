import sys

N = int(input())
letterList = []

for _ in range(N):
    letterList.append(input())

uniqueLetterList = list(set(letterList))

uniqueLetterList.sort()
uniqueLetterList.sort(key=lambda a:len(a))

for letter in uniqueLetterList:
    print(letter)