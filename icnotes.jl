### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 934d714d-b0e5-4a6a-b108-eac944479b8d
md"# In-class Notes for MATH 3032 Mathematical Statistics"

# ╔═╡ a6015bc0-722f-11ec-213e-ebd35b3c5f81
md"## 1.1 Properties of Probability"

# ╔═╡ bb0a3f68-b906-4d65-9319-78d59fcdfaec
md"""
### Definition

The sample space denoted by ``S``
"""

# ╔═╡ 9fa36446-4257-46e9-bb94-5d31513efdb6
md"""
### Example 1

Toss a coin.

$S = \{H, T\}$
"""

# ╔═╡ 5210d41b-5546-41dd-82c1-9df87ea6e4fa
md"""
### Example 2

Roll a die.

$S = \{1,2,3,4,5,6\}$
"""

# ╔═╡ a9e9aea9-249c-4206-a925-dc5ccba9c3de
md"""
### Example 3

Toss a coin and then roll a die.

$S = \{H1, H2, H3, H4, H5, H6, T1, T2, T3, T4, T5, T6\}$
"""

# ╔═╡ 985bcc64-9272-47a2-ab8b-65b3986b668c
md"""
### Definition

``A ⊆ S`` is called an event.

Let ``A, B ⊆ S``.
Then:

- ``A ∪ B`` = the event that either ``A`` or ``B`` occur
- ``A ∩ B`` = the event that both ``A`` and ``B`` occur
- ``A'`` = the event that ``A`` does not occur.
"""

# ╔═╡ 5668356e-b1e5-494c-adee-512aaf1795bf
md"""
### Definition

Let ``S`` be a sample space and ``F`` be the collection of all events of ``S``.
A function ``P : F → ℝ`` is called a probability measure if

(a) ``P(A) ≥ 0``, for all events ``A``.

(b) ``P(S) = 1``

(c) If ``A_1, A_2, …`` are events and ``A_i ∩ A_j = ∅``, for all ``i ≠ j``, then ``P(A_1 ∪ A_2 ∪ ⋯) = P(A_1) + P(A_2) + ⋯``

``(S, F, P)`` is called a probability space.
"""

# ╔═╡ 731c1ed4-8f2f-40e7-99b7-e1032e23c100
md"""
### Example

``S = \{H,T\}``

``F = \{\{H\}, \{T\}, \{H,T\}, ∅\}``

``P(\{H\}) = .2``

``P(\{T\}) = .8``

``P(\{H,T\}) = 1``

``P(∅) = 0``
"""

# ╔═╡ 12b187e8-019b-4eae-aba7-7a304b1e8e57
md"""
### Theorem 1.1-1

``P(A) = 1 - P(A')``, for any event ``A``.
"""

# ╔═╡ f588f21f-a420-4ffb-ba2e-daa9857ee0aa
md"""
### Theorem 1.1-2

``P(∅) = 0``
"""

# ╔═╡ cd7f56aa-a367-4257-8126-5301e63b502b
md"""
### Theorem 1.1-3

If ``A ⊆ B``, then ``P(A) ≤ P(B)``.
"""

# ╔═╡ 610870c9-e704-4551-9ea6-61f1ba1ffbd2
md"""
### Theorem 1.1-4

``P(A) ≤ 1``, for any event ``A``.
"""

# ╔═╡ 199a0b9f-cd2a-416a-b901-69ad1d4ce9c2
md"""
### Theorem 1.1-5 (Inclusion-Exclusion Principle)

For any events ``A,B``, we have ``P(A ∪ B) = P(A) + P(B) - P(A ∩ B)``.

#### Proof

LHS

$\begin{align*}
P(A ∪ B) = P(A - B) + P(A ∩ B) + P(B - A)
\end{align*}$

RHS

$\begin{align*}
P(A) + P(B) - P(A ∩ B) &= P(A - B) + P(A ∩ B) + P(B - A) + P(A ∩ B)
- P(A ∩ B) \\
&= LHS
\end{align*}$
"""

# ╔═╡ a793ca45-9ec0-4606-bef3-ba0e37f32324
md"""
### Theorem 1.1-6

``P(A ∪ B ∪ C) = P(A) + P(B) + P(C) - P(A ∩ B) - P(A ∩ C) - P(B ∩ C) + P(A ∩ B ∩ C)``
"""

# ╔═╡ 147c4ff5-bb36-439b-9ee5-9920ccf82a86
md"""
### Theorem 1.1-6 for N events

``\displaystyle P(A_1 ∪ ⋯ ∪ A_n) = \sum_{k = 1}^n (-1)^{k-1} \sum_{1 ≤ i_1 < i_2 < ⋯ < i_k ≤ n} P(A_{i_1} ∩ ⋯ ∩ A_{i_{k}})``

Let ``I_A`` = Indicator function of ``A = \begin{cases} 1 &\text{if } x ∈ A \\ 0 &\text{if } x ∉ A \end{cases}``

``E(I_A) = P(A)``

``E(I_A I_B) = P(A ∩ B)``
"""

