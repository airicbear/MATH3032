### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ b3ffdc74-b6d8-11ec-1436-c90118c7aec6
begin
	using Distributions
md"# MATH 3032 Quiz 3.2, 3.3, 4.1"
end

# ╔═╡ c9c4ac6b-042f-4099-88b0-aa5f834fc6ab
md"""
### Problem 1

Suppose cars arrive at a tollbooth at the mean rate of 15 cars every 30 minutes according to a Poisson process.

**a)** Find the probability that the toll collector will have to wait longer than 34.17 minutes before collecting the 10th toll.

**b)** Find the probability that more than 4 cars arrive in a 5-minute time interval.
"""

# ╔═╡ b0e1fd8f-ae47-41d1-91ff-e801dbbb2250
md"""
**Solution 1(a).**

$\lambda = \frac{15}{30} \text{ min} = \frac{1}{2} \text{ min}$

$T_{10} ∼ \text{Gamma}\left(\alpha = 10, \theta = \frac{1}{\lambda}\right) = \Gamma(\alpha = 10, \theta = 2) = \chi^2(20)$

$P(T_{10} > 34.17) = 1 - 0.975 = 0.025$
"""

# ╔═╡ cfc3118b-25a0-41e1-8375-b33c7ac90b0f
let
	T10 = Chisq(20)
	1 - cdf(T10, 34.17)
end

# ╔═╡ 5ec9ea2c-0984-4f61-925b-657841635de5
md"""
**Solution 1(b).**

$N_{[0,5]} ∼ \text{Poisson}(\lambda t)$

$\lambda t = \frac{1}{2} \frac{1}{\text{min}} ⋅ 5 \text{ min} = 2.5$

$\begin{align*}
P(N_{[0,5]} > 4) &= 1 - P(N_{[0,5]} ≤ 4) \\
&= 1 - \sum_{n = 0}^4 \frac{(2.5)^n}{n!} e^{-2.5} \\
&= 1 - 0.89 \\
&= 0.11
\end{align*}$
"""

# ╔═╡ 2cefd895-f4f9-4431-bb02-04287ca82ed2
let
	λ = 1/2
	t = 5
	N = Poisson(λ*t)
	1 - cdf(N, 4)
end

# ╔═╡ 34d5368e-5ff5-44fb-b036-bd3b5606999a
md"""
### Problem 2

In the Poisson process with intensity ``\lambda``, let ``T`` be the arrival time of the ``n``th occurrence.

**a)** Show that ``T`` has a ``\text{Gamma}(n, \theta = 1 / \lambda)`` distribution.
"""

# ╔═╡ 98dea270-7cae-415b-8e75-ce3f50806068
md"""
**Solution 2(a).**

$P(T_n > t) = P(N_{[0,t]} < n) = \sum_{k=0}^{n-1} \frac{(\lambda t)^k}{k!} e^{-\lambda t}$

$f_{T_n}(t) = F_{T_n}'(t) = \frac{d}{dt} \left[1 - P(T_n > t)\right] = … = e^{-\lambda t} \frac{\lambda^n t^{n-1}}{(n - 1)!} = \frac{t^{n-1}}{\Gamma(n) \theta^n} e^{-t/\theta}$

$∼ \text{Gamma}\left(n, \theta = \frac{1}{\lambda}\right)$
"""

# ╔═╡ 5b17f166-92b8-479f-b4e4-80cc83d2a64c
md"""
### Problem 3

Suppose ``X ∼ \chi^2(14)``.

**a)** Find ``a,b`` such that ``P(X < a) = .025`` and ``P(a < X < b) = .95``.

**b)** Find mean and variance of ``X``.
"""

# ╔═╡ fb3c5d2f-31cf-47b9-a7d9-051bf6e96742
md"""
**Solution 3(a).**

$a = \chi_{0.975}^2 (14) = 5.629$

$b = \chi_{0.025}^2 (14) = 26.12$
"""

