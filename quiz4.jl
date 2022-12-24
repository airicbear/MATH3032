### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ b5125660-b6e1-11ec-04d9-d910b3393bfd
begin
	using Distributions
md"# MATH 3032 Quiz 4.2-4.5"
end

# ╔═╡ e8f28be3-758b-4f96-a3bc-633d7b5d1f02
md"""
### Problem 1

Let ``X`` and ``Y`` be continuous random variables with joint pdf

$f(x,y) = \frac{1}{2}, 0 ≤ x ≤ y ≤ 2$

**a)** Find the conditional pdf of ``Y`` given ``X = x``.

**b)** Find the conditional mean of ``Y`` given ``X = x``.
"""

# ╔═╡ 3b46ae4a-38f0-4dd6-a178-01424ec0629c
md"""
**Solution 1(a).**

$f_{Y ∣ x}(y ∣ x) = \frac{f(x,y)}{f_X(x)}$

$f_X(x) = ∫_x^2 \frac{1}{2} \,dy = \frac{1}{2} (2 - x), \qquad 0 < x < 2$

$f_{Y ∣ x}(y ∣ x) = \frac{\frac{1}{2}}{\frac{1}{2} (2 - x)} = \frac{1}{2 - x}, \qquad x < y < 2, \qquad \text{for all } 0 < x < 2$
"""

# ╔═╡ 20d7e7d3-f098-4a22-9f67-748fdbc7d329
md"""
**Solution 1(b).**

$\begin{align*}
E[Y ∣ x] &= ∫_x^2 y f_{Y ∣ x}(y ∣ x) \,dy \\
&= ∫_x^2 y \,\frac{1}{2 - x} \,dy \\
&= \frac{1}{2 - x} \left[\frac{y^2}{2}\right]_x^2 \\
&= \frac{1}{2 - x} \left(\frac{4}{2} - \frac{x^2}{2}\right) \\
&= \frac{1}{2 - x} ⋅ \frac{1}{2} (2 - x)(2 + x) \\
&= \frac{2 + x}{2}, \qquad \text{for } 0 < x < 2
\end{align*}$
"""

# ╔═╡ 7b1365a0-9162-495d-973c-80d05da333fd
md"""
### Problem 2

Suppose ``X`` and ``Y`` have a bivariate normal distribution with ``\mu_X = 68``, ``{\sigma_X}^2 = 90``, ``\mu_Y = 76``, ``{\sigma_Y}^2 = 110`` and ``\rho = -.77``.

**a)** Find ``P(74 < Y < 88 ∣ X = 64)``.
"""

# ╔═╡ 8a5dce4b-952e-4987-8fc5-8ac03943075b
md"""
**Solution 2(a).**

$\mu_{Y ∣ x} = \mu_Y + \rho \frac{\sigma_Y}{\sigma_X} (x - \mu_X) = 76 - (0.77) ⋅ \frac{\sqrt{110}}{\sqrt{90}} (64 - 68) = 79.405$

${\sigma_{Y ∣ X}}^2 = {\sigma_Y}^2 (1 - \rho^2) = (110)[1 - (-.77)^2] = 44.781$

$\begin{align*}
&P\left(\frac{74 - 79.405}{\sqrt{44.781}} < \frac{Y - \mu_{Y ∣ x}}{\sigma_{Y ∣ x}} < \frac{88 - 79.405}{\sqrt{44.781}} \mid x = 64\right) \\
&= P(-0.8077 < Z < 1.2844) \\
&= \Phi(1.2844) - \Phi(-0.8077) \\
&= \Phi(1.2844) - [1 - \Phi(0.8077)] \\
&= \Phi(1.2844) + \Phi(0.8077) - 1 \\
&= 0.8997 + 0.7910 - 1 \\
&= 0.6909
\end{align*}$
"""

# ╔═╡ 5cb4789c-c16e-49f2-b505-480ab2e84b0e
let
	μX = 68
	σX² = 90
	σX = sqrt(σX²)
	μY = 76
	σY² = 110
	σY = sqrt(σY²)
	ρ = -0.77
	x = 64

	μYX = μY + ρ * (σY / σX) * (x - μX)
	σYX² = σY² * (1 - ρ^2)
	σYX = sqrt(σYX²)

	a = 74
	b = 88

	Φ(x) = cdf(Normal(0, 1), x)
	Φ((b - μYX) / σYX) - Φ((a - μYX) / σYX)
end

# ╔═╡ 94043521-91da-4434-b90b-6059a694652f
md"""
### Problem 3

Suppose ``X`` has a geometric distribution with parameter ``p`` and suppose the conditional distribution of ``Y`` given ``X = x`` is ``\text{Binomial}(x,p)``.
Find

**a)** ``E[Y]``

**b)** ``\text{Var}(Y)``.
"""

# ╔═╡ 16475764-2471-48e2-a791-79a2e2fce3e1
md"""
**Solution 3(a).**

$E[Y] = E[E[Y ∣ X]] = E[Xp] = pE[X] = p ⋅ \frac{1}{p} = 1$
"""

# ╔═╡ 0ec17bc2-5a15-4f18-bc01-6a40843bb2e9
md"""
**Solution 3(b).**

$\begin{align*}
\text{Var}(Y) &= E[\text{Var}(Y ∣ X)] + \text{Var}(E[Y ∣ X]) \\
&= E[Xpq] + \text{Var}(Xp) \\
&= pq \frac{1}{p} + p^2 \text{Var}(X) \\
&= q + p^2 ⋅ \frac{q}{p^2} \\
&= 2q \\
&= 2(1 - p)
\end{align*}$
"""

