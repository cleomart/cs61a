""" Lab 13: Final Review """

# Q3
def permutations(lst):
    """Generates all permutations of sequence LST. Each permutation is a
    list of the elements in LST in a different order.

    The order of the permutations does not matter.

    >>> sorted(permutations([1, 2, 3]))
    [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
    >>> type(permutations([1, 2, 3]))
    <class 'generator'>
    >>> sorted(permutations((10, 20, 30)))
    [[10, 20, 30], [10, 30, 20], [20, 10, 30], [20, 30, 10], [30, 10, 20], [30, 20, 10]]
    >>> sorted(permutations("ab"))
    [['a', 'b'], ['b', 'a']]
    """
    temp1 = []
    temp1.append(lst)
    res = []
    temp = []
    tr = []
    for i in range(0,len(lst)):
        for j in range(0,len(lst)):
            if i < j:
                n = len(temp1)
                for l in range(0,n):
                    tr = temp1[l]
                    for k in range(0,len(tr)):
                        if k == i:
                            temp.append(tr[j])
                        elif k == j:
                            temp.append(tr[i])
                        else:
                            temp.append(tr[k])
                    if temp not in res:
                        res.append(temp)
                    temp1.append(temp)
                    temp = []
    res.append(lst)
    return res;
  
