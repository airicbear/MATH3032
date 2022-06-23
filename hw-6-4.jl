### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ d6899584-c3f6-11ec-130f-e3a69ed23387
begin
	using Statistics
md"""
# HW 6.4

Eric Nguyen
"""
end

# ╔═╡ e2d680be-9382-4811-afdf-8d7c33e1734f
md"""
### Problem 1

Let ``X_1,X_2,…,X_n`` be a random sample from ``N(\mu,\sigma^2)``, where the mean ``\theta = \mu`` is such that ``-∞ < \theta < ∞`` and ``\sigma^2`` is a known positive number.
Show that the maximum likelihood estimator for ``\theta`` is ``\widehat{\theta} = \overline{X}``.
"""

# ╔═╡ 78c30e97-a8c3-4a34-a5b6-8fc102b0a3bf
md"""
**Solution.**
The pdf of ``X_i`` with ``\theta_1 = \mu`` and ``\theta_2 = \sigma^2`` is

$f(x_i;\theta_1,\theta_2) = \frac{1}{\sqrt{\theta_2} \sqrt{2\pi}} \exp\left[-\frac{(x_i - \theta_1)^2}{2{\theta_2}}\right], \qquad -∞ < \theta_1 < ∞, \quad 0 < \theta_2 < ∞$

The likelihood function is given by

$L(\theta_1,\theta_2) = \prod_{i=1}^n f(x_i; \theta_1, \theta_2) = \theta_2^{-n/2} (2\pi)^{-n/2} \exp{\left[-\frac{1}{2\theta_2} \sum_{i=1}^n (x_i - \theta_1)^2\right]}$

The natural logarithm of ``L(\theta_1,\theta_2)`` is

$\log{L(\theta_1,\theta_2)} = -\frac{n}{2} \log{(\theta_2)} - \frac{n}{2} \log{(2\pi)} - \frac{\sum (x_i - \theta_1)^2}{2\theta_2}$

The partial derivative of the log likelihood with respect to ``\theta_1`` set equal to zero, gives

$\frac{∂\log{L(\theta_1,\theta_2)}}{∂\theta_1} = \frac{-2\sum(x_i - \theta_1) (-1)}{2\theta_2} = 0$

Solving for ``\theta_1``, we get a maximum likelihood estimate

$\widehat{\theta}_1 = \hat{\mu} = \frac{\sum x_i}{n} = \bar{x}$

So, the maximum likelihood estimator for ``\theta`` is ``\widehat{\theta} = \overline{X}``.
"""

# ╔═╡ 060b0ff0-27ec-4ca0-bda3-26d298d8c8e3
md"""
### Problem 3

A random sample ``X_1,X_2,…,X_n`` of size ``n`` is taken from a Poisson distribution with a mean of ``\lambda``, ``0 < \lambda < ∞``.

(a) Show that the maximum likelihood estimator for ``\lambda`` is ``\widehat{\lambda} = \overline{X}``.

(b) Let ``X`` equal the number of flaws per 100 feet of a used computer tape.
Assume that ``X`` has a Poisson distribution with a mean of ``\lambda``.
If 40 observations of ``X`` yielded five zeros, seven ones, 12 twos, nine threes, five fours, one five, and one six, find the maximum likelihood estimate of ``\lambda``.
"""

# ╔═╡ 1a3004ae-5365-4f76-aa8c-537c1460c739
md"""
**Solution (a).**
The pdf of ``X_i`` is

$f(x_i; \lambda) = \frac{1}{{x_i}!} {\lambda}^{x_i} e^{-\lambda}, \qquad \lambda > 0$

The likelihood function is given by

$L(\lambda) = \prod_{i=1}^n f(x_i; \lambda) = \frac{1}{\prod x_i!} \lambda^{\sum x_i} e^{-n\lambda} = \frac{1}{\prod x_i!} \lambda^t e^{-n\lambda}$

The natural logarithm of ``L(\lambda)`` is

$\log{L(\lambda)} = t \log{\left(\lambda\right)} - \log{\left(\prod x_i!\right)} - n \lambda$

The derivative of the log likelihood set equal to zero gives

$\frac{t}{\lambda} - n = 0$

Solving for ``\lambda``, we get a maximum likelihood estimate

$\hat{\lambda} = \frac{t}{n} = \frac{\sum x_i}{n} = \bar{x}$

So, the maximum likelihood estimator for ``\lambda`` is ``\widehat{\lambda} = \overline{X}``.
"""