# ╔═╡ 5096bc8d-dfe0-491e-aaa2-2c6be114118f
md"""
### Problem 4

Roll a fair 6-sided die twice.
Let ``X`` be the outcome of the first roll and ``Y`` equal the sum of the two rolls.

**a)** Find ``\mu_X``, ``\mu_Y``, ``{\sigma_X}^2``, ``{\sigma_Y}^2``, and ``\rho``.
"""

# ╔═╡ bb7825a9-b7d4-4ffb-80d0-c4f83203e80d
md"""
**Solution 4(a).**

$X_1 ∼ \text{Unif}\{1,2,3,4,5,6\}$

$X_2 ∼ \text{Unif}\{1,2,3,4,5,6\}$

$X_1, X_2 \text{ Independent}$

$X = X_1 \qquad Y = X_1 + X_2$

$\mu_X = \frac{1}{6} (1 + 2 + 3 + 4 + 5 + 6) = \frac{21}{6} = \frac{7}{2}$

$\begin{align*}
E[X^2] &= \frac{1}{6} (1^2 + 2^2 + 3^2 + 4^2 + 5^2 + 6^2) \\
&= \frac{1}{6} (1 + 4 + 9 + 16 + 25 + 36) \\
&= \frac{91}{6}
\end{align*}$

${\sigma_X}^2 = \frac{91}{6} - \left(\frac{7}{2}\right)^2 = \frac{91}{6} - \frac{49}{4} = \frac{(91)(2) - (49)(3)}{12} = \frac{35}{12}$

$\mu_Y = \mu_{X_1} + \mu_{X_2} = \frac{7}{2} ⋅ 2 = 7$

${\sigma_Y}^2 = {\sigma_{X_1}}^2 + {\sigma_{X_2}}^2 = 2 ⋅ \frac{35}{12} = \frac{35}{6}$

$\text{Cov}(X,Y) = \text{Cov}(X_1, X_1 + X_2) = \text{Cov}(X_1, X_1) + \text{Cov}(X_1, X_2) = {\sigma_{X_1}}^2 = \frac{35}{12}$

$\rho = \frac{\text{Cov}(X,Y)}{\sigma_X \sigma_Y} = \frac{\frac{35}{12}}{\sqrt{\frac{35}{12}} \sqrt{\frac{35}{12} ⋅ 2}} = \frac{1}{\sqrt{2}}$
"""

# ╔═╡ c10ea411-199d-4516-8177-2e1a4a46e628
md"""
### Problem 5

Let ``X`` and ``Y`` be discrete random variables such that ``X`` and ``Y`` are not identically constants.
Suppose ``E[Y ∣ x] = ax + b``, for some constants ``a,b``.

**a)** Show that ``E[Y ∣ x] = \mu_Y + \rho \frac{\sigma_Y}{\sigma_X} (x - \mu_X)``.
"""

# ╔═╡ b24e91fa-19f6-4ec3-a340-a602e8f3ce48
md"""
**Solution 5(a).**

$E[Y ∣ x] = ax + b \implies E[Y ∣ X] = aX + b$

$\mu_Y = E[Y] = E[E[Y ∣ X]] = E[aX + b] = a\mu_X + b$

$\implies \mu_Y = a \mu_X + b$

$\begin{align*}
E[XY] &= E[E[XY ∣ X]] \\
&= E[X E[Y ∣ X]] \\
&= E[X (aX + b)] \\
&= E[aX^2 + bX] \\
&= aE[X^2] + bE[X] \tag{1}
\end{align*}$

$\begin{equation}E[XY] = aE[X^2] + b \mu_X \tag{2}\end{equation}$

``(\mu_X)`` (1) ⟹

$\begin{equation}\mu_X \mu_Y = a {\mu_X}^2 + b \mu_X \tag{3}\end{equation}$

(2) - (3) ⟹

$\text{Cov}(X, Y) = a {\sigma_X}^2 \implies a = \frac{\text{Cov}(X,Y)}{{\sigma_X}^2} = \rho \frac{\sigma_Y}{\sigma_X}$

Substitute into (1) ``\implies \mu_Y = \rho \frac{\sigma_Y}{\sigma_X} \mu_X + b \implies b = \mu_Y - \rho \frac{\sigma_Y}{\sigma_X} \mu_X``

$E[Y ∣ x] = \rho \frac{\sigma_Y}{\sigma_X} x + \mu_Y - \rho \frac{\sigma_Y}{\sigma_X} \mu_X = \mu_Y + \rho \frac{\sigma_Y}{\sigma_X} (x - \mu_X)$
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
# ╟─b5125660-b6e1-11ec-04d9-d910b3393bfd
# ╟─e8f28be3-758b-4f96-a3bc-633d7b5d1f02
# ╟─3b46ae4a-38f0-4dd6-a178-01424ec0629c
# ╟─20d7e7d3-f098-4a22-9f67-748fdbc7d329
# ╟─7b1365a0-9162-495d-973c-80d05da333fd
# ╟─8a5dce4b-952e-4987-8fc5-8ac03943075b
# ╠═5cb4789c-c16e-49f2-b505-480ab2e84b0e
# ╟─94043521-91da-4434-b90b-6059a694652f
# ╟─16475764-2471-48e2-a791-79a2e2fce3e1
# ╟─0ec17bc2-5a15-4f18-bc01-6a40843bb2e9
# ╟─5096bc8d-dfe0-491e-aaa2-2c6be114118f
# ╟─bb7825a9-b7d4-4ffb-80d0-c4f83203e80d
# ╟─c10ea411-199d-4516-8177-2e1a4a46e628
# ╟─b24e91fa-19f6-4ec3-a340-a602e8f3ce48
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
