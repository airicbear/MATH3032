### A Pluto.jl notebook ###
# v0.17.7

using Markdown
using InteractiveUtils

# ╔═╡ 7512f328-77e2-11ec-04af-c71e87f8e92a
md"""
# HW 1.4

Eric Nguyen
"""

# ╔═╡ dfd2d45e-09d2-4124-8c7c-8a2375fc403f
md"""
### Problem 1.4-1

**(a).**

$P(A ∩ B) = P(A) P(B) = (0.7)(0.2) = 0.14$

**(b).**

$\begin{align*}
P(A ∪ B) &= P(A) + P(B) - P(A ∩ B) \\
&= P(A) + P(B) - P(A)P(B) \\
&= 0.7 + 0.2 - (0.7)(0.2) \\
&= 0.9 - 0.14 \\
&= 0.76
\end{align*}$

**(c).**

$\begin{align*}
P(A' ∪ B') &= P(A') + P(B') - P(A' ∩ B') \\
&= P(A') + P(B') - P(A')P(B') \\
&= 0.3 + 0.8 - (0.3)(0.8) \\
&= 1.1 - 0.24 \\
&= 0.86
\end{align*}$
"""

# ╔═╡ d950ff88-788f-498e-adaf-59dcb8cb4a45
md"""
### Problem 1.4-3

**(a).**

$P(A ∩ B) = P(A)P(B) = \left(\frac{1}{4}\right)\left(\frac{2}{3}\right) = \frac{1}{6}$

**(b).**

$P(A ∩ B') = P(A)P(B') = \left(\frac{1}{4}\right)\left(\frac{1}{3}\right) = \frac{1}{12}$

**(c).**

$P(A' ∩ B') = P(A') P(B') = \left(\frac{3}{4}\right)\left(\frac{1}{3}\right) = \frac{1}{4}$

**(d).**

$P[(A ∪ B)'] = P(A' ∩ B') = \frac{1}{4}$

**(e).**

$P(A' ∩ B) = P(A') P(B) = \left(\frac{3}{4}\right)\left(\frac{2}{3}\right) = \frac{1}{2}$
"""

# ╔═╡ c6a73f1e-6b8d-47f1-9f6c-5d6331eb72bd
md"""
### Problem 1.4-5

Assume that ``A`` and ``B`` are independent events.
Then ``P(A ∩ B) = P(A)P(B)`` which implies ``P(A ∪ B) = P(A) + P(B) - P(A)P(B)``.
Evaluating the right-hand side, we get

$P(A) + P(B) - P(A)P(B) = 0.8 + 0.5 - (0.8)(0.5) = 0.9$

Since ``A`` and ``B`` are independent events **if and only if** ``P(A ∩ B) = P(A)P(B)`` then ``A`` and ``B`` must be independent events.
"""

# ╔═╡ 3b20c3c3-6fe3-48fa-b0b6-c8c7b482692f
md"""
### Problem 1.4-7

**(a).**
The probability that exactly one player is successful is

$\begin{align*}
&P(\text{exactly one player is successful}) \\
&= P(A_1 ∩ {A_2}' ∩ {A_3}') + P({A_1}' ∩ A_2 ∩ {A_3}') + P({A_1}' + {A_2}' + A_3) \\
&= P(A_1) P({A_2}') P({A_3}') + P({A_1}') P(A_2) P({A_3}') + P({A_1}') P({A_2}') P(A_3) \\
&= (0.5)(0.3)(0.4) + (0.5)(0.7)(0.4) + (0.5)(0.3)(0.6) \\
&= 0.29
\end{align*}$

**(b).**
The probability that exactly two players are successful is

$\begin{align*}
&P(\text{exactly two players are successful}) \\
&= P(A_1 ∩ A_2 ∩ {A_3}') + P({A_1}' ∩ A_2 ∩ A_3) + P(A_1 + {A_2}' + A_3) \\
&= P(A_1) P(A_2) P({A_3}') + P({A_1}') P(A_2) P(A_3) + P(A_1) P({A_2}') P(A_3) \\
&= (0.5)(0.7)(0.4) + (0.5)(0.7)(0.6) + (0.5)(0.3)(0.6) \\
&= 0.44
\end{align*}$
"""

# ╔═╡ 83fbe8dc-bd01-4f72-9c4f-6e89942bbc59
md"""
### Problem 1.4-9

**(a).**
The probability that all three events occur is

$P(A ∩ B ∩ C) = P(A) P(B) P(C) = (0.5)(0.8)(0.9) = 0.36$

**(b).**
The probability that exactly two of the three events occur is

$\begin{align*}
&= P(A ∩ B ∩ C') + P(A ∩ B' ∩ C) + P(A' ∩ B ∩ C) \\
&= P(A) P(B) P(C') + P(A) P(B') P(C) + P(A') P(B) P(C) \\
&= (0.5)(0.8)(0.1) + (0.5)(0.2)(0.9) + (0.5)(0.8)(0.9) \\
&= 0.49
\end{align*}$

**(c).**
The probability that none of the events occur is

$P(A' ∩ B'∩ C') = P(A') P(B') P(C') = (0.5)(0.2)(0.1) = 0.01$
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
# ╟─7512f328-77e2-11ec-04af-c71e87f8e92a
# ╟─dfd2d45e-09d2-4124-8c7c-8a2375fc403f
# ╟─d950ff88-788f-498e-adaf-59dcb8cb4a45
# ╟─c6a73f1e-6b8d-47f1-9f6c-5d6331eb72bd
# ╟─3b20c3c3-6fe3-48fa-b0b6-c8c7b482692f
# ╟─83fbe8dc-bd01-4f72-9c4f-6e89942bbc59
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
