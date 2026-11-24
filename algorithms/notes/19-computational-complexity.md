# Lecture 19: Computational Complexity

## Complexity Classes

A decision problem is a problem whose answer is either Yes or No.

- **P:** Decision problems solvable in polynomial time.
- **EXP:** Decision problems solvable in exponential time.
- **R:** Decision problems solvable in finite time for every input (decidable problems).

## Computability

### Halting Problem

Given a computer program and its input, determine whether the program eventually halts.

The Halting Problem is undecidable because no algorithm can correctly answer this question for every possible program and input.

Therefore, the Halting Problem is not in R.

### Most Decision Problems Are Uncomputable

- A program can be encoded as a finite string of bits.
- All finite binary strings can be enumerated using natural numbers.
- Therefore, the set of all programs is countable.

A decision problem can be represented as a function:

$$
f:\mathbb{N}\rightarrow\{0,1\}
$$

Each possible input is assigned a Yes or No answer.

- A decision problem corresponds to an infinite binary sequence.
- The set of all infinite binary sequences is uncountable.
- There are more possible decision problems than programs.

Therefore, not every decision problem can be solved by a program.

Fortunately, many problems of practical interest are decidable.

## NP (Nondeterministic Polynomial Time)

NP is the class of decision problems solvable in polynomial time by a nondeterministic algorithm.

### Nondeterministic Model

- The algorithm makes a polynomial number of binary guesses.
- It checks whether the guessed solution is valid.
- If the correct answer is Yes, at least one sequence of guesses leads to acceptance.
- If the correct answer is No, every sequence of guesses leads to rejection.

This is sometimes described as a "lucky algorithm."

### Polynomial-Time Verification

Equivalently, NP is the class of decision problems whose Yes answers can be verified in polynomial time using polynomial-length certificates.

A certificate provides evidence that the answer to a decision problem is Yes.

Given a problem input and a certificate:

- For every Yes input, there exists a certificate that the verifier accepts.
- For every No input, the verifier rejects every certificate.

### Example: Tetris

Consider the generalized Tetris decision problem.

- Guess a sequence of moves for the given pieces.
- Verify that every move follows the game rules.
- Check whether all pieces can be placed successfully.

The certificate is a sequence of successful moves.

Since the certificate can be represented and verified in polynomial time, this Tetris problem belongs to NP.

## P vs. NP

Every problem in P is also in NP.

$$
P\subseteq NP
$$

Whether every problem in NP can also be solved in polynomial time remains an open question.

$$
P\overset{?}{=}NP
$$

- **P:** Efficiently solvable.
- **NP:** Yes answers are efficiently verifiable.

## Polynomial-Time Reductions

A reduction transforms one problem into another so that solving the second problem provides a solution to the first.

A input → B input → B solution → A solution

If problem A can be reduced to problem B in polynomial time:

- A is at least as easy as B.
- B is at least as hard as A.
- If B can be solved in polynomial time, A can also be solved in polynomial time.

Reductions are transitive, allowing known hard problems to establish the hardness of new problems.

## NP-hard and NP-complete

### NP-hard

A problem is NP-hard if every problem in NP can be reduced to it in polynomial time.

An NP-hard problem is at least as hard as every problem in NP.

An NP-hard problem does not necessarily belong to NP.

### NP-complete

A problem is NP-complete if it satisfies both conditions:

- It belongs to NP.
- It is NP-hard.

$$
\text{NP-complete} = NP \cap \text{NP-hard}
$$

### Proving NP-completeness

To prove that a problem B is NP-complete:

1. Show that B belongs to NP.
2. Reduce a known NP-hard or NP-complete problem A to B in polynomial time.

For example:

3-Partition → Tetris

- 3-Partition is already known to be NP-complete.
- Tetris is at least as hard as 3-Partition.
- Therefore, Tetris is NP-hard.
- Tetris also belongs to NP.
- Therefore, Tetris is NP-complete.

If P is not equal to NP, no NP-complete problem can be solved in polynomial time.

If any NP-complete problem can be solved in polynomial time, then P = NP.

## Key Takeaways

- Not every decision problem is computable.
- Efficiently finding a solution and efficiently verifying a solution are different tasks.
- NP does not stand for non-polynomial.
- Reductions establish relative computational hardness.
- NP-complete problems are the hardest problems within NP under polynomial-time reductions.