# ╔═╡ 97912b29-a7df-4013-a0c5-5e96a9d4939f
md"## Multiplication Principle"

# ╔═╡ 6ef599dd-02aa-418e-9134-0e296e9b78c0
md"""
Suppose experiment ``E_1`` has ``n_1`` possible outcomes and for each outcome of ``E_1``, experiment ``E_2`` has ``n_2`` possible outcomes, then experiment ``E_1 E_2`` has ``n_1 n_2`` possible outcomes.
"""

# ╔═╡ bb0c0ffe-723b-49de-a926-3331985266e4
md"""
Population size ``n``

Sample size ``r``

|    | Sampling without replacement | Sampling with replacement |
|----|----|----|
| Ordered samples (permutations) | ``_nP_r = \frac{n!}{(n - r)!}`` | ``n^r`` |
| Unordered samples (combinations) | ``_nC_r = \frac{n!}{(n - r)! r!}`` | ``\begin{pmatrix} n + r - 1 \\ r \end{pmatrix}`` |
"""

# ╔═╡ 5fccf54c-4632-43df-b8be-7812abd3494e
md"""
### Example

Suppose we have ``\{a, b, c\}``.
Choose 2.

$\begin{align*}
\text{Combinations} &→ \text{Permutations} \\
\{a,b\} &→ \begin{cases} (a,b) \\ (b,a) \end{cases} \\
\{b,c\} &→ \begin{cases} (b,c) \\ (c,b) \end{cases} \\
\{a,c\} &→ \begin{cases} (a,c) \\ (c,a) \end{cases}
\end{align*}$

Notice that there are ``r!`` permutations for each combination.
This explains why ``{}_nC_r ⋅ r! = {}_nP_r``.
"""

# ╔═╡ d088a1fc-1a8d-47fb-9a6b-6d1e2c3bc2d4
md"""
### Example

Suppose we have ``\{a,b,c\}``.
Can you choose 6?
Yes, you can with replacement.
How do you calculuate 3 choose 6?
This is a division problem.

Framework:
Think of the problem as having two dividers for ``r = 6`` objects.
So you have 8 slots: 6 slots for the objects and ``n - 1 = 2`` slots for the dividers.
How many combinations are there for the ``n - 1 + r = 8`` slots given?
The answer is

$\begin{pmatrix} n - 1 + r \\ n - 1 \end{pmatrix} = \begin{pmatrix} n + r - 1 \\ r \end{pmatrix}$
"""

# ╔═╡ 2490d5fd-9333-4a4d-a400-d1b4d167e3f3
md"""
### Example

3 flavors.
Buy a box of 12 donuts.

$\begin{pmatrix} n - 1 + r \\ n - 1 \end{pmatrix} = \begin{pmatrix} 12 + 2 \\ 2 \end{pmatrix} = \begin{pmatrix} 14 \\ 2 \end{pmatrix}$

$\begin{pmatrix} n + r - 1 \\ r \end{pmatrix} = \begin{pmatrix} 3 + 12 - 1 \\ 12 \end{pmatrix} = \begin{pmatrix} 14 \\ 12 \end{pmatrix} = \begin{pmatrix} 14 \\ 2 \end{pmatrix}$
"""

# ╔═╡ 4bb37da9-9b47-4d4d-8deb-badf17111a31
md"""
### Example

``n = 3``

``(a + b)^3 = (a + b)(a + b)(a + b) = \sum (a \text{ or } b)(a \text{ or } b)(a \text{ or } b)``

E.g.

$\begin{align*}
a \; a \; b → a^2 b \\
a \; b \; a → a^2 b \\
b \; a \; a → a^2 b \\
\end{align*}$

``\implies \sum_{r = 0}^n \begin{pmatrix} n \\ r \end{pmatrix} a^r b^{n - r}``
"""

