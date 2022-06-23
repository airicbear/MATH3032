### A Pluto.jl notebook ###
# v0.17.7

using Markdown
using InteractiveUtils

# ╔═╡ 92dc6c0d-9638-44c3-a85a-87abbf0eb0dc
md"""
# HW 1.5

Eric Nguyen
"""

# ╔═╡ 2c51a298-a42b-483a-aa4a-0e6cea22e251
md"""
### Problem 1

**(a).**
The probability of drawing a white chip is

$\begin{align*}
P(W) &= P(B_1) P(W ∣ B_1) + P(B_2) P(W ∣ B_2) + P(B_3) P(W ∣ B_3) + P(B_4) P(W ∣ B_4) \\
&= \frac{1}{2} ⋅ 1 + \frac{1}{4} ⋅ 0 + \frac{1}{8} ⋅ \frac{1}{2} + \frac{1}{8} ⋅ \frac{3}{4} \\
&= \frac{21}{32}
\end{align*}$

**(b).**
The probability that bowl ``B_1`` had been selected given that a white chip was drawn is

$P(B_1 ∣ W) = \frac{P(B_1 ∩ W)}{P(W)} = \frac{1}{2} ⋅ \frac{32}{21} = \frac{16}{21}$
"""

# ╔═╡ 1e9b4ffe-83b7-430c-8562-c8827bac4af8
md"""
### Problem 3

Let ``B_1, B_2, B_3`` represent low, normal, and high blood pressure, respectively.
Let ``R`` represent having a regular heartbeat and ``I`` represent having an irregular heartbeat.
Then ``P(B_3) = 0.16``, ``P(B_1) = 0.19``, ``P(I) = 0.17``, ``P(B_3 ∣ I) = 0.35``, and ``P(I ∣ B_2) = 0.11``.
From these probabilities we find ``P(B_2) = 0.65``, ``P(R) = 0.83``, and ``P(R ∣ B_2) = 0.89``.

Find ``P(R ∩ B_1)`` where

$P(B_1) = P(R ∩ B_1) + P(I ∩ B_1) \implies P(R ∩ B_1) = P(B_1) - P(I ∩ B_1)$

Find ``P(I ∩ B_1)`` using the definition of ``P(I)``.

$P(I) = P(I ∩ B_1) + P(I ∩ B_2) + P(I ∩ B_3)$

$\implies P(I ∩ B_1) = P(I) - P(I ∩ B_2) - P(I ∩ B_3)$

Find ``P(I ∩ B_2)`` and ``P(I ∩ B_3)`` using Bayes' theorem.

$P(B_3 ∣ I) = \frac{P(B_3 ∩ I)}{P(I)} \implies P(I ∩ B_3) = P(I) P(B_3 ∣ I)$

$P(I ∣ B_2) = \frac{P(I ∩ B_2)}{P(B_2)} \implies P(I ∩ B_2) = P(B_2) P(I ∣ B_2)$

So

$P(I ∩ B_1) = P(I) - P(I) P(B_3 ∣ I) - P(B_2) P(I ∣ B_2)$

and

$\begin{align*}
P(R ∩ B_1) &= P(B_1) - P(I) + P(I) P(B_3 ∣ I) + P(B_2) P(I ∣ B_2) \\
&= (0.19) - (0.17) + (0.17)(0.35) + (0.65)(0.11) \\
&= 15.1\%
\end{align*}$
"""

# ╔═╡ 1c26e351-862c-43f7-8ae4-cd5e32f65b2a
md"""
### Problem 5

Let ``C_1, C_2, C_3`` represent stable, serious, and critical condition, respectively.
Let ``A`` represent alive and ``D`` represent deceased.
Then ``P(C_1) = 0.5``, ``P(C_2) = 0.3``, ``P(C_3) = 0.2``, ``P(D ∣ C_3) = 0.3``, ``P(A ∣ C_3) = 0.7``, ``P(D ∣ C_2) = 0.1``, ``P(A ∣ C_2) = 0.9``, ``P(D ∣ C_1) = 0.01``, and ``P(A ∣ C_1) = 0.99``.

Find ``P(C_3 ∣ D)``.
Using Bayes' theorem,

$\begin{align*}
P(C_3 ∣ D) &= \frac{P(C_3 ∩ D)}{P(D)} \\
&= \frac{P(C_3) P(D ∣ C_3)}{P(C_1) P(D ∣ C_1) + P(C_2) P(D ∣ C_2) + P(C_3) P(D ∣ C_3)} \\
&= \frac{(0.2)(0.3)}{(0.5)(0.01) + (0.3)(0.1) + (0.2)(0.3)} \\
&= 63.2\%
\end{align*}$
"""

# ╔═╡ 56755536-b4b8-402b-bb9a-642e4ea82749
md"""
### Problem 7

Let ``T^{±}`` represent the detection of an impurity and ``C^{±}`` represent the existence of an impurity such that ``P(T^+) = 0.9``, ``P(T^+ ∣ C^-) = 0.05``, ``P(C^+) = 0.2``, and ``P(C^-) = 0.8``.

Find ``P(C^+ ∣ T^+)``. Using Bayes' theorem,

$P(C^+ ∣ T^+) = \frac{P(T^+ ∩ C^+)}{P(T^+)}$

$\begin{align*}
P(T^+) &= P(T^+ ∩ C^+) + P(T^+ ∩ C^-) \\
P(T^+ ∩ C^+) &= P(T^+) - P(T^+ ∩ C^-) \\
&= P(T^+) - P(T^+ ∣ C^-) P(C^-)
\end{align*}$

$\implies P(C^+ ∣ T^+) = \frac{P(T^+) - P(T^+ ∣ C^-) P(C^-)}{P(T^+)} = 0.99$
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
# ╟─92dc6c0d-9638-44c3-a85a-87abbf0eb0dc
# ╟─2c51a298-a42b-483a-aa4a-0e6cea22e251
# ╟─1e9b4ffe-83b7-430c-8562-c8827bac4af8
# ╟─1c26e351-862c-43f7-8ae4-cd5e32f65b2a
# ╟─56755536-b4b8-402b-bb9a-642e4ea82749
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
