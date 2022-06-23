### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ c025261c-8543-11ec-03ab-b526c6be10f6
md"""
# HW 2.6

Eric Nguyen
"""

# ╔═╡ d53d0c48-738f-4718-96c0-f44299a7e2d7
md"""
### Problem 1

**(a).**

$P(X ≥ 13) = P(X > 12) = (0.9)^{12} = 0.2824$

**(b).**

$p = 0.1$

$r = 3$

$x = 30$

$P(X = 30) = \begin{pmatrix} x - 1 \\ r - 1 \end{pmatrix} p^r (1 - p)^{x - r} = 0.02361$
"""

# ╔═╡ ee34c95e-e40a-4847-9f93-6d68f031c778
md"""
### Problem 3

**(a).**

$\mu = \frac{r}{p} = \frac{10}{0.6}$

$\sigma^2 = \frac{r(1-p)}{p^2} = \frac{4}{0.36}$

$\sigma = \frac{2}{0.6}$

**(b).**

$p = 0.6$

$r = 10$

$x = 16$

$P(X = 16) = \begin{pmatrix} x - 1 \\ r - 1 \end{pmatrix} p^r (1 - p)^{x - r} = 0.1240$
"""

# ╔═╡ 60def9ad-b431-4091-9c85-fc34b36b6ccb
md"""
### Problem 5

**(a).**

$R'(0) = \frac{M'(0)}{M(0)} = M'(0) = E(X) = \mu$

**(b).**

$R''(0) = \frac{M(0) M''(0) - [M'(0)]^2}{[M(0)]^2} = E(X^2) - E(X)^2 = \sigma^2$
"""

# ╔═╡ d137645f-1f49-4d0f-b8c3-0d2b05169955
md"""
### Problem 7

$E(X^r) = 5^r$

$M(t) = e^{5t} \implies f(5) = 1$
"""

# ╔═╡ 0f8c912d-081d-42fb-a2e6-221634abbbf5
md"""
### Problem 9

$r = 1$

$E(X_1) = 1$

$E(X_2) = r/p = 4/3$

$E(X_3) = r/p = 4/2$

$E(X_4) = r/p = 4/1$

$\sum E(X) = \frac{25}{3}$
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
# ╟─c025261c-8543-11ec-03ab-b526c6be10f6
# ╟─d53d0c48-738f-4718-96c0-f44299a7e2d7
# ╟─ee34c95e-e40a-4847-9f93-6d68f031c778
# ╟─60def9ad-b431-4091-9c85-fc34b36b6ccb
# ╟─d137645f-1f49-4d0f-b8c3-0d2b05169955
# ╟─0f8c912d-081d-42fb-a2e6-221634abbbf5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
