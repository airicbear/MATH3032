### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ 48a3c75c-b187-11ec-2eba-6d2912e9e10e
md"""
# HW 5.1

Eric Nguyen
"""

# ╔═╡ baf83e9f-6c70-4de4-ae42-e312e8ba08ed
md"""
### Problem 1

$X ∼ \text{Geom}(p) \implies P(X = x) = (1 - p)^{x - 1} p, \qquad x ∈ 1,2,3,…$

**(a).** ``Y = 2X \implies X = \frac{Y}{2}``

$g(y) = (1 - p)^{\frac{y}{2} - 1} p, \qquad y = 2,4,6,…$

**(b).** ``Y = X^2 \implies X = \sqrt{Y}``

$g(y) = (1 - p)^{\sqrt{y}} p, \qquad y = 1,4,9,…$
"""

# ╔═╡ 21a7fd5f-cea6-474a-b421-460dbd567b2c
md"""
### Problem 3

$f(x) = 4x^3, \quad 0 < x < 1$

$G(y) = P(Y ≤ y) = P(X^2 ≤ y) = P(X ≤ \sqrt{y})$

$G(y) = ∫_0^{\sqrt{y}} 4x^3 \,dx = y^2, \qquad 0 < y < 1$

$g(y) = G'(y) = 2y, \qquad 0 < y < 1$
"""

# ╔═╡ 3d4ee80d-d75e-4c5a-b10c-5b5db7d4820d
md"""
### Problem 5

$X ∼ \Gamma(\alpha = 3, \theta = 2)$

$f(x) = \frac{1}{8 \Gamma(3)} x^{2} e^{-x/2}$

$G(y) = P(Y ≤ y) = P(\sqrt{X} ≤ y) = P(X ≤ y^2)$

$G(y) = ∫_0^{y^2} \frac{1}{\Gamma(\alpha) \theta^{\alpha}} x^{\alpha - 1} e^{-x/\theta} \,dx$

$g(y) = G'(y) = \frac{1}{\Gamma(\alpha) \theta^{\alpha}} (y^2)^{\alpha - 1} e^{-y^2 / \theta} (2y)$

$g(y) = \frac{1}{8} y^5 e^{-y^2 / 2}, \qquad 0 < y < ∞$
"""

# ╔═╡ eabf9a31-a3f5-4acd-9fc4-d98fc77531a6
md"""
### Problem 7

$f(x) = \theta x^{\theta - 1}, \qquad 0 < x < 1, \quad 0 < \theta < ∞$

$Y = -2\theta \ln{X} \implies X = e^{-Y / 2\theta} = v(Y)$

$v'(y) = -\frac{1}{2\theta} e^{-Y / 2\theta}$

$g(y) = f[v(y)] |v'(y)| = \theta(e^{-y/2\theta})^{\theta - 1} \left|\frac{1}{2\theta} e^{-y/2\theta}\right| = \frac{1}{2} e^{-y/2}$

$Y ∼ \text{Exp}(\lambda = 1/2)$
"""

# ╔═╡ 75ef2d33-2c17-4fa7-b74a-a70716c0f5e1
md"""
### Problem 9

\$50,000 invested at rate ``R ∼ U(0.03, 0.07)``.

Sum is compounded instantanously for a year, so ``X = 50000 e^R`` dollars at the end of the year.

**(a).**

$G(x) = \frac{1}{0.04} (\ln{x} - \ln{50,000} - 0.03), \qquad 50000e^{0.03} < x < 50000e^{0.07}$

$g(x) = G'(x) = \frac{1}{0.04x}, \qquad 50000e^{0.03} < x < 50000e^{0.07}$

**(b).**

$\lim_{n → ∞} 50000(1 + R/n)^n = 50000e^R$
"""

