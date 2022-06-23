### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ c18c0cd6-b1b1-11ec-160d-4d5f215088ce
md"""
# HW 5.2

Eric Nguyen
"""

# ╔═╡ 3ecd0b7c-a99f-40e4-b997-17880ffc325a
md"""
### Problem 1

$X_1,X_2 ∼ \chi^2(2)$

$Y_1 = X_2$

$Y_2 = X_2 + X_1$

$S_Y = 0 < y_1 < y_2 < \infty$

Joint:

$g(y_1, y_2) = \frac{1}{4} e^{-y_2 / 2}, \qquad 0 < y_1 < y_2 < ∞$

Marginal:

$g_1(y_1) = \frac{1}{2} e^{-y_1 / 2}, \qquad 0 < y_1 < ∞$

$g_2(y_2) = \frac{y_2}{4} e^{-y_2 / 2}, \qquad 0 < y_2 < ∞$
"""

# ╔═╡ b002094e-d6cd-4b30-92eb-7b54c565ccaf
md"""
### Problem 3

$F(r_1, r_2)$

$W = \frac{U/r_1}{V/r_2}$

$\mu = \frac{r_2}{r_2 - 2}, \qquad r_2 > 2$

$\sigma^2 = \frac{2r_2^2 (r_1 + r_2 - 2)}{r_1 (r_2 - 2)^2 (r_2 - 4)}, \qquad r_2 > 4$
"""

# ╔═╡ a41f1352-756c-467c-8baa-5be7a528be7e
md"""
### Problem 5

$W ∼ F(8,4)$

**(a).**

$F_{0.01}(8,4) = \frac{1}{F_{0.99}(4,8)} = 14.80$

**(b).**

$F_{0.99}(8,4) = \frac{1}{F_{0.01}(4,8)} = 0.1427$

**(c).**

$P(0.198 ≤ W ≤ 8.98) = 0.95$
"""

# ╔═╡ def6908a-e16e-4203-a465-5fb176b0dd55
md"""
### Problem 7

$X_1, X_2 ∼ \chi^2$

**(a).**

$U = \frac{X_1}{X_1 + X_2}$

$U ∼ \text{Beta}(\alpha = r_1 / 2, \beta = r_2 / 2)$

**(b).**

$V = \frac{X_2}{X_1 + X_2}$

$V ∼ \text{Beta}(\alpha = r_2 / 2, \beta = r_1 / 2)$
"""

# ╔═╡ 732cf971-5559-4298-b06f-f60562d9aef6
md"""
### Problem 9

$f(x) = cx^3 (1 - x)^6, \qquad 0 < x < 1$

$c = 840$
"""

# ╔═╡ 80eb569e-3f5c-402f-bb6a-02b06a513579
md"""
### Problem 11

$∫_0^{0.4} \frac{\Gamma(7)}{\Gamma(4) \Gamma(3)} y^3 (1 - y)^2 \,dy = 0.1792$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0-beta1"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─c18c0cd6-b1b1-11ec-160d-4d5f215088ce
# ╟─3ecd0b7c-a99f-40e4-b997-17880ffc325a
# ╟─b002094e-d6cd-4b30-92eb-7b54c565ccaf
# ╟─a41f1352-756c-467c-8baa-5be7a528be7e
# ╟─def6908a-e16e-4203-a465-5fb176b0dd55
# ╟─732cf971-5559-4298-b06f-f60562d9aef6
# ╟─80eb569e-3f5c-402f-bb6a-02b06a513579
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
