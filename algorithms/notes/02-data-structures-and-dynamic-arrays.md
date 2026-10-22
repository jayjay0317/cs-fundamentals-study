# Data Structures and Dynamic Arrays

## Interface vs. Data Structure

An **interface** specifies what operations are supported, while a **data structure** specifies how those operations are implemented.

Two important interfaces are:

- **Sequence:** items are organized by position.
- **Set:** items are identified by unique keys.

## Arrays

An array stores elements in a **contiguous block of memory**.

Because the address of the $i$-th element can be calculated directly, arrays support fast random access.

| Operation | Complexity |
|---|---:|
| `get_at(i)` | $\Theta(1)$ |
| `set_at(i, x)` | $\Theta(1)$ |
| `build(X)` | $\Theta(n)$ |
| `iter_seq()` | $\Theta(n)$ |

Static arrays have fixed size, so changing the number of elements may require allocating a new array and copying existing elements.

## Linked Lists

A linked list is a **pointer-based data structure** where each node stores an item and a pointer to the next node.

For a basic singly linked list:

- `insert_first`, `delete_first`: $\Theta(1)$
- `get_at(i)`, `set_at(i, x)`: $\Theta(i)$

Linked lists make it easy to change the structure near the front, but they are poor at random access.

## Dynamic Arrays

A dynamic array keeps extra unused capacity so that it does not need to resize after every insertion. Python's `list` is implemented as a dynamic array.

When the array becomes full, it allocates a larger block and copies the existing elements, which takes $\Theta(n)$ time.

However, resizing happens only occasionally.

## Amortized Analysis

Amortized analysis spreads the cost of occasional expensive operations over many cheap operations.

An operation has amortized cost $T(n)$ if $k$ operations cost at most $kT(n)$.

For `insert_last`, geometric resizing gives total copying work of approximately:

$$
1 + 2 + 4 + 8 + \cdots = \Theta(k)
$$

over $k$ insertions.

Therefore, `insert_last` has an amortized running time of $\Theta(1)$.

In contrast, `insert_at(i, x)` may require shifting $\Theta(n)$ elements on every operation.

Repeated insertion at the front gives:

$$
0 + 1 + 2 + \cdots + (k-1) = \Theta(k^2)
$$

so the amortized cost is still linear rather than constant.

## Key Takeaways

- Arrays are strong at random access.
- Linked lists are strong at insertion and deletion near the front.
- Dynamic arrays provide fast indexing and amortized $\Theta(1)$ insertion at the end.
- Inserting or deleting in the middle of an array remains $\Theta(n)$ because elements must be shifted.