# ╔═╡ 581bf230-5f37-4f75-a31a-3a8f50b0c832
md"""
## Multinomial coefficients

$\begin{align*}

(a_1 + a_2 + ⋯ + a_s)^n &= \sum \begin{pmatrix} n \\ n_1, n_2, …, n_s \end{pmatrix} {a_1}^{n_1} {a_2}^{n_2} ⋯ {a_s}^{n_s}
\end{align*}$

$n_1 + n_2 + ⋯ + n_s = n \qquad 0 ≤ n_i ≤ n$

$\begin{pmatrix} n \\ n_1 \end{pmatrix} \begin{pmatrix} n - n_1 \\ n_2 \end{pmatrix} \begin{pmatrix} n - n_1 - n_2 \\ n_3 \end{pmatrix} \begin{pmatrix} n - n_1 - n_2 - ⋯ - n_{s - 1} \\ n_s \end{pmatrix}=$

$\frac{n!}{(n - n_1)! {n_1}!} \frac{(n - n_1)!}{(n - n_1 - n_2)! {n_2}!} \frac{(n - n_1 - n_2)!}{(n - n_1 - n_2 - n_3)! {n_3}!} ⋯ \frac{(n - n_1 - n_2 - ⋯ - {n_{s-2}})!}{(n - n_1 - n_2 - ⋯ - n_{s-1})! {n_{s-1}}!}$

$=\frac{n!}{n_1!n_2!⋯n_s!}$
"""

# ╔═╡ 32200f0c-2b05-48f1-8196-4e434930d7df
md"""
### Problem 1.2-11

52 cards choose 5 at random w/o replacement

**(a)**

$P(\text{all spades}) = \frac{\begin{pmatrix} 13 \\ 5 \end{pmatrix}}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}}$

**(b)**

$P(\text{exactly 3 kings and 2 queens}) = \frac{\begin{pmatrix} 4 \\ 3 \end{pmatrix} \begin{pmatrix} 4 \\ 2 \end{pmatrix}}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}}$

**(c)**

$P(\text{2 kings, 2 queens, 1 jack}) = \frac{\begin{pmatrix} 4 \\ 2 \end{pmatrix} \begin{pmatrix} 4 \\ 2 \end{pmatrix} \begin{pmatrix} 4 \\ 1 \end{pmatrix}}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}}$
"""

# ╔═╡ fb2629b9-88ed-47ec-a948-34504f68cc09
md"""
### Problem 1.2-12

(a)

$\sum_{r = 0}^n (-1)^r \begin{pmatrix} n \\ r \end{pmatrix} = 0$

(b)

$\sum_{r = 0}^n \begin{pmatrix} n \\ r \end{pmatrix} = 2^n$

#### Application

$\begin{pmatrix} 5 \\ 0 \end{pmatrix} - \begin{pmatrix} 5 \\ 1 \end{pmatrix} + \begin{pmatrix} 5 \\ 2 \end{pmatrix} - \begin{pmatrix} 5 \\ 3 \end{pmatrix} + \begin{pmatrix} 5 \\ 4 \end{pmatrix} - \begin{pmatrix} 5 \\ 5 \end{pmatrix} = 0$

#### Application

$\begin{pmatrix} 5 \\ 0 \end{pmatrix} + \begin{pmatrix} 5 \\ 1 \end{pmatrix} + \begin{pmatrix} 5 \\ 2 \end{pmatrix} + \begin{pmatrix} 5 \\ 3 \end{pmatrix} + \begin{pmatrix} 5 \\ 4 \end{pmatrix} + \begin{pmatrix} 5 \\ 5 \end{pmatrix} = 2^5$
"""

# ╔═╡ 3178268c-76e6-4a68-a9a1-18e15da2ad3c
md"""
## 1.5 Conditional Probability
"""

# ╔═╡ 8ebdbcfc-2f3f-45bf-97fa-c7b8115257c3
md"""
### Definition

The conditional probability 
"""

# ╔═╡ d9e45541-ec0f-4210-a556-dcf79e98b519
md"""
### Theorem

``P(A ∣ B)`` is a probability measure over events ``A``, i.e., if

1. ``P(A ∣ B) ≥ 0``

2. ``P(S ∣ B) = 1``

3. Let ``A_1, A_2, …`` be mutually exclusive events. Then ``P(A_1 ∪ A_2 ∪ ⋯ ∣ B) = P(A_1 ∣ B) + P(A_2 ∣ B) + ⋯``

#### Proof

$\begin{align*}
\text{LHS} &= P(A_1 ∪ A_2 ∪ ⋯ ∣ B) \\
&= \frac{P((A_1 ∪ A_2 ∪ ⋯) ∩ B)}{P(B)} \\
&= \frac{P((A_1 ∩ B) ∪ (A_2 ∩ B) ∪ ⋯)}{P(B)} \\
&= \frac{P(A_1 ∩ B) + P(A_2 ∩ B) + ⋯}{P(B)}
\end{align*}$
"""

# ╔═╡ 48a17f69-9148-46f6-bf6e-9676e5805e9b
md"""
### Example

$P(A' ∣ B) = 1 - P(A ∣ B)$
"""

