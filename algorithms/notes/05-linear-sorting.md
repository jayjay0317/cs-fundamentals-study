# Linear Sorting

## Comparison Sorting

In the comparison model, sorting algorithms determine order only by comparing keys.

Comparison-based sorting cannot do better than $\Omega(n \log n)$ in general.

## Stable Sorting

A sorting algorithm is **stable** if items with the same key preserve their original relative order.

Stability is important when sorting by multiple keys.

## Counting Sort

Counting sort uses the key values directly instead of comparing items.

- Count the $n$ items: $O(n)$
- Process the possible key range of size $u$: $O(u)$

Therefore:

$$
O(n + u)
$$

If $u = O(n)$, counting sort runs in $O(n)$ time.

It becomes inefficient when the key range is much larger than the number of items.

## Radix Sort

Radix sort represents integer keys as base-$n$ digits and sorts the digits from least significant to most significant using stable counting sort.

The number of digits is approximately:

$$
\log_n u
$$

where $u$ is the key universe size.

Radix sort can run in linear time when $u = O(n^c)$ for a constant $c$.

## Key Takeaway

Linear-time sorting is possible by using additional structure in integer keys instead of relying only on comparisons.