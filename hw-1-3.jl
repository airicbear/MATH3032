### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 53db699c-77e2-11ec-1d59-77d1e8191d3a
md"""
# HW 1.3

Eric Nguyen
"""

# ╔═╡ 0f460e2f-1f0b-4beb-b4e5-b4a47fa3b4c7
md"""
### Problem 1.3-1

**(a).**
``P(B_1) = \frac{5000}{1000000} = \frac{1}{200} = 0.05\%``

**(b).**
``P(A_1) = \frac{78515}{1000000} = 7.8515\%``

**(c).**
``P(A_1 ∣ B_2) = \frac{P(A_1 ∩ B_2)}{P(B_2)} = \frac{\frac{73630}{1000000}}{\frac{995000}{1000000}} = \frac{73630}{995000} = 7.4\%``

**(d).**
``P(B_1 ∣ A_1) = \frac{P(B_1 ∩ A_1)}{P(A_1)} = \frac{\frac{4885}{1000000}}{\frac{78515}{1000000}} = \frac{4885}{78515} ≈ 6.2217\%``

**(e).** Part (c) says the probability of a person testing positive given that they do not have the HIV virus is 7.4%.
Part (d) says the probability of a person having HIV given that they tested positive is 6.2217%.
"""

# ╔═╡ 267b44bf-e517-4c4f-9abb-62b945a66a14
md"""
### Problem 1.3-3

**(a).**

$P(A_1 ∩ B_1) = \frac{5}{35} = \frac{1}{7} ≈ 14.2857\%$

**(b).**

$P(A_1 ∪ B_1) = P(A_1) + P(B_1) - P(A_1 ∩ B_1) = \frac{12 + 19 - 5}{35} = \frac{26}{35} ≈ 74.2857\%$

**(c).**

$P(A_1 ∣ B_1) = \frac{P(A_1 ∩ B_1)}{P(B_1)} = \frac{\frac{5}{35}}{\frac{19}{35}} = \frac{5}{19} ≈ 26.3158\%$

**(d).**

$P(B_2 ∣ A_2) = \frac{P(B_2 ∩ A_2)}{P(A_2)} = \frac{\frac{9}{35}}{\frac{23}{35}} = \frac{9}{23} = 39.1304\%$

**(e).**

$P(A_2 ∣ B_1) = \frac{P(A_2 ∩ B_1)}{P(B_1)} = \frac{\frac{14}{35}}{\frac{19}{35}} = \frac{14}{19} = 73.6842\%$

$P(A_2 ∣ B_2) = \frac{P(A_2 ∩ B_2)}{P(B_2)} = \frac{\frac{9}{35}}{\frac{16}{35}} = \frac{9}{16} = 56.25\%$

I would choose a "left thumb on top" student since the probability of a student being right-eye dominant given that they are "left thumb on top" is greater than the probability of them being right-eye dominant given that they are "right thumb on top".
"""

# ╔═╡ 8fed1b9a-e007-4b54-b339-2a7f0510f084
md"""
### Problem 1.3-5

**(a).**
The sample space of the alleles for eye color for offspring is

$\{RR, RW, WR, WW\}$

**(b).**
Find ``P(RR ∣ \text{red eyes})`` given that red eyes appear with either ``RR``, ``RW``, or ``WR``.

$P(\text{red eyes}) = \frac{3}{4}$

$P(RR ∣ \text{red eyes}) = \frac{P(RR ∩ \text{red eyes})}{P(\text{red eyes})} = \frac{1/4}{3/4} = \frac{1}{3}$
"""

# ╔═╡ e080c37e-f40f-4eae-bb41-e69448726d4a
md"""
### Problem 1.3-7

$P(\text{both orange}) = \frac{\begin{pmatrix} 2 \\ 2 \end{pmatrix}}{\begin{pmatrix} 4 \\ 2 \end{pmatrix}} = \frac{1}{6}$

$P(\text{at least 1 orange}) = 1 - P(\text{both blue}) = 1 - \frac{1}{6} = \frac{5}{6}$

$P(\text{both orange} ∣ \text{at least 1 orange}) = \frac{P(\text{both orange})}{P(\text{at least 1 orange})} = \frac{\frac{1}{6}}{\frac{5}{6}} = \frac{1}{5}$
"""

