# SML

Objective: implement merge sort in Standard ML (SML) using SML New Jersey

listOfLists:
This is a recursive function the will take a list of values and return a list of lists of those values.  For example:
listOfLists([24,39,50,28,50,1,15,1,35,40,9,8,25,1,2]) returns [[24],[39],[50],[28],[50],[1],[15],[1],[35],[40],[9],[8],[25],[1],[2]]

merge:
This is a recursive function that will take two lists are parameters, each of which is already sorted, and merges the two lists into one sorted list.  For example:
merge([1,1,9,28],[1,2,8,15,24,39,50]) returns [1,1,1,2,8,9,15,24,28,39,50]

mergePass:
This is a recursive function that will take a list of lists and merge pairs of lists.  The number of sublists may not necessarily be even.  For example:
mergePass([[24],[39],[50],[28],[50],[1],[15],[1],[35],[40],[9],[8],[25],[1],[2]]) returns [[24,39],[28,50],[1,50],[1,15],[35,40],[8,9],[1,25],[2]]
mergePass([[24,39],[28,50],[1,50],[1,15],[35,40],[8,9],[1,25],[2]]) returns [[24,28,39,50],[1,1,15,50],[8,9,35,40],[1,2,25]]

mergeSort:
This is a recursive function that will take a list of lists and repeatedly calls mergePass until there is only one sub list, then returns the sub list (not a list of a list).  For example:
mergeSort([[24],[39],[50],[28],[50],[1],[15],[1],[35],[40],[9],[8],[25],[1],[2]]) returns [1,1,1,2,8,9,15,24,25,28,35,39,40,50,50].

mergeSortDriver:
This is a non-recursive function that returns mergeSort of listOfLists.  For example:
mergeSortDriver([24,39,50,28,50,1,15,1,35,40,9,8,25,1,2]) returns [1,1,1,2,8,9,15,24,25,28,35,39,40,50,50]
