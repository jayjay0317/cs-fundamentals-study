# Binary Trees

A binary tree node stores an item and pointers to its parent, left child, and right child.

- The root has no parent.
- A leaf has no children.
- `depth(X)`: number of edges from node `X` to the root.
- `height(X)`: number of edges in the longest downward path from `X` to a leaf.
- $h$: height of the root, or height of the tree.

## Traversal Order

Binary trees have an inherent traversal order:

- Nodes in `X.left` come before `X`.
- `X` comes next.
- Nodes in `X.right` come after `X`.

This is an **in-order traversal**.

### `subtree_first(node)`

Returns the first node in the traversal order of the subtree.

Keep moving left until there is no left child.

### `successor(node)`

Returns the next node in traversal order.

- If `node.right` exists, return `subtree_first(node.right)`.
- Otherwise, move up through parents until the current node is a left child.
- Return that parent.

Navigation operations take $O(h)$ time.

## Dynamic Operations

### `subtree_insert_after(node, new_node)`

- If `node` has no right child, make `new_node` its right child.
- Otherwise, make `new_node` the left child of `successor(node)`.

### `subtree_delete(node)`

- If `node` is a leaf, detach it from its parent.
- Otherwise:
  - If it has a left child, swap its item with its predecessor.
  - Otherwise, swap its item with its successor.
  - Recursively delete the swapped node.

These operations take $O(h)$ time.

## Applications

### Sequence

Traversal order represents sequence order.

### Set / Binary Search Tree

Maintain the **BST property** so that traversal order gives items in increasing key order.