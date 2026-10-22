## Set Interface and Arrays

For an unsorted array-based set:

- `find(k)`: $O(n)$
- `insert(x)`: $O(n)$ because the array must be searched to determine whether `x.key` already exists.
- `delete(k)`: $O(n)$ because the item with key `k` must first be found.

Sorting the array can make searching faster, but maintaining sorted order makes insertion and deletion more expensive.

## Sorting

- **Destructive:** modifies or overwrites the original input array.
- **In-place:** uses only $O(1)$ additional space.

These describe different properties: destructive refers to modifying the input, while in-place refers to extra memory usage.

## Selection Sort

Selection sort repeatedly finds the maximum element in a prefix and moves it to the end of that prefix.

The helper function `prefix_max(A, i)` recursively finds the index of the maximum element in `A[:i+1]`.

Its recurrence is:

$$
S(n) = S(n-1) + \Theta(1)
$$

so:

$$
S(n) = \Theta(n)
$$

Selection sort calls this linear-time operation repeatedly:

$$
T(n) = T(n-1) + \Theta(n)
$$

which gives:

$$
T(n) = \Theta(n^2)
$$

## Merge Sort

Merge sort uses **divide and conquer**:

1. Divide the array into two halves.
2. Recursively sort each half.
3. Merge the two sorted halves.

Each level of merging processes $\Theta(n)$ elements, and there are $\Theta(\log n)$ levels.

Therefore:

$$
T(n) = \Theta(n \log n)
$$

## Key Takeaways

- Recursion solves a problem using solutions to smaller versions of the same problem.
- Selection sort takes $\Theta(n^2)$ time.
- Merge sort improves this to $\Theta(n \log n)$ using divide and conquer.
- A major goal of algorithm analysis is understanding why different approaches to the same problem have different growth rates.