# ╔═╡ c488f3c3-54da-4391-a0fb-4f6b113837f3
md"""
### Problem 1.3-9

**(a).**
If you choose the ball at the ``i``th draw, there are ``3!`` ways to choose the rest of the balls out of a total of ``4!`` ways to choose each ball, hence ``\displaystyle P(A_i) = \frac{3!}{4!}`` for each ``i``.

**(b).**
If you choose two balls at the ``i``th and ``j``th draws, there are ``2!`` ways to choose the rest of the balls out of a total of ``4!`` ways to choose each ball, hence ``\displaystyle P(A_i ∩ A_j) = \frac{2!}{4!}`` for ``i ≠ j``.

**(c).**
If you choose balls at the ``i``th, ``j``th, and ``k``th draws, there are ``1!`` ways to choose the remaining ball out of the total of ``4!`` ways to choose each ball, hence ``\displaystyle P(A_i ∩ A_j ∩ A_k) = \frac{1!}{4!}`` for ``i ≠ j``, ``i ≠ k``, and ``j ≠ k``.

**(d).** Apply the inclusion-exclusion principle.

$\begin{align*}
&P(\text{at least one match}) \\
&= P(A_1 ∪ A_2 ∪ A_3 ∪ A_4) \\
&= \sum_{k = 1}^4 (-1)^{k - 1} \sum_{i_1 ≤ i_2 < i_k ≤ 4} P(A_{i_1} ∩ A_{i_2} ∩ ⋯ ∩ A_{i_k}) \\
&= P(A_1) + P(A_2) + P(A_3) + P(A_4) \\
&\quad - \left[P(A_1 ∩ A_2) + P(A_1 ∩ A_3) + P(A_2 ∩ A_3) + P(A_2 ∩ A_4) + P(A_3 ∩ A_4)\right] \\
&\quad + \left[P(A_1 ∩ A_2 ∩ A_3) + ⋯\right] \\
&\quad - P(A_1 ∩ A_2 ∩ A_3 ∩ A_4) \\
&= \begin{pmatrix} 4 \\ 1 \end{pmatrix} \frac{3!}{4!} - \begin{pmatrix} 4 \\ 2 \end{pmatrix} \frac{2!}{4!} + \begin{pmatrix} 4 \\ 3 \end{pmatrix} \frac{1!}{4!} - \begin{pmatrix} 4 \\ 4 \end{pmatrix} \frac{1}{4!} \\
&= \frac{4!}{3! 1!} \frac{3!}{4!} - \frac{4!}{2! 2!} \frac{2!}{4!} + \frac{4!}{3! 1!} \frac{1}{4!} - \frac{4!}{4! 0!} \frac{1}{4!} \\
&= 1 - \frac{1}{2!} + \frac{1}{3!} - \frac{1}{4!}
\end{align*}$

**(e).**

$\begin{align*}
P(A_1 ∪ A_2 ∪ ⋯ ∪ A_n) &= \sum_{k = 1}^n (-1)^k \sum_{i ≤ i_2 < ⋯ < i_k ≤ n} P(A_{i_1} ∩ ⋯ ∩ A_{i_k}) \\
&= \sum_{k = 1}^n (-1)^{k - 1} \begin{pmatrix} n \\ k \end{pmatrix} \frac{(n - k)!}{n!} \\
&= \sum_{k = 1}^n (-1)^{k - 1} \frac{n!}{(n - k)! k!} \frac{(n - k)!}{n!} \\
&= \sum_{k = 1}^n (-1)^{k - 1} \frac{1}{k!} \\
&= \frac{1}{1!} - \frac{1}{2!} + \frac{1}{3!} + ⋯ + (-1)^{n - 1} \frac{1}{n!}
\end{align*}$

**(f).**
Note that ``\displaystyle e^x = \sum_{k = 0}^∞ \frac{x^k}{k!}``.
We analogize part (d) to this equation to find an expression for the limit of this probability in terms of ``e``.
Notice that from part (d),

$\begin{align*}
P(A_1 ∪ A_2 ∪ ⋯ ∪ A_n) &= \sum_{k = 1}^n \frac{(-1)^{k - 1}}{k!} \\
&= -\sum_{k = 1}^n \frac{(-1)^k}{k!} \\
&= -\left[\sum_{k = 0}^n \frac{(-1)^k}{k!} - \frac{(-1)^0}{0!}\right] \\
&= -\left[e^{-1} - 1\right] \\
&= 1 - e^{-1}
\end{align*}$

Hence the probability ``P(A_1 ∪ A_2 ∪ ⋯ ∪ A_n)`` as ``n`` increases without bound is equal to ``1 - e^{-1}``.
"""

