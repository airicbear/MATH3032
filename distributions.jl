### A Pluto.jl notebook ###
# v0.17.4

using Markdown
using InteractiveUtils

# ╔═╡ 099d5b0f-8f49-4e61-b2e7-74c8987fd27a
md"## Discrete Distributions"

# ╔═╡ 60396977-5f67-4bdc-86a8-75b78517b16c
md"""
### Bernoulli
``0 < p < 1``

$\begin{align*}
f(x) &= p^x (1 - p)^{1 - x}, & x = 0, 1 \\
M(t) &= 1 - p + pe^t, & -∞ < t < ∞ \\
\mu &= p \\
\sigma^2 &= p(1 - p)
\end{align*}$
"""

# ╔═╡ a4526ce5-7205-43b1-905a-135143ba56a6
md"""
### Binomial
``b(n,p)``

``n = 1,2,3,...``

``0 < p < 1``

$\begin{align*}
f(x) &= \frac{n!}{x!(n - x)!} p^x (1 - p)^{n - x}, & x = 0, 1, 2, …, n \\
M(t) &= (1 - p + pe^t)^n, & -∞ < t < ∞ \\
\mu &= np \\
\sigma^2 &= np(1 - p)
\end{align*}$
"""

# ╔═╡ 07bf0190-19e2-41a7-8204-49a7c890667b
md"""
### Geometric
``0 < p < 1``

$\begin{align*}
f(x) &= (1 - p)^{x - 1} p, & x = 1, 2, 3, … \\
M(t) &= \frac{pe^t}{1 - (1 - p)e^t}, & t < -\ln(1 - p) \\
\mu &= \frac{1}{p}, \\
\sigma^2 &= \frac{1 - p}{p^2}
\end{align*}$
"""

# ╔═╡ 40c01d61-e744-4381-8912-b3a85a26053c
md"""
### Hypergeometric
``N_1 > 0, \; N_2 > 0``

``N = N_1 + N_2``

``1 ≤ n ≤ N_1 + N_2``

$\begin{align*}
f(x) &= \frac{\begin{pmatrix} N_1 \\ x \end{pmatrix} \begin{pmatrix}\ N_2 \\ n - x \end{pmatrix}}{\begin{pmatrix} N \\ n \end{pmatrix}}, & x ≤ n, \; x ≤ N_1, \; n - x ≤ N_2 \\
\mu &= n \left(\frac{N_1}{N}\right) \\
\sigma^2 &= n \left(\frac{N_1}{N}\right)\left(\frac{N_2}{N}\right)\left(\frac{N - n}{N - 1}\right)
\end{align*}$
"""

# ╔═╡ c6df5f0d-8d3b-4164-b343-f34fa29849f8
md"""
### Negative Binomial
``0 < p < 1``

``r = 1,2,3,…``

$\begin{align*}
f(x) &= \begin{pmatrix} x - 1 \\ r - 1 \end{pmatrix} p^r (1 - p)^{x - r}, & x = r, r + 1, r + 2, … \\
M(t) &= \frac{(pe^t)^r}{[1 - (1 - p)e^t]^r}, & t < -\ln(1 - p) \\
\mu &= r \left(\frac{1}{p}\right) \\
\sigma^2 &= \frac{r(1 - p)}{p^2}
\end{align*}$
"""

# ╔═╡ 973da4ad-2522-4198-b5e4-f673dab115bb
md"""
### Poisson
``\lambda > 0``

$\begin{align*}
f(x) &= \frac{\lambda^x e^{-\lambda}}{x!}, & x = 0, 1, 2, … \\
M(t) &= e^{\lambda(e^t - 1)}, & -∞ < t < ∞ \\
\mu &= \lambda \\
\sigma^2 &= \lambda
\end{align*}$
"""

# ╔═╡ 564909c5-527d-4c03-a9a8-4dfd62566b55
md"""
### Uniform
``m = 1,2,3,…``

$\begin{align*}
f(x) &= \frac{1}{m}, & x = 1, 2, …, m \\
\mu &= \frac{m + 1}{2} \\
\sigma^2 &= \frac{m^2 - 1}{12}
\end{align*}$
"""

# ╔═╡ e39c7286-eac7-43bd-8ac0-107a5334e949
md"## Continuous Distributions"