# ╔═╡ 3b30c65d-3f5e-4eaa-8a5b-a676ae178450
md"""
### Multiplication Rule

$P(A ∩ B) = P(B) P(A ∣ B)$

$\begin{align*}
&P(A_1 ∩ A_2 ∩ ⋯ ∩ A_n) \\
&= P(A_1) P(A_2 ∣ A_1) P(A_3 ∣ A_1 ∩ A_2) ⋯ P(A_n ∣ A_1 ∩ A_2 ∩ ⋯ ∩ A_{n-1})
\end{align*}$
"""

# ╔═╡ 706674bb-38c4-4ccf-9c0c-f7df8feb5df8
md"""
### Example

Choose 2 balls one at a time without replacement from a bag with 4 red and 5 green marbles.

$P(\text{1st }r \text{ and } \text{2nd }g) = P(\text{1st }r) P(\text{2nd }g ∣ \text{1st }r) = \frac{4}{9} ⋅ \frac{5}{8} = \frac{5}{18}$
"""

# ╔═╡ 2b7a3af8-0fba-4880-8e59-1ecb4c7b3f06
md"""
### Example 1.3-8

52 cards. Choose 4 cards without replacement.

$P(\text{spade, heart, diamond, and a club in order})$

$\begin{align*}
&= \frac{13}{52} ⋅ \frac{13}{51} ⋅ \frac{13}{50} ⋅ \frac{13}{49}
\end{align*}$
"""

# ╔═╡ 3cdc472c-7a01-4ff6-8a3d-ee37bf540a42
md"""
### Theorem (Law of Total Probability)

Let ``\{B_1, B_2, …, B_n\}`` be a partition of a sample space ``S``.
Suppose ``P(B_i) > 0``.
Then

$\begin{align*}
P(A) &= P(A ∩ B_1) + P(A ∩ B_2) + ⋯ + P(A ∩ B) \\
&= P(B_1)P(A∣B_1) + P(B_2)P(A∣B_2) + ⋯ + P(B_n)P(A∣B_n)
\end{align*}$
"""

# ╔═╡ 05b1b4c0-09c9-4b37-8398-a4b661466ee3
md"""
### Definition

``\{B_1, …, B_n\}`` is a partition of ``S`` if ``⋃_{i=1}^n = S`` and ``B_1, B_2, …, B_n``
"""

# ╔═╡ 417de808-7340-4d47-ab77-795f398240c8
md"""
### Example

`Box I = [r => 3, g => 4]`

`Box II = [r => 5, g => 9]`

Roll a die and choose box I if die terms 1,2, otherwise choose box II.
Then we choose a ball randomly from the selected box.
Find ``P(\text{red})``

$\begin{align*}
&= P(B_1) P(\text{red} ∣ B_1) + P(B_2) P(\text{red} ∣)
\end{align*}$
"""

# ╔═╡ f9f2f5c0-19bf-46f4-9f51-dce410c19cb8
md"## 1.4 Independent Events"

# ╔═╡ 0975f4ed-4634-46a0-99d7-63c04de238d6
md"""
### Definition

Events ``A`` and ``B`` are independent if ``P(A ∩ B) = P(A) P(B)``.
"""

# ╔═╡ 43b2d49b-202a-4c96-986c-e592c50afc41
md"""
### Definition

It follows that ``P(A ∣ B) = P(A)`` if ``A,B`` are independent.
"""

# ╔═╡ b7264fd7-b9c0-4f33-a205-f706fd4e17ee
md"""
### Theorem 1.4-1

Suppose ``A`` and ``B`` are independent.
Then

1. ``A`` and ``B'`` are independent

2. ``A'`` and ``B`` are independent

3. ``A'`` and ``B'`` are independent

#### Proof

$\begin{align*}
P(A ∩ B') &= A - (A ∩ B) \\
&= P(A) - P(A ∩ B) \\
&=
\end{align*}$
"""

# ╔═╡ c0a5058f-cd7e-4c76-ba48-ef5c49caff23
md"""
### Definition

``A``, ``B`` and ``C`` are independent if

(1) they are pairwise independent

$\begin{align*}
P(A ∩ B) &= P(A) P(B) \\
P(A ∩ C) &= P(A) P(C) \\
P(B ∩ C) &= P(B) P(C)
\end{align*}$

and

(2)

$P(A ∩ B ∩ C) = P(A) P(B) P(C)$
"""

# ╔═╡ bb1c8e78-be5c-48fd-8180-bad213cb63d7
md"""
### Bayes Theorem

Let ``\{B_1, B_2, ⋯ B_n\}`` be a partition of a sample space ``S``.
Then

$P(B_i ∣ A) = \frac{P(B_i) P(A ∣ B_i)}{\sum_{j = 1}^n P(B_j) P(A ∣ B_j)},$

for all ``i = 1, 2, …, n``.
"""