# ╔═╡ 7e511257-4ffb-4106-9920-536fa3509752
p3_solutionb = let
	xs = [
		repeat([0], 5);
		repeat([1], 7);
		repeat([2], 12);
		repeat([3], 9);
		repeat([4], 5);
		repeat([5], 1);
		repeat([6], 1)
	]
	λ̂ = mean(xs)
end

# ╔═╡ 8df8915f-e3bd-41d4-8df0-0823412b5691
md"""
### Problem 5

Let ``X_1,X_2,…,X_n`` be a random sample from distributions with the given probability density functions.
In each case, find the maximum likelihood estimator ``\widehat{\theta}``.

(a) ``f(x;\theta) = (1/\theta^2) x e^{-x/\theta}, \qquad 0 < x < ∞, \quad 0 < \theta < ∞``.

(b) ``f(x;\theta) = (1/2\theta^3) x^3 e^{-x/\theta}, \qquad 0 < x < ∞, \quad 0 < \theta < ∞``.

(c) ``f(x;\theta) = (1/2) e^{-|x-\theta|}, \,-∞ < x < ∞, \,-∞ < \theta < ∞``.
"""

# ╔═╡ 59c88a95-8ea9-4fba-8534-deca850f72ef
md"""
**Solution (a).**
The likelihood function is

$L(\theta) = \prod_{i=1}^n f(x;\theta) = \frac{1}{\theta^{2n}} e^{-\left(\sum x\right)/\theta} \sum x$

The natural logarithm of the likelihood function is

$\log{L(\theta)} = -\left(\sum x\right)/\theta + \log{\left(\sum x\right)} - 2n \log{\theta}$

Setting the derivative of the log likelihood function to zero, we get

$\left(\sum x\right)/\theta^2 - 2n/\theta = 0$

Solving for ``\theta`` we get the maximum likelihood estimator

$\widehat{\theta} = \overline{X} / 2$
"""

# ╔═╡ 9b26ab49-a460-4262-8bd9-03b53284259c
md"""
**Solution (b).**
The likelihood function is

$L(\theta) = \prod_{i=1}^n f(x;\theta) = \frac{1}{2^n\theta^{3n}} e^{-\left(\sum x\right) / \theta} \sum x^3$

The natural logarithm of the likelihood function is

$\log{L(\theta)} = -\left(\sum x\right) / \theta + 3 \log{x} - n \log{2} - 3n \log{\theta}$

Setting the derivative of the log likelihood function to zero, we get

$\left(\sum x\right) / \theta^2 - 3n / \theta = 0$

Solving for ``\theta`` we get a maximum likeihood estimator

$\widehat{\theta} = \overline{X} / 3$
"""

# ╔═╡ dd9d174b-0b11-4a19-af21-8f3caee8da9f
md"""
**Solution (c).**
The likelihood function is

$L(\theta) = \prod_{i=1}^n f(x;\theta) = \frac{1}{2^n} e^{-|\sum x - n\theta|}$

The natural logarithm of the likelihood function is

$\log{L(\theta)} = -\left|\sum x - n\theta\right| - n \log{2}$

Setting the derivative of the log likelihood function to zero,

$-\frac{n\theta}{|n\theta|} = 0$

Solving for ``\theta`` we get a maximum likelihood estimator

$\widehat{\theta} = 0$

The maximum likelihood estimator ``\widehat{\theta}`` equals the sample median.
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0-beta1"
manifest_format = "2.0"
project_hash = "c2ebf593fb8fca52e25f227c4ea4799a3b858e2f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.0+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.17+2"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.0.1+0"
"""

# ╔═╡ Cell order:
# ╟─d6899584-c3f6-11ec-130f-e3a69ed23387
# ╟─e2d680be-9382-4811-afdf-8d7c33e1734f
# ╟─78c30e97-a8c3-4a34-a5b6-8fc102b0a3bf
# ╟─060b0ff0-27ec-4ca0-bda3-26d298d8c8e3
# ╟─1a3004ae-5365-4f76-aa8c-537c1460c739
# ╠═7e511257-4ffb-4106-9920-536fa3509752
# ╟─8df8915f-e3bd-41d4-8df0-0823412b5691
# ╟─59c88a95-8ea9-4fba-8534-deca850f72ef
# ╟─9b26ab49-a460-4262-8bd9-03b53284259c
# ╟─dd9d174b-0b11-4a19-af21-8f3caee8da9f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
