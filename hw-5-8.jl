### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ a5bfd774-c379-11ec-0652-1f648016a941
md"""
# HW 5.8

Eric Nguyen
"""

# ╔═╡ 19d9021a-d6f0-4b19-8d97-752e4de64570
md"""
### Problem 1

If ``X`` is a random variable with mean ``33`` and variance ``16``, use Chebyshev's inequality to find

(a) A lower bound for ``P(23 < X < 43)``.

(b) An upper bound for ``P(|X - 33| ≥ 14)``.
"""

# ╔═╡ 055604e5-015f-4a8a-80c9-48e74833fedf
p1_solution = let
	μ = 33
	σ² = 16
	σ = sqrt(σ²)
	k = 2.5
	ϵ1 = k*σ
	ϵ2 = 14

	:a => 1 - 1 / k^2,
	:b => σ² / ϵ2^2
end

# ╔═╡ 135be4f0-374a-4f13-8960-7a1dc4e4484c
md"""
### Problem 3

Let ``X`` denote the outcome when a fair die is rolled.
Then ``\mu = 7/2`` and ``\sigma^2 = 35/12``.
Note that the maximum deviation of ``X`` from ``\mu`` equals ``5/2``.
Express this deviation in terms of the number of standard deviations; that is, find ``k``, where ``k\sigma = 5/2``.
Determine a lower bound for ``P(|X - 3.5| < 2.5)``.
"""

# ╔═╡ 1553517d-76f6-4915-b63f-9cc0bf2e3955
p3_solution = let
	μ = 7//2
	σ² = 35//12
	σ = sqrt(σ²)
	ϵ = 5//2
	k = ϵ / σ

	:k => k, 1 - σ² // ϵ^2
end

# ╔═╡ f413d6c1-0238-48b8-8bfa-e2dccf32aaae
md"""
### Problem 5

If the distribution of ``Y`` is ``b(n,0.25)``, give a lower bound for ``P(|Y/n - 0.25| < 0.05)`` when

(a) ``n = 100``

(b) ``n = 500``

(c) ``n = 1000``
"""

# ╔═╡ 1a231540-5535-4418-9b47-790bf03c4487
p5_solution = let
	n1 = 100
	n2 = 500
	n3 = 1000
	p = 0.25
	q = 1 - p
	ϵ = 0.05

	:a => 1 - (p*q/n1) / ϵ^2,
	:b => 1 - (p*q/n2) / ϵ^2,
	:c => 1 - (p*q/n3) / ϵ^2
end

# ╔═╡ cbbb2025-7e52-4f94-abce-be6447311626
md"""
### Problem 6

Let ``\overline{X}`` be the mean of a random sample of size ``n = 15`` from a distribution with mean ``\mu = 80`` and variance ``\sigma^2 = 60``.
Use Chebyshev's inequality to find a lower bound for ``P(75 < \overline{X} < 85)``.
"""

# ╔═╡ ef05fce8-6175-4ee8-aa55-1580f73ce96c
p6_solution = let
	n = 15
	μ = 80
	σ² = 60
	σ = sqrt(σ²)
	ϵ = 10

	1 - (σ²/n) / ϵ^2
end

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
# ╟─a5bfd774-c379-11ec-0652-1f648016a941
# ╟─19d9021a-d6f0-4b19-8d97-752e4de64570
# ╠═055604e5-015f-4a8a-80c9-48e74833fedf
# ╟─135be4f0-374a-4f13-8960-7a1dc4e4484c
# ╠═1553517d-76f6-4915-b63f-9cc0bf2e3955
# ╟─f413d6c1-0238-48b8-8bfa-e2dccf32aaae
# ╠═1a231540-5535-4418-9b47-790bf03c4487
# ╟─cbbb2025-7e52-4f94-abce-be6447311626
# ╠═ef05fce8-6175-4ee8-aa55-1580f73ce96c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