# ╔═╡ 2e17a3ad-33f2-4071-bb14-526e40b6d5ca
md"""
### Example

Choose a box at random
Then choose a ball from the selected box.

(a) ``P(\text{red})``

``P(\text{red}) = P(\text{box I}) P(\text{red} ∣ \text{box I}) + P(\text{box II}) P(\text{red} ∣ \text{II}) = \frac{1}{2} ⋅ \frac{2}{5} + \frac{1}{2} ⋅ \frac{5}{7}``

(b) ``P(\text{box I} ∣ \text{red})``

$\begin{align*}
&= \frac{\frac{1}{2} ⋅ \frac{2}{5}}{\frac{1}{2} ⋅ \frac{2}{5} + \frac{1}{2} ⋅ \frac{5}{7}}
\end{align*}$
"""

# ╔═╡ 018ab365-858e-4a42-b388-b18e40bf98e4
md"""
### Definition

Let ``S`` be a sample space.

Let ``X`` be a random variable.

``S_X`` = range of ``X`` is called the space of ``X``.
"""

# ╔═╡ af76a4ad-3260-4d52-a272-9b287fc87f99
md"""
### Example

Toss a coin ``S = \{H,T\}``.

``X`` = the number of heads.

``X(H) = 1``

``X(T) = 0``

``X`` is a random variable ``S_X = \{0, 1\}``

If ``P(H) = \frac{1}{3}``, ``P(T) = \frac{2}{3}``, for example, then ``P(X = 0) = P(T) = \frac{2}{3}`` ``P(X = 1) = P(H) = \frac{1}{3}``.

``\mu_X(B) = P(\{w ∣ X(w) ∈ B\})``, ``B ⊆ R``

``\mu_X`` is a probability measure on ``S_X``.

``\mu_X`` is called the probability distribution of ``X``.

If ``S_X`` is a countable set, then ``X`` is called a discrete random variable.
In this case, ``S_X = \{x_1, x_2, …, \}``, ``\mu_X(x_i) = P(X = x_i)`` is called the pmf of ``X``.
"""

# ╔═╡ 1b4db4d0-9dc8-443e-b9e6-0b606ca2513e
md"""
### Definition

$E[u(X)] = \sum_{x ∈ S_X} u(x) f_X(x)$
"""

# ╔═╡ 4819f17a-e6a0-4fb8-b7e7-a670fb210b88
md"""
### Example

$S_X \{-1, 0, 1\}$

$f_X(-1) = f_X(0) = f_X(1) = \frac{1}{3}.$

1st method for finding ``E[X^2]``.

$\begin{align*}
E[X^2] &= (-1)^2 ⋅ f_X(-1) + 0^2 ⋅ f_X(0) + (1)^2 f_X(1) \\
&= \frac{2}{3}
\end{align*}$

2nd method for finding ``E[X^2]``.

Let ``Y = X^2``

Find ``f_Y(y)``

``Y = 0,1``

``S_Y = \{0,1\}``

``f_Y(0) = P(Y = 0) = P(X^2 = 0) = P(X = 0) = \frac{1}{3}``

``f_Y(1) = P(Y = 1) = P(X^2 = 1) = P(X = 1 \text{ or } -1) = f_X(1) + f_X(-1) = \frac{2}{3}``

``E[Y] = 0 ⋅ \frac{1}{3} + 1 ⋅ \frac{2}{3}``
"""

# ╔═╡ 06aeb381-5cda-4a6d-bd33-ca754e21340e
md"""
### Theorem

(a) ``E(c) = c``

(b) ``E[cX] = cE[x]``

(c) ``E[c_1X_1 + c_2X_2] = c_1 E[X_1] + c_2 E[X_2]``
"""

# ╔═╡ d9ec149c-7de2-488b-b0c1-41a352ab3f72
md"""
### Definition

``\mu_X = E[X]`` is called the mean of ``X``

``{\sigma_X}^2 = E[(X - \mu_X)^2]`` is called the variance of ``X``

``\sigma_X`` is called the standard deviation of ``X``.
"""

# ╔═╡ db4b7e0f-017b-40aa-a525-52ab25766ae4
md"""
### Example

``X ∼ \text{Geom}(p)``

``X = 1,2,3,…``

``f_X(k) = P(X = k) = q^{k - 1} p, \qquad p + q = 1, \, 0 ≤ p ≤ 1``


### Geometric series

$\sum_{k=0}^∞ r^k = \begin{cases}
\frac{1}{1 - r}, & |r| < 1 \\
div, & |r| ≥ 1
\end{cases}$

$A = 1 + 2q + 3q^2 + 4q^3 + ⋯$

$qA = q + 2q^2 + 3q^3 + ⋯$

$(1 - q)A = 1 + q + q^2 + q^3 + ⋯ = \frac{1}{1 - q}$
"""

# ╔═╡ 2b9a40c6-d2a7-4214-93b0-85e59be05c19
md"""
### Definition

$M(t) = E(e^{tX})$
"""

