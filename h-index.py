numbers = [1, 4, 1, 4, 2, 1, 3, 5, 6]

counts = {}

i  = 0
while i < len(numbers):
    if numbers[i] not in counts:
        counts[numbers[i]] = 0

    if counts[numbers[i]] == 0:
        j = 0
        while j < len(numbers):
            if numbers[j] >= numbers[i]:
                counts[numbers[i]] += 1
            j += 1
        print(numbers[i])
        print(counts[numbers[i]])
    i += 1

print(counts)

def h_index(counts):
    for key in counts.keys():
        if counts[key] == key:
            return key    
    return None

print(h_index(counts))