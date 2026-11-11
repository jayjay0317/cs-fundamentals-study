# Binary Heaps

## Priority Queue Interface

A priority queue supports a subset of set operations focused on accessing the highest-priority item.

- `build(X)`: build a priority queue from items in `X`
- `insert(x)`: add item `x`
- `find_max()`: return the maximum-key item
- `delete_max()`: remove and return the maximum-key item

### Priority Queue Sort

To sort an array:

1. Build a priority queue containing all items.
2. Repeatedly call `delete_max()`.

Different priority queue implementations lead to different sorting algorithms:

- Unsorted array → selection sort
- Sorted array → insertion sort
- Binary heap → heap sort

## Complete Binary Tree

A **complete binary tree** has $2^i$ nodes at depth $i$, except possibly at the maximum depth, where nodes are left-justified.

Because the number of nodes approximately doubles at each level:

$$
h = O(\log n)
$$

## Implicit Tree Representation

A complete binary tree can be stored directly in an array without parent or child pointers.

For a node at index `i`:

- `left(i) = 2i + 1`
- `right(i) = 2i + 2`
- `parent(i) = (i - 1) // 2`

## Binary Max Heap

A **binary max heap** is an array representing a complete binary tree that satisfies the max-heap property:

For every node, its key is greater than or equal to the keys of its children.

Therefore, the maximum-key item is always at the root.

The heap does not need to be completely sorted; only the parent-child ordering must be maintained.

## Insert

To insert `x`:

1. Add `x` at the end of the array.
2. Call `max_heapify_up()` to restore the max-heap property.

### `max_heapify_up(i)`

- If `i = 0`, stop.
- If the parent key is smaller than `Q[i].key`, swap them.
- Continue from the parent.

Since this moves up at most the height of the tree:

$$
O(h) = O(\log n)
$$

## Delete Maximum

To delete the maximum item:

1. Swap the root with the last item.
2. Remove the last item.
3. Call `max_heapify_down(0)`.

### `max_heapify_down(i)`

- If `i` is a leaf, stop.
- Find the child with the larger key.
- If that child is larger than `Q[i]`, swap them.
- Continue downward from that child.

This also takes:

$$
O(h) = O(\log n)
$$

## In-Place Heap Sort

Heap sort can use the original array itself to store both the heap and the sorted output.

Think of the array as:

`[ active heap | sorted items ]`

- During insertion/building, the heap prefix grows.
- During repeated `delete_max()`, the heap prefix shrinks.
- Maximum items accumulate at the end of the array.

Therefore, heap sort runs in:

$$
O(n \log n)
$$

time while using only $O(1)$ additional space.