# ╔═╡ b25b30fa-7b27-4c86-9de9-0226750b6e05
md"""
### Problem 1.3-11

**(a).**
There are ``(365)^r`` different ordered samples of birthdays possible, allowing repetitions.

**(b).**
There are ``\displaystyle _{365}P_r = \frac{365!}{(365 - r)!}`` different ordered samples of birthdays possible, not allowing repetitions.

**(c).**
The probability that at least two students have the same birthday is given by

$P(\text{at least 2 have the same birthday})$

$\begin{align*}
&= 1 - P(\text{all different birthdays}) \\
&= 1 - \frac{_nP_r}{n^r} \\
&= 1 - \frac{\frac{365!}{(365 - r)!}}{(365)^r} \\
&= 1 - \frac{365!}{(365 - r)! (365)^r}
\end{align*}$

**(d).**
Let the probability from part (c) equal to 1/2 and solve for ``r``.

$\begin{align*}
\frac{1}{2} &= 1 - \frac{365!}{(365 - r)! (365)^r}
\end{align*}$

To make this problem easier, let us solve for ``r`` using the complement of the probability instead,

$\begin{align*}
\frac{1}{2} &= \frac{365!}{(365 - r)! (365)^r} \\
\frac{1}{2} &= \frac{(365) ⋯ (365 - r + 1)}{(365)^r} \\
\frac{1}{2} &= \frac{365}{365} ⋅ \frac{(365 - 1)}{365} ⋅ \frac{(365 - 2)}{365} ⋯ \frac{(365 - r + 1)}{365} \\
\frac{1}{2} &= 1 ⋅ \left(1 - \frac{1}{365}\right) ⋅ \left(1 - \frac{2}{365}\right) ⋯ \left(1 - \frac{r - 1}{365}\right) \\
\ln{\left(\frac{1}{2}\right)} &= \ln{\left[1 ⋅ \left(1 - \frac{1}{365}\right) ⋅ \left(1 - \frac{2}{365}\right) ⋯ \left(1 - \frac{r - 1}{365}\right)\right]} \\
\ln{\left(\frac{1}{2}\right)} &= \ln{(1)} + \ln{\left(1 - \frac{1}{365}\right)} + \ln{\left(1 - \frac{2}{365}\right)} + ⋯ + \ln{\left(1 - \frac{r - 1}{365}\right)} \\
\ln{\left(\frac{1}{2}\right)} &= \sum_{k = 0}^{r - 1} \ln{\left(1 - \frac{k}{365}\right)}
\end{align*}$

Use the Taylor Series expansion to approximate the expression ``\displaystyle \ln{\left(1 - \frac{k}{365}\right)}`` where

$\ln{\left(1 - x\right)} = -x - x^2 - x^3 ⋯$

For simplicity, only take the first term in the Taylor Series approximation, that is, make the approximation that

$\ln{\left(1 - x\right)} = -x$

Let ``\displaystyle x = \frac{k}{365}`` such that ``\displaystyle \ln{\left(1 - \frac{k}{365}\right)} = \frac{k}{365}``.
Then

$\begin{align*}
\frac{1}{2} &= \sum_{k = 0}^{r - 1} \frac{k}{365} \\
\frac{1}{2} &= \frac{1}{365} \sum_{k = 0}^{r - 1} k \\
\frac{1}{2} &= \frac{1}{365} ⋅ \frac{r(r - 1)}{2} \\
365 &= r(r - 1) \\
r^2 - r - 365 &= 0
\end{align*}$

$r = \frac{1 ± \sqrt{1 + 4 ⋅ 1 ⋅ 365}}{2} = \frac{1 + \sqrt{1 + 1460}}{2} = 19.6 ≈ 20$

So, for ``r = 20``, the probability that at least two students in a class have the same birthday where the class has ``r`` number of students is ``\frac{1}{2}``.
In other words, there is roughly a ``\frac{1}{2}`` chance that two students share the same birthday in a class of ``20`` students.
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
# ╟─53db699c-77e2-11ec-1d59-77d1e8191d3a
# ╟─0f460e2f-1f0b-4beb-b4e5-b4a47fa3b4c7
# ╟─267b44bf-e517-4c4f-9abb-62b945a66a14
# ╟─8fed1b9a-e007-4b54-b339-2a7f0510f084
# ╟─e080c37e-f40f-4eae-bb41-e69448726d4a
# ╟─c488f3c3-54da-4391-a0fb-4f6b113837f3
# ╟─b25b30fa-7b27-4c86-9de9-0226750b6e05
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
