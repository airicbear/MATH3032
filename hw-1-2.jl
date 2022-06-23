### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 05ddf2b4-77e2-11ec-030f-9701eb0f5432
md"""
# HW 1.2

Eric Nguyen
"""

# ╔═╡ 42594299-8a9a-4019-8382-bbe00747b8e3
md"""
### Problem 1.2-1

There are ``10^3 = 1000`` different lock combinations possible with a three-digit combination lock.
"""

# ╔═╡ 75d0f2e3-48c8-4be6-9e94-6bd8dd60888d
md"""
### Problem 1.2-3

Assume that there are 26 different letters possible using the English alphabet.

**(a).** There are ``26^2 × 10^4 = 6\;760\;000`` different license plates possible if a state uses two letters followed by a four-digit integer.

**(b).** There are ``26^3 × 10^3 = 17\;576\;000`` different license plates possible if a state uses three letters followed by a three-digit integer.
"""

# ╔═╡ 2dec759e-2e83-45f1-aa90-708263a8d6cc
md"""
### Problem 1.2-5

**(a).** There are ``4! = 24`` possible four-letter code words using the letters in IOWA if the letters may not be repeated.


**(b).** There are ``4^4 = 256`` possible four-letter code words using the letters in IOWA if the letters may be repeated.
"""

# ╔═╡ d7c10ea9-0f1e-465b-823a-88fead2adaba
md"""
### Problem 1.2-7

Note that ``10^4 = 10000``.

**(a).** The probability of winning by selecting 6, 7, 8, 9 is

$\frac{4!}{10000} = \frac{3}{1250}$

**(b).** The probability of winning by selecting 6, 7, 8, 8 is

$\frac{\frac{4!}{2!}}{10000} = \frac{3}{2500}$

**(c).** The probability of winning by selecting 7, 7, 8, 8 is

$\frac{\frac{4!}{2!2!}}{10000} = \frac{3}{5000}$

**(d).** The probability of winning by selecting 7, 8, 8, 8 is

$\frac{\frac{4!}{3!}}{10000} = \frac{1}{2500}$
"""

# ╔═╡ a6600390-612e-40be-83bc-1644540463f2
md"""
### Problem 1.2-10

$\begin{align*}
\begin{pmatrix} n - 1 \\ r \end{pmatrix} + \begin{pmatrix} n - 1 \\ r - 1 \end{pmatrix} &= \frac{(n - 1)!}{(n - 1 - r)! r!} + \frac{(n - 1)!}{(n - 1 - (r - 1))! (r - 1)!} \\
&= (n - 1)! \left[\frac{1}{(n - 1 - r)! r!} + \frac{1}{(n - 1 - r + 1)! (r - 1)!}\right] \\
&= (n - 1)! \left[\frac{1}{(n - 1 - r)! r!} + \frac{1}{(n - r)! (r - 1)!}\right] \\
&= (n - 1)! \left[\frac{n - r}{(n - r)! r!} + \frac{r}{(n - r)! r!}\right] \\
&= (n - 1)! \left[\frac{n}{(n - r)! r!}\right] \\
&= \frac{n!}{(n - r)! r!} \\
&= \begin{pmatrix} n \\ r \end{pmatrix}
\end{align*}$
"""

# ╔═╡ 8eb35425-85f9-4aa5-83cd-8fc5294113b0
md"""
### Problem 1.2-12

First proof.
Consider ``(1 - 1)^n = 0^n = 0``.
Using binomial expansion,

$(1 - 1)^n = \sum_{r = 0}^n \begin{pmatrix} n \\ r \end{pmatrix} (-1)^r 1^{n - r} = \sum_{r = 0}^n (-1)^r \begin{pmatrix} n \\ r \end{pmatrix}$

Since ``\displaystyle \sum_{r = 0}^n (-1)^r \begin{pmatrix} n \\ r \end{pmatrix} = (1 - 1)^n`` and ``(1 - 1)^n = 0``, it is proven that ``\displaystyle \sum_{r = 0}^n (-1)^r \begin{pmatrix} n \\ r \end{pmatrix} = 0``.

Second proof.
Consider ``(1 + 1)^n = 2^n``. Using binomial expansion,

$(1 + 1)^n = \sum_{r = 0}^n \begin{pmatrix} n \\ r \end{pmatrix} 1^r 1^{n - r} = \sum_{r = 0}^n \begin{pmatrix} n \\ r \end{pmatrix}$

Since ``\displaystyle \sum_{r = 0} \begin{pmatrix} n \\ r \end{pmatrix} = (1 + 1)^n`` and ``(1 + 1)^n = 2^n``, it is proven that ``\displaystyle \sum_{r = 0} \begin{pmatrix} n \\ r \end{pmatrix} = 2^n``.
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
# ╟─05ddf2b4-77e2-11ec-030f-9701eb0f5432
# ╟─42594299-8a9a-4019-8382-bbe00747b8e3
# ╟─75d0f2e3-48c8-4be6-9e94-6bd8dd60888d
# ╟─2dec759e-2e83-45f1-aa90-708263a8d6cc
# ╟─d7c10ea9-0f1e-465b-823a-88fead2adaba
# ╟─a6600390-612e-40be-83bc-1644540463f2
# ╟─8eb35425-85f9-4aa5-83cd-8fc5294113b0
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
