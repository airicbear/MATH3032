### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ 93712bd0-90cb-11ec-0c04-0b6ef1a6a89c
md"""
# Math 3032 Quiz 1.1-1.3
"""

# ╔═╡ 1894dee5-6957-4673-9119-634f094c8617
md"""
### Problem 1

Suppose ``P(A) = .22``, ``P(B) = .4``, and ``P(A ∩ B) = .1``.
Find

(a) ``P(A ∪ B)``

(b) ``P(A ∩ B')``

(c) ``P(A' ∩ B')``

**Solution (a).**

$P(A ∪ B) = P(A) + P(B) - P(A ∩ B) = 0.22 + 0.4 - 0.1 = 0.52$

**Solution (b).**

$P(A ∩ B') = P(A) - P(A ∩ B) = 0.22 - 0.1 = 0.12$

**Solution (c).**

$P(A' ∩ B') = 1 - P(A ∪ B) = 0.48$
"""

# ╔═╡ 6c95b6ee-1acd-4c3e-9fa9-2875356ee81e
md"""
### Problem 2

During a visit to the primary care physician's office, the probability of having neither lab work nor referral to a specialist is 0.19.
Of those coming to that office, the probability of having lab work is 0.4 and the probability of having referral is 0.5.

a) What is the probability of having both lab work and a referral?

b) What is the probability of having lab work but not a referral?

**Solution setup.**

$P(L' ∩ R') = 0.19$

$P(L) = 0.4$

$P(R) = 0.5$

$P(L ∪ R) = 1 - P(L' ∩ R') = 0.81$

**Solution (a).**

$P(L ∩ R) = P(L) + P(R) - P(L ∪ R) = 0.4 + 0.5 - 0.81 = 0.09$

**Solution (b).**

$P(L ∩ R') = P(L) - P(L ∩ R) = 0.4 - 0.09 = 0.31$
"""

# ╔═╡ 1121e242-7367-46e1-bb59-a3b0c131625e
md"""
### Problem 3

In a state lottery, 5 digits are drawn at random one at a time with replacement from 0 to 9.
Suppose that you win if any permutation of your selected integers is drawn.
Give the probability of winning if you select

a) 1, 3, 5, 7, 9

b) 3, 3, 5, 5, 7

**Solution setup.**

$\text{Total possibilities} = 10^5$

**Solution (a).**

$\frac{5!}{10^5} = \frac{120}{10^5} = 0.0012$

**Solution (b).**

$\frac{5!}{10^5 2! 2!} = 0.0003$
"""

# ╔═╡ f88c4eeb-a013-4177-bd17-c615b9c20a88
md"""
### Problem 4

The data in the following table shows outcomes of guilty and not-guilty pleas in 1028 criminal court cases

|   | Guilty plea | Not-guilty plea |   |
|---|-------------|-----------------|---|
| Sent to prison | 392 | 58 | 450 |
| Not sent to prison | 564 | 14 | 578 |
|||||
|   | 965 | 72 | 1029 |

a) What is the probability that a randomly selected defendant pled guilty?

b) What is the probability that a randomly selected defendant was sent to prison?

c) What is the probability that a randomly selected defendant pled guilty and was not sent to prison?

d) If a defendant was not sent to prison, what is the probability that the defendant pled guilty?

**Solution (a).**

$\frac{956}{1028} = 0.93$

**Solution (b).**

$\frac{450}{1028} = 0.4377$

**Solution (c).**

$\frac{564}{1028} = 0.5486$

**Solution (d).**

$\frac{564}{578} = 0.9758$
"""

# ╔═╡ 9ee091cf-627f-4233-beff-4069add5859c
md"""
### Problem 5

An urn contains four colored balls: two orange and two blue.
Two balls are selected at random without replacement, and you are told that at least one of them is orange.
What is the probability that the other ball is also orange?

**Solution.**

$P(\text{both orange} ∣ \text{at least one orange})$

$\begin{align*}
&= \frac{\frac{\begin{pmatrix} 2 \\ 2 \end{pmatrix}}{\begin{pmatrix} 4 \\ 2 \end{pmatrix}}}{\frac{\begin{pmatrix} 2 \\ 2 \end{pmatrix}}{\begin{pmatrix} 4 \\ 2 \end{pmatrix}} + \frac{\begin{pmatrix} 2 \\ 1 \end{pmatrix} \begin{pmatrix} 2 \\ 1 \end{pmatrix}}{\begin{pmatrix} 4 \\ 2 \end{pmatrix}}} \\
&= \frac{1}{1 + 4} \\
&= \frac{1}{5} \\
&= 0.2
\end{align*}$
"""

# ╔═╡ 36149e4c-c7ba-400c-a182-cd504ae96191
md"""
### Problem 6

Bowl A contains five red and three white balls and bowl B contains four red and seven white balls.
A ball is drawn at random from bowl A and transferred to bowl B.
Find the probability of then drawing a red ball from bowl B.

**Solution.**

$P(\text{2nd red}) = P(\text{1st red}) P(\text{2nd red} ∣ \text{1st red}) + P(\text{1st white}) P(\text{2nd red} ∣ \text{1st white})$

$= \frac{5}{8} ⋅ \frac{5}{12} + \frac{3}{8} ⋅ \frac{4}{12}$

$= \frac{25 + 12}{96} = \frac{37}{96} = 0.3854$
"""

# ╔═╡ db1e9001-07ad-4dae-97b8-12b52c5afd21
md"""
### Problem 7

Prove that if ``P(A) > 0``, then the conditional probability given ``A`` satisfies the axioms of probability measure.

**Solution (1st axiom).** ``P(B ∣ A) ≥ 0``

$P(B ∣ A) = \frac{P(A ∩ B)}{P(A)} ≥ 0$

**Solution (2nd axiom).** ``P(S ∣ A) = 1``

$P(S ∣ A) = \frac{P(S ∩ A)}{P(A)} = \frac{P(A)}{P(A)} = 1$

**Solution (3rd axiom).** Show ``\displaystyle P\left(⋃_{i = 1}^∞ B_i ∣ A\right) = \sum_{i = 1}^∞ P(B_i ∣ A)``

$\begin{align*}
P\left(⋃_{i = 1}^∞ B_i ∣ A\right) &= \frac{P\left(\left(⋃_{i = 1}^∞ B_i\right) ∩ A\right)}{P(A)} \\
&= \frac{P\left(⋃_{i = 1}^∞ \left(B_i ∩ A\right)\right)}{P(A)} \\
&= \frac{\sum_{i = 1}^∞ P\left(B_i ∩ A\right)}{P(A)} \\
&= \sum_{i = 1}^∞ P(B_i ∣ A)
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
# ╟─93712bd0-90cb-11ec-0c04-0b6ef1a6a89c
# ╟─1894dee5-6957-4673-9119-634f094c8617
# ╟─6c95b6ee-1acd-4c3e-9fa9-2875356ee81e
# ╟─1121e242-7367-46e1-bb59-a3b0c131625e
# ╟─f88c4eeb-a013-4177-bd17-c615b9c20a88
# ╟─9ee091cf-627f-4233-beff-4069add5859c
# ╟─36149e4c-c7ba-400c-a182-cd504ae96191
# ╟─db1e9001-07ad-4dae-97b8-12b52c5afd21
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