# ╔═╡ 5144e544-bd70-4dcb-be3b-a9286b76d287
md"""
### Properties

(a) ``{M_X}^{(n)}(0) = E[X^n]`` if exists

(b) Suppose ``M_X(t) = M_Y(t)`` for all ``t`` on an open interval containing 0, then ``X = Y``, i.e., ``P(X ∈ B) = P(Y ∈ B)``, for all ``B ⊆ R``.
"""

# ╔═╡ 8d1430ec-4cde-42a3-836f-5ddc624accfc
md"""
### Proof (a)

$M_X(t) = E[e^{tX}]$

$M_X'(t) = E[e^{tX} ⋅ X] \implies M_X'(0) = E[X]$

$M_X''(t) = E[e^{tX} ⋅ X^2] \implies M_X'(0) = E[X^2]$

$M_X^{(n)}(t) = E[e^{tX} ⋅ X^n] \implies M_X'(0) = E[X^n]$
"""

# ╔═╡ 0160c4f8-6cab-44e9-a19c-8b98f8873a74
md"""
### Example

$X ∼ \text{Geom}(p)$

Find ``M_X(t)``

$\begin{align*}
M_X(t) &= E[e^{tX}] \\
&= \sum_{k = 1}^∞ e^{tk} q^{k-1} p \\
&= e^t p \sum_{k = 1}^∞ e^{t(k-1)} q^{k-1} \\
&= pe^t \sum_{k = 0}^∞ e^{tk} qk \\
&= pe^t \sum_{k = 0}^∞ (qe^t)^k \\
&= pe^t \frac{1}{1 - qe^t}, \qquad |qe^t| < 1 \\
&= \frac{pe^t}{1 - qe^t}
\end{align*}$

Find ``M_X'(t)``

$\begin{align*}
M_X'(t) &= \frac{d}{dt} \left[(pe^t)(1 - qe^t)^{-1}\right] \\
&= pe^t (1 - qe^t)^{-1} + (pe^t) (-1) (1 - qe^t)^{-2} (-qe^t)
\end{align*}$

Find ``M_X''(t)``

$\begin{align*}
M_X''(t) &= pe^t (1 - qe^t)^{-1} \\
&\quad+ pq e^{2t} (1 - qe^t)^{-2} + 2pq e^{2t} (1 - qe^t)^{-2} \\
&\quad+ (pq e^{2t}) (-2) (1 - qe^t)^{-3} (-qe^t)
\end{align*}$

$\mu = M_X'(0) = \frac{p}{1 - q} + \frac{pq}{(1 - q)^2} = 1 + \frac{pq}{p^2} = 1 + \frac{q}{p} = \frac{p + q}{p} = \frac{1}{p}$

$\begin{align*}
E[X^2] &= M_X''(0) \\
&= \frac{1}{p} + \frac{2pq}{(1 - q)^2} + \frac{2pq^2}{(1 - q)^3} \\
&= \frac{1}{p} + \frac{2pq}{p^2} + \frac{2pq^2}{p^3} \\
&= \frac{1}{p} + \frac{2q}{p} + \frac{2q^2}{p^2}
\end{align*}$

$\begin{align*}
{\sigma_X}^2 &= E[X^2] - \mu^2 \\
&= \frac{1}{p} + \frac{2q}{p} + \frac{2q^2}{p^2} - \frac{1}{p^2} \\
&= \frac{p + 2qp + 2q^2 - 1}{p^2} \\
&= \frac{-q + 2qp + 2q^2}{p^2} \\
&= \frac{q(-1 + 2p + 2q)}{p^2} \\
&= \frac{q}{p^2}
\end{align*}$
"""

# ╔═╡ 97227595-f30a-4ff4-b734-b6adb2fa0f62
md"""
### Example

$X ∼ \text{Geom}(p)$

$M_X(t) = \frac{pe^t}{1 - qe^t}$

$\phi(t) = \ln{M_X(t)} = \ln{(pe^t)} - \ln{(1 - qe^t)} = (\ln{p}) + t - \ln{(1 - qe^t)}$

$\phi'(t) = 1 - \frac{-qe^t}{1 - qe^t}$

$\mu_X = \phi'(0) = \frac{1 + q}{1 - q} = 1 - \frac{q}{p} = \frac{1}{p}$

$\phi''(t) = \frac{(qe^t)(1 - qe^t) - (qe^t)(-qe^t)}{(1 - qe^t)^2}$

$V(X) = \phi''(0) = \frac{q(1 - q) + q^2}{(1 - q)^2} = \frac{q - q^2 + q^2}{p^2} = \frac{q}{p^2}$
"""

