
hour, minute = map(int, input().split())


if minute > 45:
    minute -= 45
else:
    if hour != 0:
        rest = 45 - minute
        minute = (60 - rest)
        hour -= 1
    else:
        rest = 45 - minute
        minute = (60 - rest)
        hour = 23
        
print(hour, minute)
