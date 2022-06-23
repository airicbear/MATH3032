### A Pluto.jl notebook ###
# v0.17.7

using Markdown
using InteractiveUtils

# ╔═╡ ac54077a-8007-11ec-2a10-2f5dd1ff04ba
md"""
# HW 2.2

Eric Nguyen
"""

# ╔═╡ 36fe2238-3025-4aeb-8828-5fe53519c5fe
md"""
### Problem 1

**(a).**

$E(x) = \frac{1}{10} + 2 ⋅ \frac{2}{10} + 3 ⋅ \frac{3}{10} + 4 ⋅ \frac{4}{10} = \frac{10}{10} = \frac{30}{10} = 3$

**(b).**

$E(x) = \frac{1}{55} + 2 ⋅ \frac{2}{55} + ⋯ + 10 ⋅ \frac{10}{55} = 7$

**(c).**

$E(X) = 3(1/4)^1 + 2⋅3(1/4)^2 + 3⋅3(1/4)^3 + ⋯ = \frac{4}{3}$

**(d).**

$E(X) = \frac{4}{30} + 2 ⋅ \frac{9}{30} + 3 ⋅ \frac{16}{30} = \frac{7}{3}$

**(e).**

$E(X) = \frac{1}{10} + 2 ⋅ \frac{2}{10} + ⋯ + n ⋅ \frac{n}{10} = \frac{n^2(n + 1)}{2}$

**(f).**

$E(X) = \left[\frac{1}{2} - \frac{1}{3}\right] + 2 \left[\frac{1}{3} - \frac{1}{4}\right] + ⋯ = \text{Undefined}$
"""

# ╔═╡ 9ced3ef4-a411-4e91-afcc-0d333fa2ae8f
md"""
### Problem 3

$X ∼ \text{Benford}$

$f(x) = \log_{10}{\left(\frac{x+1}{x}\right)} \qquad x = 1,2,…,9$

$\begin{align*}
E(X) &= \log_{10}(2) + 2 \log_{10}{\left(\frac{3}{2}\right)} + ⋯ 9 \log_{10}{\left(\frac{10}{9}\right)} \\
&= \log_{10}(2) + \log_{10}{\left(\frac{3}{2}\right)^2} + ⋯ \log_{10}{\left(\frac{10}{9}\right)^9} \\
&= \log_{10}\left[2 ⋅ \left(\frac{3}{2}\right)^2 ⋅ \left(\frac{4}{3}\right)^3 ⋯ \left(\frac{10}{9}\right)^9\right] \\
&= \log_{10}\left[2 ⋅ \left(\frac{3^2}{2}\right) ⋅ \left(\frac{4^3}{3^2}\right) ⋯ \left(\frac{10^9}{9^8}\right) ⋅ \left(\frac{1}{9!}\right)\right] \\
&= \log_{10}\left[\frac{10^9}{9!}\right] \\
&= 9 - \log_{10}{(9!)}
\end{align*}$
"""

# ╔═╡ 9a453f90-48fb-43ae-bf5f-f2af2545ecab
md"""
### Problem 5

$E(X) = \frac{4}{10} + 2 ⋅ \frac{3}{10} + 3 ⋅ \frac{2}{10} + 4 ⋅ \frac{1}{10} = 2 \text{ days}$

The expected payment for the hospitalization is ``\$200``.
"""

# ╔═╡ 44520daf-5c2d-4e4d-82e8-12751852f321
md"""
### Problem 7

$Z = u(X) = X^3$

**(a).**

$h(z) = -\frac{1}{4} f(z) = -\frac{(4 - z)}{24}$

**(b).**

$E(Z) = \sum_{x = 1}^3 x^3 h(x^3) = \frac{325}{12} ≈ 27.08$

**(c).**

On average, the young man can expect to win ``-\$27+\$10 = -\$17`` per play if he charges ``\$10`` per play.
"""

# ╔═╡ 876b1afa-564d-4f0d-b8e8-ea629dc7cf5b
md"""
### Problem 9

$E(X) = -1 ⋅ \frac{125}{216} + \frac{75}{216} + 2 ⋅ \frac{15}{216} + 3 ⋅ \frac{1}{216} = -\frac{17}{216} ≈ -0.08$
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
# ╟─ac54077a-8007-11ec-2a10-2f5dd1ff04ba
# ╟─36fe2238-3025-4aeb-8828-5fe53519c5fe
# ╟─9ced3ef4-a411-4e91-afcc-0d333fa2ae8f
# ╟─9a453f90-48fb-43ae-bf5f-f2af2545ecab
# ╟─44520daf-5c2d-4e4d-82e8-12751852f321
# ╟─876b1afa-564d-4f0d-b8e8-ea629dc7cf5b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