# ╔═╡ 9da944c6-a742-4c2e-b73a-f82cdef2a94d
md"""
### Beta
``\alpha > 0``

``\beta > 0``

$\begin{align*}
f(x) &= \frac{Γ(\alpha + \beta)}{Γ(\alpha) Γ(\beta)} x^{\alpha - 1} (1 - x)^{\beta - 1}, & 0 < x < 1 \\
\mu &= \frac{\alpha}{\alpha + \beta} \\
\sigma^2 &= \frac{\alpha \beta}{(\alpha + \beta + 1)(\alpha + \beta)^2}
\end{align*}$
"""

# ╔═╡ c0c71412-068b-4403-9357-5a3ac37b7438
md"""
### Chi-square
``\chi^2(r)``

``r = 1,2,…``

$\begin{align*}
f(x) &= \frac{1}{Γ(r/2) 2^{r/2}} x^{r/2 - 1} e^{-x/2}, & 0 < x < ∞ \\
M(t) &= \frac{1}{(1 - 2t)^{r/2}}, & t < \frac{1}{2} \\
\mu &= r \\
\sigma^2 &= 2r
\end{align*}$
"""

# ╔═╡ 64e29f69-3274-4fb3-bfd7-fb5fb72d86e4
md"""
### Exponential
``\theta > 0``

$\begin{align*}
f(x) &= \frac{1}{\theta} e^{-x/\theta}, & 0 < x < ∞ \\
M(t) &= \frac{1}{1 - \theta t}, & t < \frac{1}{\theta} \\
\mu &= \theta \\
\sigma^2 &= \theta^2
\end{align*}$
"""

# ╔═╡ 4e34808e-e199-466a-997b-f3ccb5a5a12b
md"""
### Gamma
``\alpha > 0``

``\theta > 0``

$\begin{align*}
f(x) &= \frac{1}{Γ(\alpha) \theta^{\alpha}} x^{\alpha - 1} e^{-x/\theta}, & 0 < x < ∞ \\
M(t) &= \frac{1}{(1 - \theta t)^{\alpha}}, & t < \frac{1}{\theta} \\
\mu &= \alpha \theta \\
\sigma^2 &= \alpha \theta^2
\end{align*}$
"""

# ╔═╡ 2bb8e25e-03f5-4a03-91f8-62160ba051d0
md"""
### Normal
``N(\mu, \sigma^2)``

``-∞ < \mu < ∞``

``\sigma > 0``

$\begin{align*}
f(x) &= \frac{1}{\sigma \sqrt{2\pi}} e^{-(x - \mu)^2 / 2\sigma^2}, & -∞ < x < ∞ \\
M(t) &= e^{\mu t + \sigma^2 t^2 / 2}, & -∞ < t < ∞ \\
E(X) &= \mu \\
\text{Var}(X) &= \sigma^2
\end{align*}$
"""

# ╔═╡ 4ecaa76a-081b-45ee-8715-24547d123fef
md"""
### Uniform
``U(a,b)``

``-∞ < a < b < ∞``

$\begin{align*}
f(x) &= \frac{1}{b - a}, & a ≤ x ≤ b \\
M(t) &= \frac{e^{tb} - e^{ta}}{t(b - a)}, & t ≠ 0; \qquad M(0) = 1 \\
\mu &= \frac{a + b}{2} \\
\sigma^2 &= \frac{(b - a)^2}{12}
\end{align*}$
"""

# ╔═╡ Cell order:
# ╟─099d5b0f-8f49-4e61-b2e7-74c8987fd27a
# ╟─60396977-5f67-4bdc-86a8-75b78517b16c
# ╟─a4526ce5-7205-43b1-905a-135143ba56a6
# ╟─07bf0190-19e2-41a7-8204-49a7c890667b
# ╟─40c01d61-e744-4381-8912-b3a85a26053c
# ╟─c6df5f0d-8d3b-4164-b343-f34fa29849f8
# ╟─973da4ad-2522-4198-b5e4-f673dab115bb
# ╟─564909c5-527d-4c03-a9a8-4dfd62566b55
# ╟─e39c7286-eac7-43bd-8ac0-107a5334e949
# ╟─9da944c6-a742-4c2e-b73a-f82cdef2a94d
# ╟─c0c71412-068b-4403-9357-5a3ac37b7438
# ╟─64e29f69-3274-4fb3-bfd7-fb5fb72d86e4
# ╟─4e34808e-e199-466a-997b-f3ccb5a5a12b
# ╟─2bb8e25e-03f5-4a03-91f8-62160ba051d0
# ╟─4ecaa76a-081b-45ee-8715-24547d123fef
