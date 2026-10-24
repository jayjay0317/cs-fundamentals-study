# Hashing

## Direct Access Arrays

- Store each item at the index equal to its key.
- `find`, `insert`, and `delete` can take $\Theta(1)$ time.
- Limitation: requires $\Theta(u)$ space, which is wasteful when the key universe is much larger than the number of stored items.
- Assumes keys fit within a machine word, so $u < 2^w$.

## Hashing

A **hash function** maps a key from a large key space to an index in a smaller hash table.

### Collision

A **collision** occurs when two distinct keys are mapped to the same table index.

Two common collision-resolution strategies are:

- **Open addressing:** find another location in the hash table for the colliding item.
- **Chaining:** store colliding items in a separate data structure associated with that table index.

The goal is to keep chains short so that set operations remain fast.

## Hash Functions

### Division Method

$$
h(k) = k \bmod m
$$

where $m$ is the size of the hash table.

This method is simple but may perform poorly for certain patterns of keys.

### Universal Hashing

One example is:

$$
h_{ab}(k) = ((ak+b) \bmod p) \bmod m
$$

where $a$ and $b$ are chosen randomly.

A universal hash family guarantees that for any two distinct keys, the probability of collision is at most $1/m$.

This leads to short chains in expectation.

## Load Factor

The **load factor** is:

$$
\alpha = \frac{n}{m}
$$

where:

- $n$ = number of stored items
- $m$ = number of hash table slots

If $m=\Theta(n)$, then:

$$
\frac{n}{m}=\Theta(1)
$$

so the expected chain length remains constant.

Therefore, hash-table operations such as `find`, `insert`, and `delete` can run in expected $O(1)$ time when the table is sized appropriately.