# ╔═╡ 3c0fa6a9-2d71-4399-8a57-2b4a405a72f1
let
	r = 14
	X = Chisq(r)
	a = 5.629
	b = 26.12

	# Verify results of χ^2(r=a) and χ^2(r=b)
	cdf(Chisq(a), r)
	cdf(Chisq(b), r)
	
	cdf(X, b) - cdf(X, a)
end

# ╔═╡ 49dd8808-b4fb-4cee-a7cb-504a202c0785
md"""
**Solution 3(b).**

$\mu_X = r = 14$

${\sigma_X}^2 = 2r = 28$
"""

# ╔═╡ aea8a554-dcd0-40b9-b355-9836a0bb135d
md"""
### Problem 4

Suppose ``X ∼ N(0,9)``.
Let ``W = X^2``.

**a)** Find ``P(W < 12)``.
"""

# ╔═╡ ca0d55c7-c09b-41a7-bea7-6dd048f4c4bd
md"""
**Solution 4(a).**

$\begin{align*}
P(W < 12) &= P(X^2 < 12) \\
&= P(-\sqrt{12} < X < \sqrt{12}) \\
&= P\left(\frac{-\sqrt{12} - 0}{3} < \frac{X - \mu}{3} < \frac{\sqrt{12} - 0}{3}\right) \\
&= P(-1.1547 < Z < 1.1547) \\
&= \Phi(1.1547) - \Phi(-1.1547) \\
&= \Phi(1.1547) - [1 - \Phi(1.1547)] \\
&= 2\Phi(1.1547) - 1 \\
&= 2(0.8745) - 1 \\
&= 0.7498
\end{align*}$
"""

# ╔═╡ 65006d87-d5f7-40e3-9361-6e0c48c4ac5f
let
	μ = 0
	σ = 3
	X = Normal(μ,σ)
	Φ(x) = cdf(Normal(0,1), x)
	a = -sqrt(12)
	b = sqrt(12)

	:N => cdf(X, b) - cdf(X, a),
	:Φ => Φ((b - μ) / σ) - Φ((a - μ) / σ)
end

# ╔═╡ d4f89633-5711-4fc3-bb27-fcfabb1ad86c
md"""
### Problem 5

Suppose the joint probability mass function of two discrete random variables ``X`` and ``Y`` is given by ``f(x,y) = c(2x + y + 1)``, ``x = 0,1``, ``y = 0,1,2``.

**a)** Find ``c``.

**b)** Find the marginal probability mass function of ``X``.

**c)** Find ``E(XY)``.
"""

# ╔═╡ 83993cb9-00b6-49a4-9813-8061792c4d2e
md"""
**Solution 5(a).**

$1 = \sum_{x,y} f(x,y) = c + 2c + 3c + 3c + 4c + 5c = 18c \implies c = \frac{1}{18}$
"""

# ╔═╡ 5aa5ae07-991b-4fa6-b866-6c0cb550cd8b
md"""
**Solution 5(b).**

$\begin{align*}
f_X(0) &= 3c + 2c + c = 6c = \frac{6}{18} = \frac{1}{3} \\
f_X(1) &= 5c + 4c + 3c = 12c = \frac{12}{18} = \frac{2}{3}
\end{align*}$
"""

