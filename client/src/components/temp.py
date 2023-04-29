def solution(a, k):
    count = 0
    for i in a:
        print 
        for j in a[i:]:
            print(i, j)
            if (i+j) % k == 0:
                count += 1

    return count

print(solution([1,3,5,7,9], 2))