### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ ca76c948-8274-4c13-a90c-f23087c33de8
37/96

# ╔═╡ 3ca80a90-731d-11ec-2230-bd49c8a4d3f7
md"""
# HW 1.1

Eric Nguyen
"""

# ╔═╡ d8514fd2-bb43-4aba-9500-28a69a891053
md"""
### Problem 1.1-1

Let ``A`` be the event that a patient visits a physical therapist.
Let ``B`` be the event that a patient visits a chiropractor.
Then ``P(A ∩ B) = 0.28``, ``P((A ∪ B)') = 0.08 \implies P(A ∪ B) = 0.92``, and ``P(A) = P(B) + 0.16 \implies P(B) = P(A) - 0.16``.
We want to find ``P(A)``, the probability that a patient visits a physical therapist.

Using ``P(A ∪ B) = P(A) + P(B) - P(A ∩ B)`` we can find ``P(A)``.
Solving for ``P(A)``, we get the following:

$\begin{align*}
P(A ∪ B) &= P(A) + P(B) - P(A ∩ B) \\
0.92 &= P(A) + (P(A) - 0.16) - 0.28 \\
0.92 &= 2P(A) - 0.44 \\
1.36 &= 2P(A) \\
P(A) &= 0.68
\end{align*}$

The probability of a randomly selected person from this group visiting a physical therapist is 68%.
"""

# ╔═╡ 5a17d0c2-5b4a-4932-8ffc-c1e2eaca8700
md"""
### Problem 1.1-3

**(a)** ``P(A)`` can be described as the probability of drawing a face card.
There are three types of face cards and four suits for each card, totaling to 12 face cards in a standard deck of 52 cards.
Then

$P(A) = \frac{12}{52} = \frac{3}{13}.$

**(b)** ``P(A ∩ B)`` can be described as the probability of drawing a red jack.
There are two red jacks in a standard deck of 52 cards.
Then

$P(A ∩ B) = \frac{2}{52} = \frac{1}{26}.$

**(c)** ``P(A ∪ B)`` can be described as the probability of drawing a face card, or drawing a red 9 or red 10 (four cards in addition to the 12 face cards), totaling to 16 cards in a standard deck of 52 cards.
Then

$P(A ∪ B) = \frac{16}{52} = \frac{4}{13}.$

**(d)** ``P(C ∪ D)`` can be described as the probability of drawing a card with any suit.
All cards in a standard deck of 52 cards have an associated suit.
Then

$P(C ∪ D) = P(S) = \frac{52}{52} = 1.$

**(e)** ``P(C ∩ D)`` can be described as the probability of drawing a club and drawing a suit other than a club.
All cards in a standard deck of 52 cards only have one associated suit.
Therefore ``C ∩ D = \varnothing`` and

$P(C ∩ D) = P(\varnothing) = 0.$
"""

# ╔═╡ 5fe9dfaf-d10a-49e4-92dd-1e3d8a1dd328
md"""
### Problem 1.1-5

**(a)** ``P(A)`` is the probability of rolling a 3 on a fair six-sided die in one trial, so

$P(A) = \frac{1}{6}.$

**(b)** ``P(B)`` can be described as the probability that we do not roll a 3 on the first trial, i.e.,

$P(B) = 1 - P(A) = 1 - \frac{1}{6} = \frac{5}{6}.$

**(c)** ``P(A ∪ B)`` is the probability of either of the two disjoint events ``A`` or ``B`` occurring.

$P(A ∪ B) = P(A) + P(B) = \frac{1}{6} + \frac{5}{6} = 1.$
"""

# ╔═╡ e717a536-e5cc-43be-a39d-3a4d229e51c0
md"""
### Problem 1.1-7

We are given ``P(A ∪ B) = 0.76`` and ``P(A ∪ B') = 1 - P(B) + P(A ∩ B) = 0.87`` ``\implies P(B) - P(A ∩ B) = 0.13``.

$\begin{align*}
P(A ∪ B) &= P(A) + P(B) - P(A ∩ B) \\
0.76 &= P(A) + 0.13 \\
P(A) &= 0.63
\end{align*}$
"""

# ╔═╡ dffaea5a-dbc5-497e-814b-59c163c4c3b5
md"""
### Problem 1.1-9

**(a)**

$\begin{align*}
P(A_1 ∪ A_2 ∪ A_3) &= P(A_1) + P(A_2) + P(A_3) \\
&\quad - P(A_1 ∩ A_2) - P(A_1 ∩ A_3) - P(A_2 ∩ A_3) + P(A_1 ∩ A_2 ∩ A_3) \\
&= \frac{1}{3} + \frac{1}{3} + \frac{1}{3} - \left(\frac{1}{3}\right)^2 - \left(\frac{1}{3}\right)^2 - \left(\frac{1}{3}\right)^2 + \left(\frac{1}{3}\right)^3 \\
&= 3 \left(\frac{1}{3}\right) - 3 \left(\frac{1}{3^2}\right) + \frac{1}{3^3} \\
&= \frac{1}{3} \left(3 - 1 + \frac{1}{9}\right) \\
&= \frac{1}{3} \left(\frac{27}{9} - \frac{9}{9} + \frac{1}{9}\right) \\
&= \frac{1}{3} \left(\frac{19}{9}\right) \\
&= \frac{19}{27}
\end{align*}$

**(b)**

$\begin{align*}
P(A_1 ∪ A_2 ∪ A_3) &= 1 - P((A_1 ∪ A_2 ∪ A_3)') \\
&= 1 - P({A_1}' ∩ {A_2}' ∩ {A_3}') &\text{By De Morgan's laws} \\
&= 1 - P({A_1}')P({A_2}')P({A_3}') \\
&= 1 - [1 - P(A_1)][1 - P(A_2)][1 - P(A_3)] \\
&= 1 - \left[1 - \frac{1}{3}\right]\left[1 - \frac{1}{3}\right]\left[1 - \frac{1}{3}\right] \\
&= 1 - \left(1 - \frac{1}{3}\right)^3
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
# ╠═ca76c948-8274-4c13-a90c-f23087c33de8
# ╟─3ca80a90-731d-11ec-2230-bd49c8a4d3f7
# ╟─d8514fd2-bb43-4aba-9500-28a69a891053
# ╟─5a17d0c2-5b4a-4932-8ffc-c1e2eaca8700
# ╟─5fe9dfaf-d10a-49e4-92dd-1e3d8a1dd328
# ╟─e717a536-e5cc-43be-a39d-3a4d229e51c0
# ╟─dffaea5a-dbc5-497e-814b-59c163c4c3b5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
