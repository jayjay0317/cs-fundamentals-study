# Binary Trees II: Augmentation and AVL Trees

## Set Binary Tree

Traversal order follows increasing key order.

The **BST property** is:

$$
\text{keys in left subtree} < \text{node key} < \text{keys in right subtree}
$$

## Sequence Binary Tree

Traversal order represents sequence order.

Each node can store its subtree size:

$$
\text{size(node)} = \text{number of nodes in its subtree}
$$

### `subtree_at(node, i)`

Let:

$$
n_L = \text{size(node.left)}
$$

Then:

- If $i < n_L$, search the left subtree.
- If $i = n_L$, return the current node.
- If $i > n_L$, search the right subtree with index $i-n_L-1$.

This takes $O(h)$ time.

## Subtree Augmentation

Each node can store $O(1)$ additional information about its subtree.

The stored property should be computable from the node and its children in $O(1)$ time.

Example:

$$
\text{node.size}
=
\text{node.left.size}
+
\text{node.right.size}
+
1
$$

Possible subtree properties include:

- size
- sum
- product
- minimum
- maximum
- height

After insertion or deletion, only the $O(h)$ ancestors of the modified node need to be updated.

## Balanced Binary Trees

If a tree maintains:

$$
h = O(\log n)
$$

then operations that take $O(h)$ become $O(\log n)$.

## AVL Trees

An **AVL tree** is a balanced binary search tree that maintains height balance.

Define:

$$
\text{skew(node)}
=
\text{height(node.right)}
-
\text{height(node.left)}
$$

For an AVL tree:

$$
\text{skew(node)} \in \{-1,0,1\}
$$

Node height can be maintained using:

$$
\text{node.height}
=
1+\max(\text{node.left.height},\text{node.right.height})
$$

If an insertion or deletion causes imbalance, **rotations** restore balance while preserving traversal order.