# ╔═╡ a9ac9b9c-84a7-4c07-aecc-2fe146cce51a
md"""
### Problem 11

$F(x) = 1 - \exp\left[-e^{(x - \theta_1) / \theta_2}\right], \qquad  -∞ < x < ∞.$

If ``\theta_1 = 0``, ``\theta_2 = 1``,

$F(x) = 1 - \exp[-e^X], \qquad -∞ < x < ∞.$

Let ``Y = e^X`` or ``X = \ln{Y}``, where ``0 < y < ∞``.

**(a).**

$G(y) = P(Y ≤ y) = P(X ≤ \ln{y}) = 1 - e^{-y}, \qquad 0 ≤ y < ∞$

**(b).**

$G(y) = 1 - \exp[-e^{(\ln{y} - \theta_1) / \theta_2}], \qquad 0 ≤ y < ∞$

$g(y) = \exp[-e^{(\ln{y} - \theta_1) / \theta_2}][e^{(\ln{y} - \theta_1) / \theta_2}][1 / \theta_2 y], \qquad 0 ≤ y < ∞$

**(c).**

$G(y) = 1- e^{-(y/\beta)^\alpha}, \qquad 0 ≤ y < ∞$

$g(y) = (\alpha y^{\alpha - 1} / \beta^\alpha) e^{(-y/\beta)^\alpha}, \qquad 0 < y < ∞$

**(d).**

$\exp(-e^{-2})$
"""

# ╔═╡ ee4f659e-f602-4698-9825-ada65ca40bab
md"""
### Problem 13

$X ∼ \text{Cauchy}$

**(a).**

$P(X > 1) = \frac{1}{2} - \frac{\arctan{1}}{\pi} = 0.25$

**(b).**

$P(X > 5) = \frac{1}{2} - \frac{\arctan{5}}{\pi} = 0.0628$

**(c).**

$P(X > 10) = \frac{1}{2} - \frac{\arctan{10}}{\pi} = 0.0317$
"""

# ╔═╡ 93fd511b-8008-4f71-ae9b-f91eb80c2e57
md"""
### Problem 15

$X ∼ N(\mu, \sigma^2)$

$M(t) = E(e^{tX}) = \exp(\mu t + \sigma^2 t^2 / 2), \qquad -∞ < t < ∞.$

``Y = e^X`` has **lognormal distribution** since ``X = \ln{Y}``.

**(a).**

$g(y) = P(Y ≤ y) = P(e^X ≤ y) = P(X ≤ \ln{Y})$

$g(y) = \frac{1}{y \sqrt{2 \pi \sigma^2}} \exp[-(\ln{y} - \mu)^2 / 2\sigma^2], \qquad 0 < y < ∞$

**(b).**

$E(Y) = E(e^X) = M(1) = \exp\left(\mu + \frac{\sigma^2}{2}\right)$

$E(Y^2) = E(e^{2X}) = M(2) = \exp(\sigma^2) \exp(2 \mu + \sigma^2)$

$\text{Var}(Y) = [\exp(\sigma^2) - 1] \exp(2 \mu + \sigma^2)$
"""

# ╔═╡ 7dd5b5b3-ddb4-4de7-baf7-d240359e98fc
md"""
### Problem 17

$Y = X^2 \implies X = \sqrt{Y}$

**(a).** ``X ∼ N(0,1)``

$g(y) = \frac{1}{\sqrt{2\pi y}} \exp(-y / 2), \qquad 0 < y < ∞$

**(b).** ``f(x) = (3/2)x^2, \qquad -1 < x < 1``.

$g(y) = \frac{3}{2} \sqrt{y}, \qquad 0 < y < 1.$
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
# ╟─48a3c75c-b187-11ec-2eba-6d2912e9e10e
# ╟─baf83e9f-6c70-4de4-ae42-e312e8ba08ed
# ╟─21a7fd5f-cea6-474a-b421-460dbd567b2c
# ╟─3d4ee80d-d75e-4c5a-b10c-5b5db7d4820d
# ╟─eabf9a31-a3f5-4acd-9fc4-d98fc77531a6
# ╟─75ef2d33-2c17-4fa7-b74a-a70716c0f5e1
# ╟─a9ac9b9c-84a7-4c07-aecc-2fe146cce51a
# ╟─ee4f659e-f602-4698-9825-ada65ca40bab
# ╟─93fd511b-8008-4f71-ae9b-f91eb80c2e57
# ╟─7dd5b5b3-ddb4-4de7-baf7-d240359e98fc
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