# ╔═╡ 94ec1a57-1161-4be0-8443-86562a0b6335
md"""
### Example

$X ∼ \text{Bin}(n,p)$

$M_X(t) = (q + pe^t)^n$

$\phi(t) = \ln M_X{(t)} = n \ln{(q + pe^t)}$

$\phi'(t) = n \frac{pe^t}{q + pe^t}$

$\phi''(t) = n \frac{(pe^t) (q+pe^t) - (pe^t)(pe^t)}{(q + pe^t)^2}$

$\mu_x = \phi'(0) = n ⋅ \frac{p}{q + p} = np$

${\sigma_X}^2 = \phi''(0) = npq$
"""

# ╔═╡ 94306eef-de49-4dab-b1b9-541abee727e0
md"""
### Example

$X ∼ \text{Bin}(n,p)$

$\begin{align*}
M_X(t) &= E[e^{tX}] \\
&= \sum_{k=0}^n e^{tk} \begin{pmatrix} n \\ k \end{pmatrix} p^k q^{n-k} \\
&= \sum_{k=0}^n \begin{pmatrix} n \\ k \end{pmatrix} (pe^t)^k q^{n-k} \\
&= (pe^t + q)^n \quad\text{Binomial Theorem}
\end{align*}$
"""

# ╔═╡ adbe8a6e-d0ad-4405-8f56-028fa92a6834
md"""
### Definition

An experiment is called a Bernoulli trial if it has only two possible outcomes, success or failure

Assume ``P(\text{success}) = P``, ``P(\text{failure}) = 1 - p = q``, ``0 ≤ p ≤ 1``
"""

# ╔═╡ 3bab5ebf-14db-4e12-ab99-76fe3861d0d3
md"""
### Definition

Let ``X`` be the number of success in ``n`` independent Bernoulli trials

$P(X = k) = \begin{pmatrix} n \\ k \end{pmatrix} p^k q^{n-k}$

This is called the ``\text{Bin}(n,p)``.
"""

# ╔═╡ 68be4e04-0bf0-4832-8074-c6e2f2f7f6d8
md"""
### Properties

Let ``X ∼ \text{Bin}(n,p)``
then ``X = Y_1 + Y_2 + ⋯ + Y_n``, where ``Y_1, Y_2, …, Y_n`` are independent ``\text{Ber}(p)`` random variables.

(a) ``E[X] = np``

(c) ``V[X] = npq``

(d) ``M_X(t) = (q + pe^t)^n, \qquad t ∈ ℝ``
"""

# ╔═╡ 7440938a-647b-4d2b-95cd-fff13aa4d5af
md"""
### The Hypergeometric Distribution

$f_X(k) = \frac{\begin{pmatrix} N_1 \\ k \end{pmatrix} \begin{pmatrix} N_2 \\ n - k \end{pmatrix}}{\begin{pmatrix} N \\ n \end{pmatrix}}$

Constraints:

$0 ≤ k ≤ N_1$

$0 ≤ n - k ≤ N_2$

$0 ≤ n ≤ N_1 + N_2$

Denoted

$\text{HG}(N_1, N_2, n)$
"""

# ╔═╡ 2c5a21c9-b854-4ddc-aca7-f7b88307485b
md"""
### Properties

(a) ``\mu_X = n \frac{N_1}{N}``

(b) ``{\sigma_x}^2 = n \frac{N_1}{N} \frac{N_2}{N} \frac{N-n}{N-1}``
"""

