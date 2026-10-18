# Algorithms and Computation

## Core Idea

An algorithm should be both **correct** and **efficient**. Correctness means that the algorithm produces the correct result for every valid input, while efficiency describes how the amount of computation grows as the input size increases.

Instead of measuring an algorithm using actual execution time, which depends on the speed of the computer and implementation details, algorithm analysis counts fundamental operations that are assumed to take a fixed amount of time.

## Correctness

An algorithm needs to be shown to work for arbitrary valid inputs, not just a few examples.

Induction can be used to prove correctness when an algorithm processes an input step by step. In the birthday-matching example, if the algorithm correctly detects duplicate birthdays among the first $k$ people, we can show that it will also work when the $(k+1)$-th person is added.

The new duplicate must either:

- already exist among the first $k$ people, in which case it would already have been found, or
- involve the new person, in which case comparing the new birthday with the previously seen birthdays will find it.

This gives the general idea of proving that an algorithm remains correct as the input grows.

## Efficiency

Efficiency can be measured by asking:

> How many fundamental operations does the algorithm need to perform as a function of the input size?

Actual running time is usually not the main measure because it depends on factors such as processor speed, hardware, programming language, and implementation.

Instead, we analyze how the number of operations grows with the input size $n$.

## Model of Computation

To analyze algorithms independently of a particular computer, we use a **model of computation** that specifies which basic operations are treated as constant-time operations.

MIT 6.006 primarily uses the **Word-RAM model**, where a machine operates on fixed-size words and common operations on those words are assumed to take constant time.

A $w$-bit word contains $w$ bits and can represent $2^w$ different bit patterns. This also relates to how computers address memory, such as the distinction between 32-bit and 64-bit systems.

## Asymptotic Analysis

Asymptotic analysis focuses on how the running time of an algorithm grows as $n$ becomes large.

The main asymptotic notations introduced are:

- $O(\cdot)$: asymptotic upper bound
- $\Omega(\cdot)$: asymptotic lower bound
- $\Theta(\cdot)$: asymptotically tight bound

Constant factors are ignored because asymptotic analysis focuses on the overall growth rate.

For logarithms, the base does not matter asymptotically because changing the base only multiplies the logarithm by a constant factor:

$$
\log_a n = \frac{\log_b n}{\log_b a}
$$

Therefore, $\log_2 n$, $\ln n$, and $\log_{10} n$ all have the same asymptotic growth rate.

It is also important that $\log n$ is **not** a constant. It grows very slowly, so $n\log n$ may appear close to linear for practical input sizes, but its growth rate is still larger than $\Theta(n)$.

## Data Structures

A **data structure** is a way of storing and organizing data while supporting a particular set of operations.

Different data structures may support similar operations but have different efficiency trade-offs. Understanding these trade-offs will be an important part of later topics.