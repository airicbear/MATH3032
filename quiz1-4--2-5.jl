### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ 651e4538-90d0-11ec-3510-fd8ac9bc8df4
md"""
# Math 3032 Quiz 1.4-2.5
"""

# ╔═╡ d7891405-4304-4892-abdb-e3a91a298b16
md"""
### Problem 1

Let ``A`` and ``B`` be independent events with ``P(A) = .3`` and ``P(B) = .6``.
Find

(a) ``P(A ∩ B)``

(b) ``P(A ∪ B)``

(c) ``P(A' ∪ B')``

(d) ``P(A ∣ B')``

**Solution (a).**

$P(A ∩ B) = P(A) P(B) = (0.3)(0.6) = 0.18$

**Solution (b).**

$P(A ∪ B) = P(A) + P(B) - P(A ∩ B) = 0.3 + 0.6 - 0.18 = 0.72$

**Solution (c).**

$P(A' ∪ B') = 1 - P(A ∩ B) = 1 - 0.18 = 0.82$

**Solution (d).**

$P(A ∣ B') = P(A) = 0.3$
"""

# ╔═╡ 5b04b032-6ee3-4e54-bd3f-d33bc9a54d3e
md"""
### Problem 2

What is the probability that

(a) the person has the disease?

(b) the person does not have the disease?

**Solution (a).**

$\begin{align*}
P(D ∣ +) &= \frac{P(D) P(+ ∣ D)}{P(D) P(+ ∣ D) + P(D') P(+ ∣ D')} \\
&= \frac{(0.0004)(0.98)}{(0.0004)(0.98) + (0.9996)(0.04)} \\
&= 0.0097
\end{align*}$

**Solution (b).**

$P(D' ∣ +) = 1 - P(D ∣ +) = 1 - 0.0097 = 0.9903$
"""

# ╔═╡ 763201eb-5513-4bff-a549-82fcebb24462
md"""
### Problem 3

``f(0) = .2``, ``f(1) = .5``, ``f(2.2) = .3``

(a) ``E(X)``

(b) ``V(X)``

(c) the mgf of ``X``

**Solution (a).**

$\mu = E[X] = 0 ⋅ (0.2) + 1 ⋅ (0.5) + 2.2 ⋅ (0.3) = 1.16$

$V(X) = E[X^2] - \mu^2 = 0^2 ⋅ (0.2) + 1^2 ⋅ (0.5) + (2.2)^2 ⋅ (0.3) - (1.16)^2$

$M_X(t) = E[e^{tX}] = 0.2 + e^t (0.5) + e^{2.2t} (0.3) = .2 + .5e^t + .3e^{2.2t} \qquad t ∈ ℝ$
"""

# ╔═╡ 87b2bd3c-bdd3-432f-bf12-5e26fc560106
md"""
### Problem 4

30% vax from Company A, rest from B.
4% infeffective from A, 3% ineffective from B.
30 random tests and 3 are inffective.

$P(A ∣ C) = \frac{P(A) P(C ∣ A)}{P(A) P(C ∣ A) + P(B) P(C ∣ B)} = 0.4344$
"""

# ╔═╡ 8c5d357a-1c30-4ba1-8c5b-6cf4a5d78aa0
md"""
### Problem 5

$M(t) = \frac{e^t}{3 - 2e^t}\qquad |t| < .1$

$M(t) = \frac{\frac{1}{3} e^t}{1 - \frac{2}{3} e^t} = \frac{pe^t}{1 - qe^t} \implies p = \frac{1}{3}$

$X ∼ \text{Geom}(1/3)$

$E[X] = \frac{1}{p} = 3$

$\text{Var}[X] = \frac{q}{p^2} = 6$
"""

# ╔═╡ 348a2275-7535-45d9-ae3a-82ef2fb83c78
md"""
### Problem 6
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
# ╟─651e4538-90d0-11ec-3510-fd8ac9bc8df4
# ╟─d7891405-4304-4892-abdb-e3a91a298b16
# ╟─5b04b032-6ee3-4e54-bd3f-d33bc9a54d3e
# ╟─763201eb-5513-4bff-a549-82fcebb24462
# ╟─87b2bd3c-bdd3-432f-bf12-5e26fc560106
# ╟─8c5d357a-1c30-4ba1-8c5b-6cf4a5d78aa0
# ╠═348a2275-7535-45d9-ae3a-82ef2fb83c78
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