# ╔═╡ 3e2ecc17-3016-4194-8a8c-bb7ec960edb6
md"""
### Proof

$\begin{align*}
\mu_X = E[X] &= \sum_{k=0}^N k \frac{\begin{pmatrix} N_1 \\ k \end{pmatrix} \begin{pmatrix} N_2 \\ n - k \end{pmatrix}}{\begin{pmatrix} N \\ n \end{pmatrix}} \\
&= \sum_{k=1}^{N_1} k \frac{\frac{N_1!}{(N_1 - k)! (k - 1)!} \frac{N_2!}{(N_2 - n - k)! (n - k)!}}{\frac{N!}{(N - n)! n!}} \\
&= N_1 \sum_{k = 1}^{N_1} \frac{\frac{(N_1 - 1)!}{[N_1 - 1 - (k - 1)]! (k - 1)!}}{\frac{N}{n} \frac{(N-1)!}{[(n-1)-(n-1)]!(n-1)!}} 
\end{align*}$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─934d714d-b0e5-4a6a-b108-eac944479b8d
# ╟─a6015bc0-722f-11ec-213e-ebd35b3c5f81
# ╟─bb0a3f68-b906-4d65-9319-78d59fcdfaec
# ╟─9fa36446-4257-46e9-bb94-5d31513efdb6
# ╟─5210d41b-5546-41dd-82c1-9df87ea6e4fa
# ╟─a9e9aea9-249c-4206-a925-dc5ccba9c3de
# ╟─985bcc64-9272-47a2-ab8b-65b3986b668c
# ╟─5668356e-b1e5-494c-adee-512aaf1795bf
# ╟─731c1ed4-8f2f-40e7-99b7-e1032e23c100
# ╟─12b187e8-019b-4eae-aba7-7a304b1e8e57
# ╟─f588f21f-a420-4ffb-ba2e-daa9857ee0aa
# ╟─cd7f56aa-a367-4257-8126-5301e63b502b
# ╟─610870c9-e704-4551-9ea6-61f1ba1ffbd2
# ╟─199a0b9f-cd2a-416a-b901-69ad1d4ce9c2
# ╟─a793ca45-9ec0-4606-bef3-ba0e37f32324
# ╟─147c4ff5-bb36-439b-9ee5-9920ccf82a86
# ╟─97912b29-a7df-4013-a0c5-5e96a9d4939f
# ╟─6ef599dd-02aa-418e-9134-0e296e9b78c0
# ╟─bb0c0ffe-723b-49de-a926-3331985266e4
# ╟─5fccf54c-4632-43df-b8be-7812abd3494e
# ╟─d088a1fc-1a8d-47fb-9a6b-6d1e2c3bc2d4
# ╟─2490d5fd-9333-4a4d-a400-d1b4d167e3f3
# ╟─4bb37da9-9b47-4d4d-8deb-badf17111a31
# ╟─581bf230-5f37-4f75-a31a-3a8f50b0c832
# ╟─32200f0c-2b05-48f1-8196-4e434930d7df
# ╟─fb2629b9-88ed-47ec-a948-34504f68cc09
# ╟─3178268c-76e6-4a68-a9a1-18e15da2ad3c
# ╠═8ebdbcfc-2f3f-45bf-97fa-c7b8115257c3
# ╟─d9e45541-ec0f-4210-a556-dcf79e98b519
# ╟─48a17f69-9148-46f6-bf6e-9676e5805e9b
# ╟─3b30c65d-3f5e-4eaa-8a5b-a676ae178450
# ╟─706674bb-38c4-4ccf-9c0c-f7df8feb5df8
# ╟─2b7a3af8-0fba-4880-8e59-1ecb4c7b3f06
# ╟─3cdc472c-7a01-4ff6-8a3d-ee37bf540a42
# ╠═05b1b4c0-09c9-4b37-8398-a4b661466ee3
# ╠═417de808-7340-4d47-ab77-795f398240c8
# ╟─f9f2f5c0-19bf-46f4-9f51-dce410c19cb8
# ╟─0975f4ed-4634-46a0-99d7-63c04de238d6
# ╟─43b2d49b-202a-4c96-986c-e592c50afc41
# ╠═b7264fd7-b9c0-4f33-a205-f706fd4e17ee
# ╟─c0a5058f-cd7e-4c76-ba48-ef5c49caff23
# ╟─bb1c8e78-be5c-48fd-8180-bad213cb63d7
# ╟─2e17a3ad-33f2-4071-bb14-526e40b6d5ca
# ╟─018ab365-858e-4a42-b388-b18e40bf98e4
# ╟─af76a4ad-3260-4d52-a272-9b287fc87f99
# ╟─1b4db4d0-9dc8-443e-b9e6-0b606ca2513e
# ╟─4819f17a-e6a0-4fb8-b7e7-a670fb210b88
# ╟─06aeb381-5cda-4a6d-bd33-ca754e21340e
# ╟─d9ec149c-7de2-488b-b0c1-41a352ab3f72
# ╟─db4b7e0f-017b-40aa-a525-52ab25766ae4
# ╟─2b9a40c6-d2a7-4214-93b0-85e59be05c19
# ╟─5144e544-bd70-4dcb-be3b-a9286b76d287
# ╟─8d1430ec-4cde-42a3-836f-5ddc624accfc
# ╟─0160c4f8-6cab-44e9-a19c-8b98f8873a74
# ╠═97227595-f30a-4ff4-b734-b6adb2fa0f62
# ╟─94ec1a57-1161-4be0-8443-86562a0b6335
# ╟─94306eef-de49-4dab-b1b9-541abee727e0
# ╟─adbe8a6e-d0ad-4405-8f56-028fa92a6834
# ╟─3bab5ebf-14db-4e12-ab99-76fe3861d0d3
# ╟─68be4e04-0bf0-4832-8074-c6e2f2f7f6d8
# ╟─7440938a-647b-4d2b-95cd-fff13aa4d5af
# ╟─2c5a21c9-b854-4ddc-aca7-f7b88307485b
# ╟─3e2ecc17-3016-4194-8a8c-bb7ec960edb6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