# ╔═╡ 41f053ad-205e-4e07-b15d-ebc827a744dd
md"""
**Solution 5(c).**

$\begin{align*}
E[XY] &= 1 ⋅ 1 ⋅ f(1,1) + 1 ⋅ 2 ⋅ f(1,2) \\
&= 4c + 2 ⋅ 5c \\
&= 4c + 10c \\
&= 14c \\
&= \frac{14}{18} \\
&= \frac{7}{9}
\end{align*}$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Distributions = "31c24e10-a181-5473-b8eb-7969acd0382f"

[compat]
Distributions = "~0.25.53"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0-beta1"
manifest_format = "2.0"
project_hash = "167ed4da208bb8c6845cf05862f93a68814f4c1f"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Calculus]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f641eb0a4f00c343bbc32346e1217b86f3ce9dad"
uuid = "49dc2e85-a5d0-5ad3-a950-438e2897f1b9"
version = "0.5.1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "9950387274246d08af38f6eef8cb5480862a435f"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.14.0"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "bf98fa45a0a4cee295de98d4c1462be26345b9a1"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.2"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "96b0bc6c52df76506efc8a441c6cf1adcb1babc4"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.42.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.0+0"

[[deps.DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "3daef5523dd2e769dad2365274f760ff5f282c7d"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.11"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "80c3e8639e3353e5d2912fb3a1916b8455e2494b"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.4.0"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "5a4168170ede913a2cd679e53c2123cb4b889795"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.53"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.DualNumbers]]
deps = ["Calculus", "NaNMath", "SpecialFunctions"]
git-tree-sha1 = "5837a837389fccf076445fce071c8ddaea35a566"
uuid = "fa6b7ba4-c1ee-5f82-b5fc-ecf0adba8f74"
version = "0.6.8"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "246621d23d1f43e3b9c368bf3b72b2331a27c286"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.13.2"

[[deps.HypergeometricFunctions]]
deps = ["DualNumbers", "LinearAlgebra", "SpecialFunctions", "Test"]
git-tree-sha1 = "65e4589030ef3c44d3b90bdc5aac462b4bb05567"
uuid = "34004b35-14d8-5ef3-9330-4cdb6864b03a"
version = "0.3.8"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "91b5dcf362c5add98049e6c29ee756910b03051d"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.3"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.81.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "58f25e56b706f95125dcb796f39e1fb01d913a71"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.10"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NaNMath]]
git-tree-sha1 = "737a5957f387b17e74d4ad2f440eb330b39a62c5"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.17+2"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "e8185b83b9fc56eb6456200e873ce598ebc7f262"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.7"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "d3538e7f8a790dc8903519090857ef8e1283eecd"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.5"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "78aadffb3efd2155af139781b8a8df1ef279ea39"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.4.2"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "bf3188feca147ce108c76ad82c2792c57abe7b1f"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.0"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "68db32dff12bb6127bac73c209881191bf0efbb7"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.3.0+0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "5ba658aeecaaf96923dce0da9e703bd1fe7666f9"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.4"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "c3d8ba7f3fa0625b062b82853a7d5229cb728b6b"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.2.1"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "8977b17906b0a1cc74ab2e3a05faa16cf08a8291"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.16"

[[deps.StatsFuns]]
deps = ["ChainRulesCore", "HypergeometricFunctions", "InverseFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "72e6abd6fc9ef0fa62a159713c83b7637a14b2b8"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.17"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.0.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.41.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "16.2.1+1"
"""

# ╔═╡ Cell order:
# ╟─b3ffdc74-b6d8-11ec-1436-c90118c7aec6
# ╟─c9c4ac6b-042f-4099-88b0-aa5f834fc6ab
# ╟─b0e1fd8f-ae47-41d1-91ff-e801dbbb2250
# ╠═cfc3118b-25a0-41e1-8375-b33c7ac90b0f
# ╟─5ec9ea2c-0984-4f61-925b-657841635de5
# ╠═2cefd895-f4f9-4431-bb02-04287ca82ed2
# ╟─34d5368e-5ff5-44fb-b036-bd3b5606999a
# ╟─98dea270-7cae-415b-8e75-ce3f50806068
# ╟─5b17f166-92b8-479f-b4e4-80cc83d2a64c
# ╟─fb3c5d2f-31cf-47b9-a7d9-051bf6e96742
# ╠═3c0fa6a9-2d71-4399-8a57-2b4a405a72f1
# ╟─49dd8808-b4fb-4cee-a7cb-504a202c0785
# ╟─aea8a554-dcd0-40b9-b355-9836a0bb135d
# ╟─ca0d55c7-c09b-41a7-bea7-6dd048f4c4bd
# ╠═65006d87-d5f7-40e3-9361-6e0c48c4ac5f
# ╟─d4f89633-5711-4fc3-bb27-fcfabb1ad86c
# ╟─83993cb9-00b6-49a4-9813-8061792c4d2e
# ╟─5aa5ae07-991b-4fa6-b866-6c0cb550cd8b
# ╟─41f053ad-205e-4e07-b15d-ebc827a744dd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
