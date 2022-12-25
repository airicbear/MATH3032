### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ 9ae2c51e-6bf4-11ec-0f2d-d39ceea4f3ad
let
	using PlutoUI
	using LinearAlgebra
	using Statistics
	using Distributions
	using SpecialFunctions
	using StatsBase
	using QuadGK
	# using Turing
	# using StatsPlots
	
	md"""
# Probability and Statistical Inference

10th Edition, Robert V. Hogg, Elliot A. Tanis, Dale L. Zimmerman
"""
end

# ╔═╡ 5f187c11-4e38-46ea-a88e-7023df008678
function trinomial(x, y; n, p1, p2)
	if n - x - y ≤ 0
		return 0
	else
		return (factorial(n) / (factorial(x) * factorial(y) * factorial(n - x - y))) * p1^x * p2^y * (1 - p1 - p2)^(n - x - y)
	end
end

# ╔═╡ f30d3dc5-b4f3-442a-bcc0-4b48dc0660fb
Φ(x) = cdf(Normal(0,1), x)

# ╔═╡ 17916bdf-017b-4efa-99f3-cb6f76c1cea3
PlutoUI.TableOfContents()

# ╔═╡ 7467c574-4693-456f-9b46-d677724532f7
md"# Probability"

# ╔═╡ c6d34659-4f43-4c64-883f-b83a88036159
md"## Properties of Probability"

# ╔═╡ d48bbe41-b7ee-41b8-9ece-848f192e3aa2
md"""
**Definition 1.1-1.**
**Probability** is a real-valued set function ``P`` that assigns, to each event ``A`` in the sample space ``S``, a number ``P(A)``, called the probability of the event ``A``, such that the following properties are satisfied:

- (a) ``P(A) ≥ 0``;

- (b) ``P(S) = 1``;

- (c) if ``A_1, A_2, A_3, …`` are events and ``A_i ∩ A_j = ∅, i ≠ j``, then

   $P(A_1 ∪ A_2 ∪ ⋯ ∪ A_k) = P(A_1) + P(A_2) + ⋯ + P(A_k)$

   for each positive integer ``k``, and

   $P(A_1 ∪ A_2 ∪ A_3 ∪ ⋯) = P(A_1) + P(A_2) + P(A_3) + ⋯$

   for an infinite, but countable, number of events.
"""

# ╔═╡ 8c1fc2e8-10b9-4b1e-88a5-0fba8cf55000
md"""
**Theorem 1.1-1.**
For each event ``A``,

$P(A) = 1 - P(A')$

*Proof.*
We have

$S = A ∪ A' \quad \text{ and } \quad A ∩ A' = ∅.$

Thus, from properties (b) and (c), it follows that

$1 = P(A) + P(A').$

Hence

$P(A) = 1 - P(A')$
"""

# ╔═╡ 6fdb6d99-52ed-435d-b05e-e8b97333843f
md"""
**Theorem 1.1-2.**

$P(∅) = 0.$

*Proof.*
In Theorem 1.1-1, take ``A = ∅`` so that ``A' = S``.
Then

$P(∅) = 1 - P(S) = 1 - 1 = 0.$
"""

# ╔═╡ 65937beb-366c-46ea-8d85-864316ea9abb
md"""
**Theorem 1.1-3.**

If events ``A`` and ``B`` are such that ``A ⊂ B``, then ``P(A) ≤ P(B)``.

*Proof.*
Because ``A ⊂ B``, we have

$B = A ∪ (B ∩ A') \quad \text{ and } \quad A ∩ (B ∩ A') = ∅.$

Hence, from property (c),

$P(B) = P(A) + P(B ∩ A') ≥ P(A)$

because, from property (a),

$P(B ∩ A') ≥ 0.$
"""

# ╔═╡ d4c61e3e-1397-441d-a5c3-26bc26db17e1
md"""
**Theorem 1.1-4.**

For each event ``A``, ``P(A) ≤ 1``.

*Proof.*
Because ``A ⊂ S``, we have, by Theorem 1.1-3 and property (b),

$P(A) ≤ P(S) = 1,$

which gives the desired result.
"""

# ╔═╡ dd152770-b3ba-4aa3-b247-8e9bb6e9d95a
md"""
**Theorem 1.1-5.**

If ``A`` and ``B`` are any two events, then

$P(A ∪ B) = P(A) + P(B) - P(A ∩ B)$

*Proof.*

The event ``A ∪ B`` can be represented as a union of mutually exclusive events, namely,

$A ∪ B = A ∪ (A' ∩ B).$

Hence, by property (c),

$P(A ∪ B) = P(A) + P(A' ∩ B).$

However,

$B = (A ∩ B) ∪ (A' ∩ B),$

which is a union of mutually exclusive events.
Thus,

$P(B) = P(A ∩ B) + P(A' ∩ B)$

and

$P(A' ∩ B) = P(B) - P(A ∩ B).$

If the right side of this equation is substituted into Equation 1.1-1, we obtain

$P(A ∪ B) = P(A) + P(B) - P(A ∩ B),$

which is the desired result.
"""

# ╔═╡ ac9c887d-44a8-47b4-a841-9478a50d8c2f
md"""
**Theorem 1.1-6.**

If ``A``, ``B``, and ``C`` are any three events, then

$\begin{align*}P(A ∪ B ∪ C) &= P(A) + P(B) + P(C) \\ &\quad - P(A ∩ B) - P(A ∩ C) - P(B ∩ C) + P(A ∩ B ∩ C).\end{align*}$

*Proof.*
Write

$A ∪ B ∪ C = A ∪ (B ∪ C)$

and apply Thereom 1.1-5.
The details are left as an exercise.
"""

# ╔═╡ e140b068-926a-4270-8b26-1160ea55d03c
md"## Methods of Enumeration"

# ╔═╡ f6574308-334e-4b18-ad39-bf7545b4831f
md"""
**Definition 1.2-1.**
Each of the ``n!`` arrangements (in a row) of ``n`` different objects is called a **permutation** of the ``n`` objects.
"""

# ╔═╡ 82035fc0-d0c6-4875-b728-a74d91483b0b
md"""
**Definition 1.2-2.**
Each of the ``_nP_r`` arrangements is called a **permutation of ``n`` objects taken ``r`` at a time.**
"""

# ╔═╡ 8b76e85b-51b1-477f-b3b9-a4c65db30b70
md"""
**Definition 1.2-3.**
If ``r`` objects are selected from a set of ``n`` objects, and if the order of selection is noted, then the selected set of ``r`` objects is called an **ordered sample of size ``r``.**
"""

# ╔═╡ a5c786a2-d377-4521-bce8-3bc93fd86246
md"""
**Definition 1.2-4.**
**Sampling with replacement** occurs when an object is selected and then replaced before the next object is selected.
"""

# ╔═╡ ba971c85-2ca2-4413-acfe-7f2039e97eca
md"""
**Definition 1.2-5.**
**Sampling without replacement** occurs when an object is not replaced after it has been selected.
"""

# ╔═╡ fe145b80-6698-409f-8c4a-ca48d6bceb63
md"""
**Definition 1.2-6.**
Each of the ``_nC_r`` unordered subsets is called a **combination of ``n`` objects taken ``r`` at a time**, where

$_nC_r = \begin{pmatrix} n \\ r \end{pmatrix} = \frac{n!}{r! (n - r)!}.$
"""

# ╔═╡ 2e3e8f68-bae7-4fe9-a688-4b98aa1987a3
md"""
**Definition.**
The numbers ``\begin{pmatrix} n \\ r \end{pmatrix}`` are frequently called **binomial coefficients** because they arise in the expansion of a binomial.
We illustrate this property by giving a justification of the binomial expansion

$(a + b)^n = \sum_{r = 0}^n \begin{pmatrix} n \\ r \end{pmatrix} b^r a^{n - r}. \tag{1.2-1}$

For each summand in the expansion of

$(a + b)^n = (a + b)(a + b) ⋯ (a + b).$

either an ``a`` or a ``b`` is selected from each of the ``n`` factors.
One possible product is then ``b^r a^{n - r}``; this occurs when ``b`` is selected from each of ``r`` factors and ``a`` from each of the remaining ``n - r`` factors.
But the latter operation can completed in ``\begin{pmatrix} n \\ r \end{pmatrix}`` ways, which then must be the coefficient of ``b^r a^{n - r}``, as show in Equation 1.2-1.

The binomial coefficients are given in Table 1 in Appendix B for selected values of ``n`` and ``r``.
Note that for some combinations of ``n`` and ``r``, the table uses the fact that

$\begin{pmatrix} n \\ r \end{pmatrix} = \frac{n!}{r! (n - r)!} = \frac{n!}{(n - r)! r!} = \begin{pmatrix} n \\ n - r \end{pmatrix}.$
"""

# ╔═╡ debe1b3d-6007-450e-9eab-ff69386d68fc
md"""
**Definition 1.2-7.**
Each of the ``_nC_r`` permutations of ``n`` objects, ``r`` of one type and ``n - r`` of another type, is called a **distinguishable permutation.**
"""

# ╔═╡ 87aafbe7-d00b-4135-8ea4-6e6b1f40269e
md"## Conditional Probability"

# ╔═╡ 1f18abd2-9962-40f5-a081-bb9c94da727a
md"""
**Definition 1.3-1.**
The **conditional probability** of an event ``A``, given that event ``B`` has occurred, is defined by

$P(A ∣ B) = \frac{P(A ∩ B)}{P(B)},$

provided that $P(B) > 0$.
"""

# ╔═╡ 1a96353b-e731-4c33-b220-53ff8bfc003b
md"""
**Definition 1.3-2.**
The probability that two events, ``A`` and ``B``, both occur is given by the **multiplication rule**,

$P(A ∩ B) = P(A) P(B ∣ A)$

provided $P(A) > 0$ or by

$P(A ∩ B) = P(B) P(A ∣ B)$

provided $P(B) > 0$.
"""

# ╔═╡ ac7893f4-0f1c-4381-837a-43a654178b29
md"## Independent Events"

# ╔═╡ 59e3ae19-3058-4f6c-9c94-6453aa8d6879
md"""
**Definition 1.4-1.**
Events ``A`` and ``B`` are **independent** if and only if $P(A ∩ B) = P(A) P(B)$.
Otherwise, ``A`` and ``B`` are called **dependent** events.
"""

# ╔═╡ 93b2c23c-b157-40f5-971b-bb439ae41d54
md"""
**Theorem 1.4-1.**
If ``A`` and ``B`` are independent events, then the following pairs of events are also independent:

- (a) ``A`` and ``B'``;
- (b) ``A'`` and ``B``;
- (c) ``A'`` and ``B'``.

*Proof.*
We know that the conditional probability satisfies the axioms for a probability function.
Hence, if ``P(A) > 0``, then ``P(B' ∣ A) = 1 - P(B ∣ A)``.
Thus,

$\begin{align*}
P(A ∩ B') &= P(A) P(B' ∣ A) = P(A)[1 - P(B∣A)] \\
&= P(A)[1 - P(B)] \\
&= P(A)P(B').
\end{align*}$

because ``P(B∣A) = P(B)`` by hypothesis.
If ``P(A) = 0``, then ``P(A ∩ B') = 0``, so in this case we also have ``P(A ∩ B') = P(A)P(B')``.
Consequently, ``A`` and ``B'`` are independent events.
The proofs of parts (b) and (c) are left as exercises.
"""

# ╔═╡ a4d285ff-55ed-431a-a3c2-d2905ba98bae
md"""
**Definition 1.4-2.**
Events ``A``, ``B``, and ``C`` are **mutually independent** if and only if the following two conditions hold:

- (a) ``A``, ``B``, and ``C`` are pairwise independent; that is,

  $P(A ∩ B) = P(A)P(B), \qquad P(A ∩ C) = P(A)P(C),$

  and

  $P(B ∩ C) = P(B)P(C).$

- (b) ``P(A ∩ B ∩ C) = P(A)P(B)P(C)``.
"""

# ╔═╡ 9c6fb31e-5f68-4e37-aaca-773cce98338e
md"## Bayes' Theorem"

# ╔═╡ b6894d71-7abb-4849-85c6-47d0724f1a50
md"""
**Example 1.5-1.**
Bowl ``B_1`` contains two red and four white chips, bowl ``B_2`` contains one red and two white chips, and bowl ``B_3`` contains five red and four white chips.
Say that the probabilities for selecting the bowls are not the same but are given by ``P(B_1) = 1/3``, ``P(B_2) = 1/6``, and ``P(B_3) = 1/2``, where ``B_1``, ``B_2``, and ``B_3`` are the events that bowls ``B_1``, ``B_2``, and ``B_3`` are respectively chosen.
The experiment consists of selecting a bowl with these probabilities and then drawing a chip at random from that bowl.
Let us compute the probability of event ``R``, drawing a red chip---say, ``P(R)``.
Note that ``P(R)`` is dependent first of all on which bowl is selected and then on the probability of drawing a red chip from the selected bowl.
That is, the event ``R`` is the union of the mutually exclusive events ``B_1 ∩ R``, ``B_2 ∩ R``, and ``B_3 ∩ R``.
Thus,

$\begin{align*}
P(R) &= P(B_1 ∩ R) + P(B_2 ∩ R) + P(B_3 ∩ R) \\
&= P(B_1) P(R ∣ B_1) + P(B_2) P(R ∣ B_2) + P(B_3) P(R ∣ B_3) \\
&= \frac{1}{3} ⋅ \frac{2}{6} + \frac{1}{6} ⋅ \frac{1}{3} + \frac{1}{2} ⋅ \frac{5}{9} \\
&= \frac{4}{9}.
\end{align*}$

Suppose now that the outcome of the experiment is a red chip, but we do not know from which bowl it was drawn.
Accordingly, we compute the conditional probability that the chip was drawn from bowl ``B_1``, namely ``P(B_1 ∣ R)``.
From the definition of conditional probability and the preceding result, we have

$\begin{align*}
P(B_1 ∣ R) &= \frac{P(B_1 ∩ R)}{P(R)} \\
&= \frac{P(B_1) P(R ∣ B_1)}{P(B_1) P(R ∣ B_1) + P(B_2) P(R ∣ B_2) + P(B_3) P(R ∣ B_3)} \\
&= \frac{(1/3)(2/6)}{(1/3)(2/6) + (1/6)(1/3) + (1/2)(5/9)} \\
&= \frac{2}{8}.
\end{align*}$

Similarly,

$P(B_2 ∣ R) = \frac{P(B_2 ∩ R)}{P(R)} = \frac{(1/6)(1/3)}{4/9} = \frac{1}{8}$

and

$P(B_3 ∣ R) = \frac{P(B_3 ∩ R)}{P(R)} = \frac{(1/2)(5/9)}{4/9} = \frac{5}{8}.$

Note that the conditional probabilities ``P(B_1 ∣ R)``, ``P(B_2 ∣ R)``, and ``P(B_3 ∣ R)`` have changed from the original probabilities ``P(B_1)``, ``P(B_2)``, and ``P(B_3)`` in a way that agrees with your intuition.
Once the red chip has been observed, the probability concerning ``B_3`` seems more favorable than originally because ``B_3`` has a larger percentage of red chips than do ``B_1`` and ``B_2``.
The conditional probabilities of ``B_1`` and ``B_2`` decrease from their original ones once the red chip is observed.
Frequently, the original probabilities are called **prior probabilities** and the conditional probabilities are the **posterior probabilities**.
"""

# ╔═╡ b9a2b325-5aa4-485a-9567-113716b798de
md"""
**Definition.**
We generalize the result of Example 1.5-1.
Let ``B_1, B_2, …, B_m`` constitute a *partition* of the sample space ``S``.
That is,

$S = B_1 ∪ B_2 ∪ ⋯ ∪ B_m \quad\text{ and }\quad B_i ∩ B_j = \varnothing, \, i ≠ j$

Of course, the events ``B_1, B_2, …, B_m`` are mutually exclusive and exhaustive (because the union of the disjoint sets equals the sample space ``S``).
Furthermore, suppose the **prior probability** of the event ``B_i`` is postiive; that is, ``P(B_i) > 0, \, i = 1, …, m``.
If ``A`` is an event, then ``A`` is the union of ``m`` mutually exclusive events, namely,

$A = (B_1 ∩ A) ∪ (B_2 ∩ A) ∪ ⋯ ∪ (B_m ∩ A).$

Thus,

$\begin{align*}
P(A) &= \sum_{i = 1}^m P(B_i ∩ A) \\
&= \sum_{i = 1}^m P(B_i) P(A ∣ B_i), \tag{1.5-1}
\end{align*}$

which is sometimes called the **law of total probability**.
If ``P(A) > 0``, then

$P(B_k ∣ A) = \frac{P(B_k ∩ A)}{P(A)}, \qquad k = 1, 2, …, m. \tag{1.5-2}$
"""

# ╔═╡ 4c7bd922-1ad5-4a0d-9549-948f568161cc
md"""
**Definition.**
Using Equation 1.5-1 and replacing ``P(A)`` in Equation 1.5-2, we have **Bayes' theorem**:

$P(B_k ∣ A) = \frac{P(B_k) P(A ∣ B_k)}{\sum_{i = 1}^m P(B_i) P(A ∣ B_i)}, \, k = 1, 2, …, m.$

The conditional probability ``P(B_k ∣ A)`` is often called the **posterior probability** of ``B_k``.
"""

# ╔═╡ 15f822c9-c562-49ff-921e-6d9d7e8a0d31
md"# Discrete Distributions"

# ╔═╡ cf6b18aa-d363-4374-a94d-54b886bc9414
md"## Random Variables of the Discrete Type"

# ╔═╡ 2c66e416-b3e5-4374-aca7-ce9ca029bc0b
md"""
**Definition 2.1-1.**
Given a random experiment with a sample space ``S``, a function ``X`` that assigns one and only one real number ``X(s) = x`` to each element ``s`` in ``S`` is called a **random variable**.
The **space** of ``X`` is the set of real numbers ``\{x : X(s) = x, s ∈ S\}``, where ``s ∈ S`` means that the element ``s`` belongs to the set ``S``.
"""

# ╔═╡ 8979a2b2-f723-4917-8687-a8e73e896d0b
md"""
**Remark.**
As we give examples of random variables and their probability distributions, the reader will soon recognize that, when observing a random experiment, the experimenter must take some type of measurement (or measurements).
This measurement can be thought of as the outcome of a random variable.
We would simply like to know the probability of a measurement ending in ``A``, a subset of the space of ``X``.
If this is know for all subsets ``A``, then we know the probability distribution of the random variable.
Obviously, in practice, we do not very often know this distribution exactly.
Hence, statisticians make conjectures about these distributions; that is, we construct probabilistic models for random variables.
The ability of a statistician to model a real situation appropriately is a valuable trait.
In this chapter we introduce some probability models in which the spaces of the random variables consist of sets of integers.
"""

# ╔═╡ 71bacdb8-a065-4291-a9e2-c10d0c4ad8ef
md"""
**Definition 2.1-2.**
The pmf (probability mass function) ``f(x)`` of a discrete random variable ``X`` is a function that satisfies the following properties:

(a) ``f(x) > 0, \qquad x ∈ S;``

(b) ``\displaystyle \sum_{x ∈ S} f(x) = 1;``

(c) ``\displaystyle P(X ∈ A) = \sum_{x ∈ A} f(x), \qquad \text{ where } A ⊂ S.``
"""

# ╔═╡ 18148d9e-eac8-45fb-abbd-4c14d4297af2
md"## Mathematical Expectation"

# ╔═╡ da24892d-92f6-4b1a-b176-9458670210ca
md"""
**Definition 2.2-1.**
If ``f(x)`` is the pmf of the random variable ``X`` of the discrete type with space ``S``, and if the summation

$\sum_{x ∈ S} u(x) f(x), \qquad \text{ which is sometimes written } \qquad \sum_S u(x) f(x),$

exists, then the sum is called the **mathematical expectation** or the **expected value** of ``u(X)``, and it is denoted by ``E[u(X)]``.
That is,

$E[u(X)] = \sum_{x ∈ S} u(x) f(x).$
"""

# ╔═╡ 9563adfc-d1ca-4b3a-9290-da91fa685980
md"""
**Theorem 2.2-1.**
When it exists, the mathematical expectation ``E`` satisfies the following properties:

(a) If ``c`` is a constant, then ``E(c) = c``.

(b) If ``c`` is a constant and ``u`` is a function, then

$E(c\,u(X)) = cE[u(X)].$

(c) If ``c_1`` and ``c_2`` are constants and ``u_1`` and ``u_2`` are functions, then

$E[c_1 u_1(X) + c_2 u_2(X)] = c_1 E[u_1(X)] + c_2 E[u_2(X)].$

*Proof.*
First, for the proof of (a), we have

$E(c) = \sum_{x ∈ S} c f(x) = c \sum_{x ∈ S} f(x) = c$

because

$\sum_{x ∈ S} f(x) = 1.$

Next, to prove (b), we see that

$\begin{align*}
E[cu(X)] &= \sum_{x ∈ S} cu(x) f(x) \\
&= c \sum_{x ∈ S} u(x) f(x) \\
&= cE[u(X)].
\end{align*}$

Finally, the proof of (c) is given by

$\begin{align*}
E[c_1 u_1(X) + c_2 u_2(X)] &= \sum_{x ∈ S} [c_1 u_1(x) + c_2 u_2(x)] f(x) \\
&= \sum_{x ∈ S} c_1 u_1(x) f(x) + \sum_{x ∈ S} c_2 u_2(x) f(x).
\end{align*}$

By applying (b), we obtain

$E[c_1 u_1(X) + c_2 u_2(X)] = c_1 E[u_1(X)] + c_2 E[u_2(X)].$
"""

# ╔═╡ 9eb5a49b-4279-42f4-b770-15fbb2e069ef
md"## Special Mathematical Expectations"

# ╔═╡ 3cc52796-4761-45d8-b6c8-01267846a1c3
md"""
**Remark.**
In Section 2.2 we called ``\mu = E(X)`` the mean of the random variable ``X`` (or of its distribution).
In general, suppose the random variable ``X`` has the space ``S = \{u_1, u_2, …, u_k\}`` and these points have respective probabilities ``P(X = u_i) = f(u_i) > 0``, where ``f(x)`` is the pmf.
Of course,

$\sum_{x ∈ S} f(x) = 1$

and the **mean** of the random variable ``X`` (or of its distribution) is

$\mu = \sum_{x ∈ S} xf(x) = u_1 f(u_1) + u_2 f(u_2) + ⋯ + u_k f(u_k).$

That is, in the notation of Section 2.2, ``\mu = E(X)``.
"""

# ╔═╡ 441aa050-2bee-4dff-94b1-661eb7f90082
md"""
**Remark.**
Now, ``u_i`` is the distance of that ``i``th point from the origin.
In mechanics, the product of a distance and its weight is called a moment, so ``u_i f(u_i)`` is a moment having a moment arm of length ``u_i``.
The sum of such products would be the moment of the system of distances and weights.
Actually, it is called the first moment about the origin because the distances are simply to the first power and the lengths of arms (distances) and measuresd from the origin.
However, if we compute the first moment about the mean ``\mu``, then, because here a moment arm equals ``(x - \mu)``, we have

$\begin{align*}
\sum_{x ∈ S}(x - \mu)f(x) &= E[(X - \mu)] - E(X)- E(\mu) \\
&= \mu - \mu = 0.
\end{align*}$

That is, that first moment about ``\mu`` is equal to zero.
In mechanics ``\mu`` is called the centroid.
The last equation implies that if a fulcrum is placed at the centroid ``\mu``, then the system of weights would balance as the sum of the positive moments (when ``x > \mu``) about ``\mu`` equals the sum of the negative moments (when ``x < \mu``).
"""

# ╔═╡ 13dedcd7-173b-4c27-bac8-2e78e10aab4f
md"""
**Definition.**
Let ``r`` be a positive integer.
If

$E(X^r) = \sum_{x ∈ S} x^r f(x)$

is finite, it is called the ``r``th **moment** of the distribution about the origin.
In addition, the expectation

$E[(X - b)^r] = \sum_{x ∈ S} (x - b)^r f(x)$

is called the ``r``th moment of the distribution about ``b``.
"""

# ╔═╡ a38baf4d-134d-4e88-8d4e-af001d969ebe
md"""
**Definition.**
The result

$\gamma = \frac{E[(X - \mu)^3]}{\sigma^3}$

is a unitless (scale-free) quantity called the **index of skewness**.
"""

# ╔═╡ e6eeb08d-83d1-4422-9e1f-fbeef4d4de52
md"""
**Definition 2.3-1.**
Let ``X`` be a random variable of the discrete type with pmf ``f(x)`` and space ``S``.
If there is a positive number ``h`` such that

$E(e^{tX}) = \sum_{x ∈ S} e^{tx} f(x)$

exists and is finite for ``-h < t < h``, then the function defined by

$M(t) = E(e^{tX})$

is called the **moment-generating function of ``X``** (or of the distribution of ``X``).
This function is often abbreviated as mgf.
"""

# ╔═╡ 266dde15-d71a-4838-99ee-7a6447ea1e74
md"## The Binomial Distribution"

# ╔═╡ a0f5e36a-bafe-4b28-a3ed-c5765fbecf05
md"""
**Definition.**
A **Bernoulli experiment**, more commonly called a **Bernoulli trial**, is a random experiment, the outcome of which can be classified in one of two mutually exclusive and exhaustive ways--say, success or failure.
A sequence of **independent Bernoulli trials** occurs when a Bernoulli experiment is performed several *independent* times and the probability of success---say, ``p``---remains the *same* from trial to trial.
That is, in such a sequence we let ``p`` denote the probability of success on each trial.
In addition, we shall frequently let ``q = 1 - p`` denote the probability of failure; that is, we shall use ``q`` and ``1 - p`` interchangeably.
"""

# ╔═╡ 9a26ac27-de2c-4120-a67f-aaeed3c9866e
md"""
**Definition.**
The pmf of a **binomial distribution** is defined as

$f(x) = \begin{pmatrix} n \\ x \end{pmatrix} p^x (1 - p)^{n - x}, \qquad x = 0, 1, 2, …, n$
"""

# ╔═╡ 00f1203c-0553-4e5c-b083-a7c28a07c5f3
md"""
**Remark.**
A binomial experiment satisfies the following properties:

1. A Bernoulli (success--failure) experiment is performed ``n`` times.

2. The trials are independent.

3. The probability of success on each trial is a constant ``p``; the probability of failure is ``q = 1 - p``.

4. The random variable ``X`` equals the number of successes in the ``n`` trials.
"""

# ╔═╡ fd54be4f-050b-4131-9a09-a42acdd3d2ef
md"""
**Notation.**
A binomial distribution will be denoted by the symbol ``b(n,p)``, and we say that the distribution of ``X`` is ``b(n,p)``.
The constants ``n`` and ``p`` are called the **parameters** of the binomial distribution; they correspond to the number ``n`` of independent trials and the probability ``p`` of success on each trial.
Thus, if we say that the distribution of ``X`` is ``b(12, 1/4)``, we mean that ``X`` is the number of successes in a random sample of size ``n = 12`` from a Bernoulli distribution with ``p = 1/4``.
"""

# ╔═╡ a8d07de0-ad5c-48d3-aad1-e954c4c8fa5a
md"## The Hypergeometric Distribution"

# ╔═╡ 61091e25-9b51-4c30-843d-c2234102b206
md"""
**Definition.**
The pmf of a **hypergeometric distribution** is defined as

$f(x) = \frac{\begin{pmatrix} N_1 \\ x \end{pmatrix} \begin{pmatrix} N_2 \\ n - x \end{pmatrix}}{\begin{pmatrix} N \\ n \end{pmatrix}}$
"""

# ╔═╡ 2ccbf7c3-4e48-4a48-a21c-9d69b1088cfd
md"## The Negative Binomial Distribution"

# ╔═╡ 97601cd3-323a-4b82-abdf-0091dc1cffce
md"""
**Definition.**
The pmf of a **negative binomial distribution** is defined as

$g(x) = \begin{pmatrix} x - 1 \\ r - 1 \end{pmatrix} p^r q^{x - r}, \quad x = r, r + 1, …$
"""

# ╔═╡ 108310b0-28de-4514-a030-9259438478b8
md"""
**Definition.**
The **geometric distribution** is defined as

$P(X ≤ k) = 1 - q^k$
"""

# ╔═╡ d3f8736c-4ebe-4400-b8b9-b2e67f4861e7
md"## The Poisson Distribution"

# ╔═╡ d90684b0-40de-4cc5-8811-1825f323bb04
md"""
**Definition 2.7-1.**
Let the number of occurrences of some event in a given continuous interval be counted.
Then we have an **approximate Poisson process** with parameter ``\lambda > 0`` if the following conditions are satisfied:

(a) The numbers of occurrences in nonoverlapping subintervals are independent.

(b) The probability of exactly one occurrence in a sufficiently short subinterval of length ``h`` is approximately ``\lambda h``.

(c) The probability of two or more occurrences in a sufficiently short subinterval is essentially zero.
"""

# ╔═╡ 8f506a76-8228-4c11-8d6d-49e93fa8f5f3
md"""
**Definition.**
The pmf of a **Poisson distribution** is defined as

$f(x) = \frac{\lambda^x e^{-\lambda}}{x!}, \qquad x = 0, 1, 2, …$

where ``\lambda > 0``.
"""

# ╔═╡ ec6c40dc-0837-4ad1-b726-030108cc27d1
md"""
**Definition.**
The mgf of a Poisson distribution is

$M(t) = E(e^{tX}) = \sum_{x = 0}^∞ e^{tx} \frac{\lambda^x e^{-\lambda}}{x!} = e^{-\lambda} \sum_{x = 0}^∞ \frac{(\lambda e^t)^x}{x!} = e^{-\lambda} e^{\lambda e^t} = e^{\lambda (e^t - 1)}$

It's first derivative is

$M'(t) = \lambda e^t e^{\lambda (e^t - 1)}$

It's second derivative is

$M''(t) = (\lambda e^t)^2 e^{\lambda (e^t - 1)} + \lambda e^t e^{\lambda (e^t - 1)}$
"""

# ╔═╡ 884ddbf6-bc5b-4b27-9220-18e914ef289f
md"""
**Definition.**
The mean and variance of a Poisson distribution are, respectively,

$\mu = M'(0) = \lambda$

and

$\sigma^2 = M''(0) - [M'(0)]^2 = (\lambda^2 + \lambda) - \lambda^2 = \lambda$

That is,

$\mu = \sigma^2 = \lambda$
"""

# ╔═╡ 1e045280-10a8-4e16-a5ee-789471c70452
md"**Table III (The Poisson Distribution)**"

# ╔═╡ 63743680-bc86-4bb1-983b-699da0314cc4
# Column corresponds to λ
# Row corresponds to x
let
	xs = 0:12
	λs = 0.1:0.1:4
	[[NaN; xs] [λs'; reduce(hcat, [[cdf(Poisson(λ), x) for x ∈ xs] for λ ∈ λs])]]
end

# ╔═╡ d3cb4108-f538-46b2-9770-4c0ef88ffd32
md"# Continuous Distributions"

# ╔═╡ 89a7104f-7939-4204-bf68-80f633966024
md"""
**Definition.**
A random variable ``X`` is said to be continuous (absolutely continuous) if there is a function ``f_X(x) ≥ 0`` such that

$P(X ∈ B) = ∫_B f_X(x) \,dx$

for all ``B ⊆ ℝ``

``f_X`` is called the probability density function of ``X``.
``f_X`` is the pdf of ``X``.
"""

# ╔═╡ 1a722326-d81e-41e1-afa2-4c682aecd686
md"## Random Variables of the Continuous Type"

# ╔═╡ 95d155dc-9b3c-491a-98fd-10a9f08adbad
md"""
**Definition.**
Let the random variable ``X`` denote the outcome when a point is selected at random from an interval ``[a,b]``, ``-∞ < a < b < ∞``.
If the experiment is performed in a fair manner, it is reasonable to assume that the probability that the point is selected from the interval ``[a,x]``, ``a ≤ x ≤ b``, is ``(x - a) / (b - a)``.
That is, the probability is proportional to the length of the interval, so that the cdf (cumulative distribution function) of ``X`` is

$F(x) = \begin{cases}
0, &x < a, \\
\frac{x - a}{b - a}, & a ≤ x < b, \\
1, &b ≤ x
\end{cases}$

which can be written as

$F(x) = ∫_{-∞}^x f(y) \,dy$

where

$f(x) = \frac{1}{b - a}, \qquad a ≤ x ≤ b,$

and equals zero elsewhere.
That is, ``F'(x) = f(x)``, and we call ``f(x)`` the **probability density function** (pdf) of ``X``.
"""

# ╔═╡ 3e2bc715-fa46-48ab-97b8-8ef1639d4f0f
md"""
**Definition.**
The random variable ``X`` has a **uniform distribution** if its pdf is equal to a constant on its support.
In particular, if the support is the interval ``[a,b]``, then

$f(x) = \frac{1}{b - a}, \qquad a ≤ x ≤ b$

Moreover, we shall say that ``X`` is ``U(a, b)``.
This distribution is also referred to as **rectangular**, because the graph of ``f(x)`` suggests that name.
"""

# ╔═╡ 3e9f68ab-35ae-4db0-af93-3ab002fc9f1e
md"""
**Definition.**
We say that the **probability density function (pdf)** of a random variable ``X`` of the **continuous type**, with space ``S`` that is an interval or union of intervals, is an integrable function ``f(x)`` satisfying the folllowing conditions:

(a) ``f(x) ≥ 0, \qquad x ∈ S``.

(b) ``f_S f(x) \,dx = 1``.

(c) If ``(a, b) ⊆ S``, then the probability of the event ``\{a < X < b\}`` is

$P(a < X < b) = ∫_a^b f(x) \,dx$

The corresponding distribution of probability is said to be of the continuous type.
"""

# ╔═╡ adcdddb0-4950-4eb8-b66d-e29d3ecaa5d2
md"## The Exponential, Gamma, and Chi-Square Distributions"

# ╔═╡ ec091e32-5f39-4dc3-af98-c30ddeea7a42
md"""
**Remark.**
We turn now to a continuous distribution that is related to the Poisson distribution.
When previously observing a process of the (approximate) Poisson type, we counted the number of occurrences in a given interval.
This number was a discrete-type random variable with a Poisson distribution.
But not only is the number of occurrences a random variable; the waiting times between the successive occurrences are also random variables.
However, the latter are of the continuous type because each of them can assume any positive value.
In particular, let ``W`` denote the waiting time until the first occurrence during the observation of a Poisson process in which the mean number of occurrences in the unit interval is ``\lambda``.
Then ``W`` is a continuous-type random variable, and we proceed to find its cdf.
"""

# ╔═╡ 01d1148f-0e81-4754-8bbd-40833864a797
md"""
**Remark.**
Because this waiting time is nonnegative, the cdf ``F(w) = 0``, ``w < 0``.
For ``w ≥ 0``,

$\begin{align*}
F(w) &= P(W ≤ w) = 1 - P(W > w) \\
&= 1 - P(\text{no occurrences in } [0,w]) \\
&= 1 - e^{-\lambda w}
\end{align*}$

because we previously discovered that ``e^{-\lambda w}`` equals the probability of no occurences in an interval of length ``w``.
That is, if the mean number of occurrences per unit interval is ``\lambda``, then the mean number of occurrences in an interval of length ``w`` is proportional to ``w``, and hencei s given by ``\lambda w``.
Thus, when ``w > 0``, the pdf of ``W`` is

$F'(w) = f(w) = \lambda e^{-\lambda w}.$
"""

# ╔═╡ fb8205d9-81bf-4c26-a849-e6affd020401
md"""
**Remark.**
We often let ``\lambda = 1/\theta`` and say that the random variable ``X`` has an **exponential distribution** if its pdf is defined by

$f(x) = \frac{1}{\theta} e^{-x/\theta}, \qquad 0 ≤ x < ∞,$

where the parameter ``\theta > 0``.
Accordingly, the waiting time ``W`` until the first occurrence in a Poisson process has an expoential distribution with ``\theta = 1/\lambda``.
To determine the exact meaning of the parameter ``\theta``, we first find the moment-generating function of ``X``.
It is

$\begin{align*}
M(t) &= ∫_0^∞ e^{tx} \left(\frac{1}{\theta}\right) e^{-x / \theta} \,dx = \lim_{b→∞} ∫_0^b \left(\frac{1}{\theta}\right) e^{-(1 - \theta t) x / \theta} dx \\
&= \lim_{b → ∞} \left[-\frac{e^{-(1 - \theta t) x / \theta}}{1 - \theta t}\right]_0^b = \frac{1}{1 - \theta t}, \qquad t < \frac{1}{\theta}.
\end{align*}$

Thus,

$M(t) = \frac{1}{1 - \theta t}, \qquad t < \frac{1}{\theta}$

$\mu = \theta \qquad \sigma^2 = \theta^2$

$\gamma = 2$
"""

# ╔═╡ a62cd6eb-3b07-45e3-b983-149353ec4816
md"""
**Remark.**
In the (approximate) Poisson process with mean ``\lambda``, we have seen that the waiting time until the first occurrence has an exponential distribution.
We now let ``W`` denote the waiting time until the ``\alpha``th occurrence and find the distribution of ``W``.

The cdf of ``W`` when ``w ≥ 0`` given by

$\begin{align*}
F(w) &= P(W ≤ w) = 1 - P(W > w) \\
&= 1 - P(\text{fewer than } \alpha \text{ occurences in } [0,w]) \\
&= 1 - \sum_{k=0}^{\alpha - 1} \frac{(\lambda w)^k e^{-\lambda w}}{k!}
\end{align*}$

because the number of occurences in the interval ``[0,w]`` has a Poisson distribution with mean ``\lambda w``.
Because ``W`` is a continuous-type random variable, ``F'(w)``, if it exists, is equal to the pdf of ``W``.
"""

# ╔═╡ 12dbe67c-54cc-4ab4-b308-26cb1ee1718b
md"""
**Remark.**
The random variable ``X`` has a **gamma distribution** if its pdf is defined by

$f(x) = \frac{1}{\Gamma(\alpha) \theta^{\alpha}} x^{\alpha - 1} e^{-x / \theta}, \qquad 0 ≤ x < ∞, \quad 0 < \alpha < \infty, \quad 0 < \theta < ∞.$

The moment-generating function of ``X`` is

$M(t) = \frac{1}{(1 - \theta t)^{\alpha}}, \qquad t < 1/\theta.$

The mean and variance are

$\mu = \alpha \theta \qquad\text{and}\qquad \sigma^2 = \alpha \theta^2.$
"""

# ╔═╡ b6ffd5ad-34d2-4241-987d-41e6a237cf82
md"""
**Remark.**
In order to see the effect of the parameters on the shape of the gamma pdf, several combinations of ``\alpha`` and ``\theta`` have been used for graphs that are displayed in Figure 3.2-2.
Note that for a fixed ``\theta``, as ``\alpha`` increases, the probability moves to the right.
The same 
"""

# ╔═╡ f1b4698a-5792-4a35-bb5a-ad54a8bbc0bd
md"## The Normal Distribution"

# ╔═╡ bddadb30-0576-4c14-825f-c01eb42d8772
md"""
**Remark.**
The random variable ``X`` has a **normal distribution** if its pdf is defined by

$f(x) = \frac{1}{\sigma \sqrt{2 \pi}} \exp\left[-\frac{(x - \mu)^2}{2\sigma^2}\right], \qquad -∞ < x < ∞,$

The moment-generating function of ``X`` is

$M(t) = \exp{\left(\mu t + \frac{\sigma^2 t^2}{2}\right)}, \qquad -∞ < t < ∞.$

The mean and variance are

$\mu = \mu \qquad \sigma^2 = \sigma^2$
"""

# ╔═╡ 2fb55aac-b4f0-4444-aeb0-b16fd3bdd9eb
md"## Additional Models"

# ╔═╡ c0440f44-1938-461c-8748-10232739dd6e
md"# Bivariate Distributions"

# ╔═╡ 2157fce2-b092-47d1-b2f9-31a947d7ebca
md"## Bivariate Distributions of the Discrete Type"

# ╔═╡ 7667564a-7978-4a59-b22c-dec90d4690fb
md"""
**Remark.**
So far, we have considered situations in which only one random variable is of interest.
However, in many practical settings it is possible, and desirable, to consider more than one random variable.
Suppose, for example, that we observe the maximum daily temperature, ``x``, and maximum relative humidity, ``y``, on summer days at a particular weather station because we are trying to determine a relationship between these two variables.
For instance, there may be some pattern between temperature ad humidity that can be described by an appropriate curve ``y = u(x)``.
Certainly, not all the points observed will be on this curve, but we want to attempt to find the "best" curve to describe the relationship and then say something about the variation of the points around the curve.
"""

# ╔═╡ d9c3b398-99b4-4cd9-be2d-955a510eb7d0
md"""
**Definition 4.1-1**
Let ``X`` and ``Y`` be two random variables defined on a discrete sample space.
Let ``S`` deneote the corresponding two-dimensional space of ``X`` and ``Y``, the two random variables of the discrete type.
The probability that ``X = x`` and ``Y = y`` is denoted by ``f(x, y) = P(X = x, Y = y)``.
The function ``f(x,y)`` is called the **joint probability mass function** (joint pmf) of ``X`` and ``Y`` and has the following properties:

(a) ``0 ≤ f(x,y) ≤ 1``.

(b) ``\underset{(x, y) ∈ S}{\sum \sum} f(x,y) = 1``.

(c) ``P[(X,y) ∈ A] = \underset{(x,y) ∈ A}{\sum \sum} f(x,y)``, where ``A`` is a subset of the space ``S``.
"""

# ╔═╡ e8b9ecbf-4fe5-4d60-93d3-26a4fb57fb7a
md"""
**Definition 4.1-2**
Let ``X`` and ``Y`` have the joint probability mass function ``f(x,y)`` with space ``S``.
The probability mass function of ``X`` alone, which is called the **marginal probability mass function of ``X``**, is defined by

$f_X(x) = \sum_y f(x,y) = P(X = x), \qquad x ∈ S_X,$

where the summation is taken over all possible ``y`` values for each given ``x`` in the ``x`` space ``S_X``.
That is, the summation is over all ``(x,y)`` in ``S`` with a given ``x`` value.
Similarly, the **marginal probability mass function of ``Y``** is defined by

$f_Y(y) = \sum_x f(x,y) = P(Y = y), \qquad y ∈ S_Y,$

where the summation is taken over all possible ``x`` values for each given ``y`` in the ``y`` space ``S_Y``.
The random variables ``X`` and ``Y`` are **independent** if and only if

$P(X = x, Y = y) = P(X = x) P(Y = y)$

or, equivalently,

$f(x,y) = f_X(x) f_Y(y), \qquad x ∈ S_x, \qquad y ∈ S_Y;$

otherwise, ``X`` and ``Y`` are said to be **dependent**.
"""

# ╔═╡ d2d02acc-bdf7-4b54-98c5-39437d864c7c
md"## The Correlation Coefficient"

# ╔═╡ 332dc70f-7263-479e-89a8-3cc3f23de326
md"""
**Remark.**
In Section 4.1, we introduced the mathematical expectation of a function of two random variables---say, ``X,Y``.
We gave the respective special names of the mean and variance of ``X`` and ``Y`` to

$\mu_X = E(X); \,\mu_Y = E(Y) \qquad\text{and}\qquad \sigma_X^2 = E[(X - \mu_X)^2]; \, \sigma_Y^2 = E[(Y - \mu_Y)^2]$

Now we introduce two more special names:

(a) If ``u(X,Y) = (X - \mu_X)(Y - \mu_Y)``, then

$E[u(X,Y)] = E[(X - \mu_X)(Y - \mu_Y)] = \sigma_{XY} = \text{Cov}(X,Y)$

is called the **covariance** of ``X`` and ``Y``.

(b) If the standard deviations ``\sigma_X`` and ``\sigma_Y`` are positive, then

$\rho = \frac{\text{Cov}(X,Y)}{\sigma_X \sigma_Y} = \frac{\sigma_{XY}}{\sigma_X \sigma_Y}$

is called the **correlation coefficient** of ``X`` and ``Y``.
"""

# ╔═╡ 72724aa0-e5b1-4352-8843-66ba11544848
md"""
**Remark.**
The covariance of ``X`` and ``Y`` can be written as

$\text{Cov}(X,Y) = E(XY) - \mu_X \mu_Y$
"""

# ╔═╡ cfa859bb-492d-48a9-ab64-a37f65992529
md"""
**Remark.**
The expectation of the product ``XY`` can be written as

$E(XY) = \mu_X \mu_Y + \rho \sigma_X \sigma_Y$

That is, the expected value of the product of two random variables is equal to the product ``\mu_X \mu_Y`` of their expectations, plus their covariance ``\rho \sigma_X \sigma_Y``.
"""

# ╔═╡ d8f0a6ad-9534-4b52-9728-46a62d957919
md"""
**Example 4.2-1**
"""

# ╔═╡ 27e87a01-6639-4c3c-83d2-0311b776e8e3
let
	# Let X and Y have the joint pmf
	f(x,y) = (x + 2y) // 18
	X = 1:2
	Y = 1:2

	# The marginal probability mass functions are, respectively,
	fX(x) = x ∈ X ? sum([f(x,y) for y ∈ Y]) : 0
	fY(y) = y ∈ Y ? sum([f(x,y) for x ∈ X]) : 0

	# Because f(x,y) ≠ f_X(x) f_Y(y), X and Y are dependent.
	
	# The mean, variance, and standard deviation of X are, respectively
	μX = sum([x * fX(x) for x ∈ X])
	σ²X = sum([x^2 * fX(x) for x ∈ X]) - μX^2
	σX = sqrt(σ²X)
	
	# The mean, variance, and standard deviation of Y are, respectively
	μY = sum([y * fY(y) for y ∈ Y])
	σ²Y = sum([y^2 * fY(y) for y ∈ Y]) - μY^2
	σY = sqrt(σ²Y)

	# The covariance of X and Y is
	Cov(X,Y) = sum([x*y * f(x,y) for x ∈ X for y ∈ Y]) - μX * μY
	Cov(X,Y)

	# Hence, the correlation coefficient is
	ρ = Cov(X,Y) / (σX * σY)
	:ρ => ρ
end

# ╔═╡ ead20df3-851d-40a5-bcf8-805802ac276b
md"""
**Remark.**
Insight into the correlation coefficient ``\rho`` of two discrete random variables ``X`` and ``Y`` may be gained by thoughtfully examining the definition of ``\rho``, namely,

$\rho = \frac{\sum_x \sum_y (x - \mu_X)(y - \mu_Y) f(x,y)}{\sigma_X \sigma_Y}$

where ``\mu_X``, ``\mu_Y``, ``\sigma_X``, and ``\sigma_Y`` denote the respective means and standard deviations.
If positive probabilities are assigned to pairs ``(x,y)`` in which both ``x`` and ``y`` are either simultaneously above or simultaneously below their respective means, then the corresponding terms in the summation that defines ``\rho`` are positive because both factors ``(x - \mu_X)`` and ``(y - \mu_Y)`` will be positive or both will be negative.
If, on the one hand, pairs ``(x,y)``, which yield large positive products ``(x - \mu_X)(y - \mu_Y)``, contain most of the probability of the distribution, then the correlation coefficient will tend to be positive.
If, on the other hand, the points ``(x,y)``, in which one component is below its mean and the other is above its mean, have most of the probability, then the correlation coefficient will tend to be negative because the products ``(x - \mu_X)(y - \mu_Y)`` having higher probabilities are negative.
(See Exercise 4.2-4).
This interpretation of the sign of the correlation coefficient play an important role in subsequent work.
"""

# ╔═╡ ad32ac6f-b606-4a3c-9922-4da0e920aa2f
md"""
**Remark.**
To gain additional insight into the meaning of the correlation coefficient ``\rho``, consider the following problem: Think of the points ``(x,y)`` in the sample space ``S`` and their corresponding probabilities.
Consider all possible lines in two-dimensional space, each with finite slope, that pass through the point associated with the means, namely, ``(\mu_X, \mu_Y)``.
These lines are of the form ``y - \mu_Y = b(x - \mu_X)`` or, equivalently, ``y = \mu_Y + b(x - \mu_X)``.
For each point in ``S``---say, ``(x_0, y_0)``, so that ``f(x_0, y_0) > 0``---consider the vertical distance from that point to one of the aforesaid lines.
Because ``y_0`` is the height of the point above the ``x``-axis and ``\mu_Y + b(x_0 - \mu_X)`` is the height of the point on the line that is directly above or below the point ``(x_0, y_0)``, the absolute value of the difference of these two heights is the vertical distance from the point ``(x_0, y_0)`` to the line ``y = \mu_Y + b(x - \mu_X)``.
That is, the required distance is ``[y_0 - \mu_Y - b(x_0 - \mu_X)]``.
Let us now square this distance and take the weighted average of all such squares; in other words, let us consider the mathematical expectation

$E\{[(Y - \mu_Y) - b(X - \mu_X)]^2\} = K(b).$

The problem is to find that line (or that ``b``) which minimizes this expectation of the square ``[Y - \mu_Y - b(X - \mu_X)]^2``.
This is an application of the principle of least squares, and the line is sometimes called the least squares regression line.
"""

# ╔═╡ b438c46f-5e42-4697-89f9-73fbfe125401
md"""
**Remark.**
The solution of this problem is very easy because

$\begin{align*}
K(b) &= E[(Y - \mu_Y)^2 - 2b(X - \mu_X)(Y - \mu_Y) + b^2 (X - \mu_X)^2] \\
&= {\sigma_Y}^2 - 2b \rho \sigma_X \sigma_Y + b^2 {\sigma_X}^2,
\end{align*}$

because ``E`` is a linear operator and ``E[(X - \mu_X)(Y - \mu_Y)] = \rho \sigma_X \sigma_Y``.
Accordingly, the derivative

$K'(b) = -2\rho \sigma_X \sigma_Y + 2b {\sigma_X}^2$

equals zero at ``b = \rho \sigma_Y / \sigma_X``, and we see that ``K(b)`` obtains its minimum for that ``b`` because ``K''(b) = 2{\sigma_X}^2 > 0``.
Consequently, the **least squares regression line** (the line of the given form that is the best fit in the foregoing sense) is

$y = \mu_Y + \rho \frac{\sigma_Y}{\sigma_X} (x - \mu_X).$

Of course, if ``\rho > 0``, the slope of the line is positive; but if ``\rho < 0``, the slope is negative.
"""

# ╔═╡ d3bd860f-1dc7-4fc4-a359-ab97e805b492
md"""
**Remark.**
It is also instructive to note the value of the minimum of

$K(b) = E\{[(Y - \mu_Y) - b(X - \mu_X)]^2\} = {\sigma_Y}^2 - 2b \rho \sigma_X \sigma_Y + b^2 {\sigma_X}^2.$

It is

$\begin{align*}
K\left(\rho \frac{\sigma_Y}{\sigma_X}\right) &= {\sigma_Y}^2 - 2\rho \frac{\sigma_Y}{\sigma_X} \rho \sigma_X \sigma_Y + \left(\rho \frac{\sigma_Y}{\sigma_X}\right)^2 {\sigma_X}^2 \\
&= {\sigma_Y}^2 - 2\rho^2 {\sigma_Y}^2 + \rho^2 {\sigma_Y}^2 \\
&= {\sigma_Y}^2 (1 - \rho^2).
\end{align*}$

Because ``K(b)`` is the expected value of a square, it must be nonnegative for all ``b``, and we see that ``{\sigma_Y}^2 (1 - \rho^2) ≥ 0``; that is, ``\rho^2 ≤ 1``, and hence ``-1 ≤ \rho ≤ 1``, which is an important property of the correlation coefficient ``\rho``.
On the one hand, if ``\rho = 0``, then ``K(\rho \sigma_Y / \sigma_X) = {\sigma_Y}^2``; on the other hand, if ``\rho`` is close to ``1`` or ``-1``, then ``K(\rho \sigma_Y / \sigma_X)`` is relatively small.
That is, the vertical deviations of the points with positive probability from the line ``y = \mu_Y + \rho(\sigma_Y / \sigma_X)(x - \mu_X)`` are small if ``\rho`` is close to ``1`` or ``-1`` because ``K(\rho \sigma_Y / \sigma_X)`` is the expectation of the square of those deviations.
Thus, ``\rho`` measures, in this sense, the amount of **linearity** in the probability distribution.
As a matter of fact, in the discrete case, all of the points of positive probability lie on this straight line if and only if ``\rho`` is equal to ``1`` or ``-1``.
"""

# ╔═╡ b6784c09-8c0f-4dd7-bd2c-16879a59da43
md"""
**Example 4.2-2**
"""

# ╔═╡ 253f2b08-e242-45fa-9f23-4b30fb30c66b
let
	# Let X equal the number of ones
	# and Y equal the number of twos and threes
	# when a pair of fair of four-sided dice is rolled.

	# Then X and Y have a trinomial distribution with joint pmf
	f(x,y) = if x ≥ 0 && y ≥ 0 && x + y ≤ 2
		(factorial(2) / (factorial(x) * factorial(y) * factorial(2 - x - y))) * (1/4)^x * (2/4)^y * (1/4)^(2 - x - y)
	else
		0
	end

	# We have the sample space
	D = 1:6
	S0 = [(r1,r2) for r1 ∈ D for r2 ∈ D]
	S = [(x,y) for (x,y) ∈ S0 if x ∈ (1) || y ∈ (2,3)]
	
	X = countmap([x ≤ 2 ? x : 0 for (x,y) ∈ S])
	Y = countmap([y ≤ 2 ? y : 0 for (x,y) ∈ S])
	
	# The marginal pmf of X and Y are, respectively
	fX(x) = sum([x * f(x,y) for y ∈ keys(Y)])
	fY(y) = sum([y * f(x,y) for x ∈ keys(X)])

	μX = sum([x * fX(x) for x ∈ keys(X)])
	σ²X = sum([x^2 * fX(x) for x ∈ keys(X)]) - μX^2
	σX = sqrt(σ²X)

	μY = sum([y * fY(y) for y ∈ keys(Y)])
	σ²Y = sum([y^2 * fY(y) for y ∈ keys(Y)]) - μY^2
	σY = sqrt(σ²Y)

	Cov(X,Y) = sum([x * y * f(x,y) for x ∈ keys(X) for y ∈ keys(Y)]) - μX * μY
	Cov(X,Y)

	ρ = Cov(X,Y) / (σX * σY)
	:ρ => ρ
end

# ╔═╡ 3e853a2e-a041-49ba-93e2-d04d00534059
md"## Conditional Distributions"

# ╔═╡ ed999075-ae21-4844-8cc8-5f07c48ad0ad
md"""
**Remark.**
Let ``X`` and ``Y`` have a joint discrete distribution with pmf ``f(x,y)`` on space ``S``.
Say the marginal probability mass functions are ``f_X(x)`` and ``f_Y(y)`` with spaces ``S_X`` and ``S_Y``, respectively.
Let event ``A = \{X = x\}`` and event ``B = \{Y = y\}``, ``(x, y) ∈ S``.
Thus, ``A ∩ B = \{X = x, Y = y\}``.
Because

$P(A ∩ B) = P(X = x, Y = y) = f(x,y)$

and

$P(B) = P(Y = y) = f_Y(y) > 0 \qquad \text{(because } y ∈ S_Y\text{),}$

the conditional probability of event ``A`` given event ``B`` is

$P(A ∣ B) = \frac{P(A ∩ B)}{P(B)} = \frac{f(x,y)}{f_Y(y)}.$

This formula leads to the following definition.
"""

# ╔═╡ 6b9a82ab-b1b1-4261-a708-67b299c0201b
md"""
**Definition 4.3-1**
The **conditional probability mass function of ``X``**, given that ``Y = y``, is defined by

$g(x | y) = \frac{f(x,y)}{f_Y(y)}, \qquad \text{provided that } f_Y(y) > 0$

Similarly, the **conditional probability mass function of ``Y``**, given that ``X = x``, is defined by

$h(y | x) = \frac{f(x,y)}{f_X(x)}, \qquad \text{provided that } f_X(x) > 0$
"""

# ╔═╡ 3dc17679-def0-45fe-864d-5f1e2afd3318
md"""
**Example 4.3-1**
"""

# ╔═╡ 56c60823-8f76-4e05-b8e5-dba43de53965
let
	# Let X and Y have the joint pmf
	f(x,y) = if x ∈ (1,2,3) && y ∈ (1,2)
		(x + y) // 21
	else
		0
	end

	# In Example 4.1-2, we showed that
	fX(x) = if x ∈ (1,2,3)
		(2x + 3) // 21
	else
		0
	end
	
	fY(y) = if y ∈ (1,2)
		(3y + 6) // 21
	else
		0
	end
	
	# Thus, the conditional pmf of X, given that Y = y, is equal to
	g(x,y) = if x ∈ (1,2,3) && y ∈ (1,2)
		f(x,y) // fY(y)
	else
		0
	end

	# For example,
	g(2,2)

	# Similarly, the conditional pmf of Y, given that X = x, is equal to
	h(y,x) = if y ∈ (1,2) && x ∈ (1,2,3)
		f(x,y) // fX(x)
	else
		0
	end

	# The joint pmf f(x,y) is depicted in Figure 4.3-1(a)
	# along with the marginal pmfs.
	
	# Now, if y = 2, we would expect the outcomes of
	# x---namely, 1, 2, and 3---to occur in the ratio 3:4:5.

	# This is precisely what g(x|y) does:

	g(1,2), g(2,2), g(3,2)

	# Figure 4.3-1(b) displays g(x|1) and g(x|2),
	# while Figure 4.3-1(c) gives h(y|1), h(y|2), and h(y|3).

	# Compare the probabilities in Figure 4.3-1(c) with those in Figure 4.3-1(a).
	# They should agree with your intuition as well as with the formula for h(y|x).
end

# ╔═╡ 50010456-fd50-4694-9626-043e14a36b26
md"""
**Remark.**
Note that ``0 ≤ h(y ∣ x)``.
If we sum ``h(y ∣ x)`` over ``y`` for that fixed ``x``, we obtain

$\sum_y h(y ∣ x) = \sum_y \frac{f(x,y)}{f_X(x)} = \frac{f_X(x)}{f_X(x)} = 1.$

Thus, ``h(y ∣ x)`` satisfies the conditions of a probability mass function, and we can compute conditional probabilities such as

$P(a < Y < b ∣ X = x) = \sum_{\{y:a < y < b\}} h(y ∣ x)$

and conditional expectations such as

$E[u(Y) ∣ X = x] = \sum_y u(y) h(y ∣ x)$

in a manner similar to those associated with unconditional probabilities and expectations.
"""

# ╔═╡ 7a2c151c-093c-4c3a-a56d-49ae3bd6bd7b
md"""
**Remark.**
Two special conditional expectations are the **conditional mean** of ``Y``, given that ``X = x``, defined by

$\mu_{Y ∣ x} = E(Y ∣ x) = \sum_y y \,h(y ∣ x)$

and the **conditional variance** of ``Y``, given that ``X = x``, defined by

$\sigma_{Y ∣ x}^2 = \text{Var}(Y ∣ x) = E\{[Y - E(Y ∣ x)]^2\} = \sum_y [y - E(Y ∣ x)]^2 h(y ∣ x)$

which can be computed with

$\sigma_{Y ∣ x}^2 = E(Y^2 ∣ x) - [E(Y ∣ x)]^2$

The conditional mean ``\mu_{X ∣ y}`` and the conditional variance ``\sigma_{X ∣ y}^2`` are given by similar expressions.
"""

# ╔═╡ 4e942931-d05a-49fe-83ba-5b118167a593
md"""
**Example 4.3-2**
"""

# ╔═╡ 73a501d5-7e9f-48dc-95c3-2649cff638ea
let
	# From Example 4.3-1
	f(x,y) = x ∈ (1,2,3) && y ∈ (1,2) ? (x + y) // 21 : 0
	fX(x) = x ∈ (1,2,3) ? (2x + 3) // 21 : 0
	fY(y) = y ∈ (1,2) ? (3y + 6) // 21 : 0
	g(x,y) = x ∈ (1,2,3) && y ∈ (1,2) ? f(x,y) // fY(y) : 0
	h(y,x) = y ∈ (1,2) && x ∈ (1,2,3) ? f(x,y) // fX(x) : 0

	# We can use the background of Example 4.3-1 and compute
	# μ_{Y|x} and σ²_{Y|x} when x = 3:

	:μ => sum([y * h(y,3) for y ∈ 1:2]),
	:σ² => sum([(y - 14//9)^2 * (3 + y) // 9 for y ∈ 1:2])
end

# ╔═╡ 5ee333b3-f382-4fdf-9b79-b21e6345f97e
md"""
**Remark.**
The conditional mean of ``X``, given that ``Y = y``, is a function of ``y`` alone; the conditional mean of ``Y``, given that ``X = x``, is a function of ``x`` alone.
Suppose that the latter conditional mean is a linear function of ``x``; that is, ``E(Y ∣ x) = a + bx``.
Let us find the constants ``a`` and ``b`` in terms of characteristics ``\mu_X``, ``\mu_Y``, ``{\sigma_X}^2``, ``{\sigma_Y}^2``, and ``\rho``.
This development will shed additional light on the correlation coefficient ``\rho``; accordingly, we assume that the respective standard deviations ``\sigma_X`` and ``\sigma_Y`` are both positive, so that the correlation coefficient will exist.
"""

# ╔═╡ ca4c127a-79a1-43d1-ac6c-61562cf05ad5
md"""
**Remark.**
It is given that

$\sum_y y h(y ∣ x) = \sum_y y \frac{f(x,y)}{f_X(x)} = a + bx, \qquad \text{for } x ∈ S_X,$

where ``S_X`` is the space of ``X``.
Hence,

$\sum_y y f(x,y) = (a + bx) f_X(x), \qquad \text{for } x ∈ S_X, \tag{\small{4.3-1}}$

and

$\sum_{x ∈ S_X} \sum_y y f(x,y) = \sum_{x ∈ S_X} (a + bx) f_X(x).$

That is, with ``\mu_X`` and ``\mu_Y`` representing the respective means, we have

$\mu_Y = a + b \mu_X. \tag{\small{4.3-2}}$

In addition, if we multiply both members of Equation 4.3-1 by ``x`` and sum the resulting products, we obtain

$\sum_{x ∈ S_X} \sum_y xy f(x,y) = \sum_{x ∈ S_X} (ax + bx^2) f_X(x).$

That is,

$E(XY) = aE(X) + bE(X^2)$

or, equivalently,

$\mu_X \mu_Y + \rho \sigma_X \sigma_Y = a \mu_X + b({\mu_X}^2 + {\sigma_X}^2). \tag{\small{4.3-3}}$

The solution of Equations 4.3-2 and 4.3-3 is

$a = \mu_Y - \rho \frac{\sigma_Y}{\sigma_X} \mu_X \qquad\text{and}\qquad b = \rho \frac{\sigma_Y}{\sigma_X},$

which implies that if ``E(Y ∣ x)`` is linear, it is given by

$E(Y ∣ x) = \mu_Y + \rho \frac{\sigma_Y}{\sigma_X} (x - \mu_X).$

So if the conditional mean of ``Y``, given that ``X = x``, is linear, it is exactly the same as the best-fitting line (least squares regression line) considered in Section 4.2.
"""

# ╔═╡ 673138a2-ec3a-4d02-a593-0e16d21a6a14
md"""
**Remark.**
By symmetry, if the conditional mean of ``X``, given that ``Y = y``, is linear, then

$E(X ∣ y) = \mu_X + \rho \frac{\sigma_X}{\sigma_Y} (y - \mu_Y).$
"""

# ╔═╡ 760cd44b-f2db-4a81-97df-39d5221dbf4b
md"""
**Remark.**
We see that the point ``[x = \mu_X, E(Y ∣ x) = \mu_Y]`` satisfies the expression for ``E(Y ∣ x)`` and ``[E(X ∣ y) = \mu_X, y = \mu_Y]`` satisfies the expression for ``E(X ∣ y)``.
That is, the point ``(\mu_X, \mu_Y)`` is on each of the two lines.
In addition, we note that the product of the coefficient of ``x`` in ``E(Y ∣ x)`` and the coefficient of ``y`` in ``E(X ∣ y)`` equals ``\rho^2`` and the ratio of these two coefficients equals ``{\sigma_Y}^2 / {\sigma_X}^2``.
These observations sometimes prove useful in particular problems.
"""

# ╔═╡ b5cd0d95-3898-451a-94e2-03eac9299cb6
md"""
**Example 4.3-3**
Let ``X`` and ``Y`` have the trinomial pmf with parameters ``n``, ``p_X``, ``p_Y``, and ``1 - p_X - p_Y = p_Z``.
That is,

$f(x,y) = \frac{n!}{x! y! (n - x - y)!} {p_X}^x {p_Y}^y {p_Z}^{n - x - y},$

where ``x`` and ``y`` are nonnegative integers such that ``x + y ≤ n``.
From the development of the trinomial distribution, we note that ``X`` and ``Y`` have marginal binomial distributions ``b(n,p_X)`` and ``b(n,p_Y)``, respectively.
Thus,

$h(y ∣ x) = \frac{f(x,y)}{f_X(x)} = \frac{(n-x)!}{y!(n - x - y)!} \left(\frac{p_Y}{1 - p_X}\right) \left(\frac{p_Z}{1 - p_X}\right)^{n - x - y}$

$y = 0, 1, 2, …, n - x.$

That is, the conditional pmf of ``Y``, given that ``X = x``, is binomial, or

$b\left[n - x, \frac{p_Y}{1 - p_X}\right],$

and thus has conditional mean

$E(Y ∣ x) = (n - x) \frac{p_Y}{1 - p_X}.$

In a similar manner, we obtain

$E(X ∣ y) = (n - y) \frac{p_X}{1 - p_Y}.$

Because each of the conditional means is linear, the product of the respective coefficients of ``x`` and ``y`` is

$\rho^2 = \left(\frac{-p_Y}{1 - p_X}\right) \left(\frac{-p_X}{1 - p_Y}\right) = \frac{p_X p_Y}{(1 - p_X)(1 - p_Y)}.$

However, ``\rho`` must be negative because the coefficients of ``x`` and ``y`` are negative; thus,

$\rho = -\sqrt{\frac{p_X p_Y}{(1 - p_X)(1 - p_Y)}}.$
"""

# ╔═╡ efffb44d-efee-4bef-a112-d4ce15ab7963
md"""
**Example 4.3-4**
Let ``X`` and ``Y`` have a trinomial distribution with ``p_X = 1/3``, ``p_Y = 1/3``, and ``n = 5``.
Using a result from the last example, we find that the conditional distribution of ``Y``, given that ``X = x``, is ``b(5 - x, (1/3) / (1 - 1/3))``, or ``b(5 - x, 1/2)``.
The pmfs, ``h(y ∣ x)`` for ``x = 0, 1, …, 5`` are plotted in Figure 4.3-2(a).
Note that the orientation of the axes was selected so that the shapes of these pmfs can be seen.
Similarly, the conditional distribution of ``X``, given that ``Y = y``, is ``b(5 - y, 1/2)``.
The pmfs, ``g(x ∣ y)`` for ``y = 0, 1, …, 5`` are shown in Figure 4.3-2(b).
"""

# ╔═╡ 080a633d-d5ac-4a3d-b945-2b591848b060
md"""
**Remark.**
To this point in our development, we have defined the conditional mean, ``E(Y ∣ x)``, as a function of the observed value ``x``.
It is possible to extend the notion of a conditional mean to a random variable by imagining its value *before ``X`` is observed*.
That is, we define ``E(Y ∣ X)`` as a random variable (of discrete type) that takes on the values ``E(Y ∣ x)``, for ``x ∈ S_X``, with probabilities given by the marginal pmf of ``X``.
To illustrate, consider once again the random variables ``X`` and ``Y`` of Example 4.3-1.
From the conditional pmfs of ``Y`` displayed in Figure 4.3-1(c), we have

$\begin{align*}
E(Y ∣ 1) &= \sum_{y = 1}^2 y \,h(y ∣ 1) = (1)(2/5) + (2)(3/5) = 8/5. \\
E(Y ∣ 2) &= \sum_{y = 1}^2 y \,h(y ∣ 2) = (1)(3/7) + (2)(4/7) = 11/7. \\
E(Y ∣ 3) &= \sum_{y = 1}^2 y \,h(y ∣ 3) = (1)(4/9) + (2)(5/9) = 14/9.
\end{align*}$

Then ``E(Y ∣ X)`` is the random variable that takes on the values ``8/5``, ``11/7``, and ``14/9`` with probabilities ``5/21``, ``7/21``, and ``9/21``, respectively.
"""

# ╔═╡ dc32a4b6-cc97-4f22-8597-95bbda720ef1
md"""
**Remark.**
Because ``E(Y ∣ X)`` is a random variable, its expectation may exist.
Computing the expectation of ``E(Y ∣ X)`` for this example, we obtain

$\begin{align*}
E[E(Y ∣ X)] &= \sum_{x=1}^3 E(Y ∣ x) f_X(x) \\
&= (8/5)(5/21) + (11/7)(7/21) + (14/9)(9/21) = 33/21.
\end{align*}$

Note, interestingly, that this value coincides with

$E(Y) = \sum_{y=1}^2 y f_Y(y) = (1)(9/21) + (2)(12/21) = 33/21.$

This "coincidence" actually illustrates a more general result, known as the **Law of Total Probability for Expectation**, which we now state and prove.
"""

# ╔═╡ 2b8628af-356c-4e94-b067-418f7f568a75
md"""
**Theorem 4.3-1**
Let ``X`` and ``Y`` be random variables of discrete type such that ``E(Y)`` exists.
Then ``E[E(Y | X)] = E(Y)``.

*Proof.*

$\begin{align*}
E[E(Y ∣ X)] &= \sum_{S_X} \left[\sum_{S_X} y \,h(y ∣ x)\right] f_X(x) \\
&= \sum_{S_X} \sum_{S_Y} \left[y \frac{f(x,y)}{f_X(x)}\right] f_X(x) \\
&= \sum_{S_Y} \sum_{S_X} y f(x,y) \\
&= \sum_{S_Y} y \sum_{S_X} f(x,y) \\
&= \sum_{S_X} y f_Y(y) \\
&= E(Y)
\end{align*}$
"""

# ╔═╡ e385e0a2-e576-4054-9803-5abfcc2384b5
md"""
**Remark.**
In a similar manner, the notion of conditional variance may be extended to a random variable.
That is, we may define ``\text{Var}(Y ∣ X)`` as the random variable that takes on the values ``\text{Var}(Y ∣ x)``, for ``x ∈ S_Y``, with probabilities given by the marginal pmf of ``X``.
For the same random variables ``X`` and ``Y`` used to illustrate ``E(Y ∣ X)`` above, we have

$\begin{align*}
\text{Var}(Y ∣ 1) &= \sum_{y=1}^2 y^2 h(y ∣ 1) - [E(Y ∣ 1)]^2 = 6/25, \\
\text{Var}(Y ∣ 2) &= \sum_{y=1}^2 y^2 h(y ∣ 2) - [E(Y ∣ 2)]^2 = 12/49, \\
\text{Var}(Y ∣ 3) &= \sum_{y=1}^2 y^2 h(y ∣ 3) - [E(Y ∣ 3)]^2 = 20/81.
\end{align*}$
"""

# ╔═╡ 3cd28a93-18fd-45b1-93ce-e8a40841ae9f
md"""
**Remark.**
The following theorem, called the **Law of Total Probability for Variances**, gives a useful result relation the expectation of the conditional variance and the variance of the conditional mean to the marginal variance.
"""

# ╔═╡ 4fb1973a-4778-4307-98ef-bbcfc656c194
md"""
**Theorem 4.3-2**
If ``X`` and ``Y`` are random variables of discrete type, then

$E[\text{Var}(Y | X)] + \text{Var}[E(Y | X)] = \text{Var}(Y)$

provided that all of the expectations and variances exist.

*Proof.*
Using the linearity of mathematical expectation and the Law of Total Probability for Expectation, we have

$\begin{align*}
E[\text{Var}(Y ∣ X)] &= E\{E(Y^2 ∣ X) - [E(Y ∣ X)]^2\} \\
&= E[E(Y^2 ∣ X)] - E\{[E(Y ∣ X)]^2\} \\
&= E(Y^2) - E\{[E(Y∣X)]^2\} \tag{\small{4.3-4}}.
\end{align*}$

By the same token, we have

$\begin{align*}
\text{Var}[E(Y ∣ X)] &= E\{[E(Y ∣ X)]^2\} - \{E[E(Y ∣ X)]\}^2 \\
&= E\{[E(Y ∣ X)]^2\} - [E(Y)]^2 \tag{\small{4.3-5}}.
\end{align*}$

Adding Equations 4.3-4 and 4.3-5, we find that

$E[\text{Var}(Y ∣ X)] + \text{Var}[E(Y ∣ X)] = E(Y^2) - [E(Y)]^2 = \text{Var}(Y).$
"""

# ╔═╡ bae286da-9b75-4088-a18a-d926202c2102
md"""
**Example 4.3-5**
Let ``X`` have a Poisson distribution with mean 4, and let ``Y`` be a random variable whose conditional distribution, given that ``X = x``, is binomial with sample size ``n = x + 1`` and probability of success ``p``.
Then, ``E(Y ∣ X) = (X + 1)p``, so

$E(Y) = E[E(Y ∣ X)] = E[(X + 1)p] = [E(X) + 1]p = (4 + 1)p = 5p.$

Furthermore, ``\text{Var}(Y ∣ X) = (X + 1)p(1 - p)``, so

$\begin{align*}
\text{Var}(Y) &= \text{Var}[E(Y ∣ X)] + E[\text{Var}(Y ∣ X)] \\
&= \text{Var}[(X + 1)p] + E[(X + 1)p(1 - p)] \\
&= p^2 \text{Var}(X) + [E(X) + 1]p(1 - p) \\
&= 4p^2 + 5p(1 - p) \\
&= 5p - p^2.
\end{align*}$
"""

# ╔═╡ a0fd8c71-2e6e-4c99-ba9a-8ba214dfb97c
md"## Bivariate Distributions of the Continuous Type"

# ╔═╡ ab33c0c8-067e-4fc6-9dc5-2409bca1b7fa
md"""
**Remark.**
The idea of a joint distribution of two random variables of the discrete type can be extended to that of two random variables of the continuous type.
The definitions are really the same except that integrals replace summations.
The **joint probability density function** (joint pdf) of two continuous-type random variables is an integrable function ``f(x,y)`` with the following properties:

(a) ``f(x,y) ≥ 0``, where ``f(x,y) = 0`` when ``(x,y)`` is not in the support (space) ``S`` of ``X`` and ``Y``

(b) ``\displaystyle ∫_{-∞}^∞ ∫_{-∞}^∞ f(x,y) \,dx \,dy = 1.``

(c) ``\displaystyle P[(X,Y) ∈ A] = ∬_A f(x,y) \,dx \,dy``, where ``\{(X,Y) ∈ A\}`` is an event defined in the plane.
"""

# ╔═╡ acb9d239-0cef-450a-bb5c-01f75270b575
md"""
**Remark.**
Property (c) implies that ``P[(X,Y) ∈ A]`` is the volume of the solid over the region ``A`` in the ``xy``-plane and bounded by the surface ``z = f(x,y)``.
"""

# ╔═╡ e5efe8d4-8502-47fa-b8d8-05c1a0d0bdef
md"""
**Remark.**
The respective **marginal pdfs** of continuous-type random variables ``X`` and ``Y`` are given by

$f_X(x) = ∫_{-∞}^∞ f(x, y) \,dy, \qquad x ∈ S_X,$

and

$f_Y(y) = ∫_{-∞}^∞ f(x, y) \,dx, \qquad y ∈ S_Y,$

where ``S_X`` and ``S_Y`` are the respective spaces of ``X`` and ``Y``.
The definitions associated with mathematical expectations in the continuous case are the same as those associated with the discrete case after replacing the summations with integrations.
"""

# ╔═╡ 9bb4a037-76e8-41e7-9fd0-dc6a2744633e
md"""
**Example 4.4-1**
Let ``X`` and ``Y`` have the joint pdf

$f(x,y) = \left(\frac{4}{3}\right) (1 - xy), \qquad 0 < x < 1, \qquad 0 < y < 1.$

The marginal pdfs are

$f_X(x) = ∫_0^1 \left(\frac{4}{3}\right) (1 - xy) \,dy = \left(\frac{4}{3}\right) \left(1 - \frac{x}{2}\right), \qquad 0 < x < 1,$

and

$f_Y(y) = ∫_0^1 \left(\frac{4}{3}\right) (1 - xy) \,dx = \left(\frac{4}{3}\right) \left(1 - \frac{y}{2}\right), \qquad 0 < y < 1.$

The following probability is computed by a double integral:

$\begin{align*}
P(Y ≤ X / 2) &= ∫_0^1 ∫_0^{x/2} \left(\frac{4}{3}\right) (1 - xy) \, dy \,dx \\
&= ∫_0^1 \left(\frac{4}{3}\right) \left(\frac{x}{2} - \frac{x^3}{8}\right) dx \\
&= \left(\frac{4}{3}\right) \left(\frac{1}{4} - \frac{1}{32}\right) \\
&= \frac{7}{24}
\end{align*}$

The mean of ``X`` is

$\begin{align*}
\mu_X &= E(X) \\
&= ∫_0^1 ∫_0^1 x \left(\frac{4}{3}\right) (1 - xy) \,dy \,dx \\
&= ∫_0^1 x \left(\frac{4}{3}\right) \left(1 - \frac{x}{2}\right) dx \\
&= \left(\frac{4}{3}\right) \left(\frac{1}{2} - \frac{1}{6}\right) \\
&= \frac{4}{9}.
\end{align*}$

Likewise, the mean of ``Y`` is

$\mu_Y = E(Y) = \frac{4}{9}.$

The variance of ``X`` is

$\begin{align*}
{\sigma_X}^2 &= E(X^2) - [E(X)]^2 \\
&= ∫_0^1 ∫_0^1 x^2 \left(\frac{4}{3}\right) (1 - xy) \,dy \,dx - \left(\frac{4}{9}\right)^2 \\
&= ∫_0^1 x^2 \left(\frac{4}{3}\right)\left(1 - \frac{x}{2}\right) dx - \frac{16}{81} \\
&= \left(\frac{4}{3}\right) \left(\frac{1}{3} - \frac{1}{8}\right) - \frac{16}{81} \\
&= \frac{13}{162}.
\end{align*}$

Likewise, the variance of ``Y`` is

$\text{Var}(Y) = {\sigma_Y}^2 = \frac{13}{162}.$

From these calculations, we see that the means and variances could be calculated using the marginal pdfs instead of the joint pdf.
"""

# ╔═╡ 3f304b71-b329-4f55-b4cf-02177feb4ea0
md"## The Bivariate Normal Distribution"

# ╔═╡ 7b595ff1-a863-4fae-a5ad-5f0bcbaf5992
md"""
**Remark.**
Let ``X`` and ``Y`` be random variables with joint pdf ``f(x,y)`` of the continuous type.
Many applications are concerned with the conditional distribution of one of the random variables---say, ``Y``, given that ``X = x``.
For example, ``X`` and ``Y`` might be a student's grade point averages from high school and from the first year in college, respectively.
Persons in the field of educational testing and measurement are extremely interested in the conditional distribution of ``Y``, given that ``X = x``, in such situations.
"""

# ╔═╡ f223db10-2c37-4328-a434-52d5ada5573f
md"""
**Remark.**
Suppose that we have an application in which we can make the following three assumptions about the conditional distribution of ``Y``, given ``X = x``:

(a) It is normal for each real ``x``

(b) Its mean, ``E(Y ∣ x)``, is a linear function of ``x``.

(c) Its variance is constant; that is, it does not depend upon the given value of ``x``.
"""

# ╔═╡ f303c01e-98e5-4b52-ae42-9e96f00860cc
md"""
**Example 4.5-2**
"""

# ╔═╡ 065547c7-1d1a-41df-b0e9-13cc12949020
let
	μX = 2.9
	μY = 2.4
	σX = 0.4
	σY = 0.5
	ρ = 0.6
	Φ((3.3 - μY) / 0.5) - Φ((2.1 - μY) / 0.5)
end

# ╔═╡ 24e93391-8f2f-482c-a2fb-9a61d5359974
md"""
**Theorem 4.5-1.**
If ``X`` and ``Y`` have a bivariate normal distribution with correlation coefficient ``\rho``, then ``X`` and ``Y`` are independent if and only if ``\rho = 0``.
"""

# ╔═╡ 4b889a29-75ee-4674-8353-7bef532aa1ac
md"# Distributions of Functions of Random Variables"

# ╔═╡ 12507705-6223-4907-b2f5-9d58e16d9cd5
md"## Functions of One Random Variable"

# ╔═╡ 8f9d0785-a424-4d2c-9664-c6a5c1aa17f5
md"""
**Remark.**
Let ``X`` be a random variable.
Often, we are interested in some function of ``X``, say ``Y = u(X)``, which itself a random variable and therefore has its own probability distribution.
This section describes how the distribution of ``Y`` may be determined from that of ``X``.
The details depend on whether ``X`` is of the discrete type or continuous type.
We begin with the discrete case, as it is the easier of the two.
"""

# ╔═╡ fa79639f-d9fd-4302-b207-7cd753a9dd13
md"""
**Remark.**
Let ``X`` be a discrete random variable with pmf ``f(x) = P(X = x), \, x ∈ S_X``.
The support ``S_X`` of ``X`` consists of a countable number of points, say ``c_1, c_2, …``.
Let ``Y = u(X)`` be a function of ``X`` that maps ``S_X`` into a countable set of points ``S_Y``, which is the support of ``Y``.
Hence ``Y`` is discrete, and its pmf is

$g(y) = P(Y = y) = P[u(X) = y] = \sum_{x:u(x) = y} f(x), \qquad y ∈ S_Y,$

That is, for each ``y ∈ S_Y``, the value of ``g(y)`` may be found by summing probabilities over all values of ``x`` for which ``u(x)`` equals ``y``.
Observe further that if ``Y = u(X)`` is a one-to-one function with inverse function ``X = v(Y)``, then for each ``y ∈ S_Y`` there is only one ``x`` such that ``u(x) = y``, so that in that case ``g(y) = f[v(y)]``.
"""

# ╔═╡ ddf277be-08ed-4524-b2e1-100842c5f710
md"""
**Example 5.1-1**
Let ``X`` have a discrete uniform distribution on the integers ``-2, -1, 0, …, 5``, that is

$f(x) = 1/8, \qquad x = -2, -1, …, 5.$

If we define ``Y = X^2``, then

$g(y) = P(X^2 = y) = \sum_{\{x:x^2 = y\}} (1/8) = \begin{cases} 2/8, &y = 1,4, \\ 1/8, &y = 0,9,16,25 \end{cases}$

Note that the function ``u(X) = X^2`` is not one-to-one, so probabilities of some elements of ``S_X`` are added to obtain probabilities of elements of ``S_Y``.
If we consider a different function of ``X`` that is one-to-one, say ``Y = 2x + 5``, then each value in ``S_X`` maps to a unique value in ``S_Y`` and the pmf of this ``Y`` is ``g(y) = 1/8``, ``y = 1,3,5,7,9,11,13,15``.
"""

# ╔═╡ b6df25b8-002a-4e86-b127-2717e5bb6110
md"""
**Example 5.1-2**
Let the distribution of ``X`` be binomial with parameters ``n`` and ``p``.
Because ``X`` has a discrete distribution, a one-to-one function ``Y = u(X)`` will also have a discrete distribution, with the same probabilities as those in the support of ``X``.
For example, with ``n = 3``, ``p = 1/4``, and ``Y = e^X``, we have

$g(y) = \begin{pmatrix} 3 \\ \ln{y} \end{pmatrix} \left(\frac{1}{4}\right)^{\ln{y}} \left(\frac{3}{4}\right)^{3-\ln{y}}, \qquad y = 1,e,e^2,e^3.$
"""

# ╔═╡ 8a3f35e2-c23b-47e4-8878-4fd1b91baf7f
md"""
**Example 5.1-3**
Let ``X`` have a Poisson distribution with ``\lambda = 4``; thus, the pmf is

$f(x) = \frac{4^x e^{-4}}{x!}, \qquad x = 0,1,2,…$

If ``Y = \sqrt{X}``, then because ``X = Y^2``, we have

$g(y) = \frac{4^{y^2} e^{-4}}{(y^2)!}, \qquad y = 0,1,\sqrt{2},\sqrt{3},…$
"""

# ╔═╡ ca80ecc7-801c-4cfc-950b-9fc21b188786
md"""
**Remark.**
Now we turn our attention to the case where ``X`` is continuous, with cdf ``F(x)`` and pdf ``f(x)``.
In this case, ``Y = u(X)`` may be either discrete or continuous (or neither).
An example where ``X`` is continuous but ``Y`` is discrete is provided by letting ``X`` have a standard normal distribution and defining ``Y`` to equal ``1`` if ``X > 0`` and ``0`` otherwise.
Then ``Y`` has a Bernoulli distribution with parameter ``p = 0.5``.
Henceforth, we consider only those transformations ``Y = u(X)`` for which ``Y`` is continuous.
"""

# ╔═╡ b3f76000-57bd-4263-aa18-9f27d47a71a3
md"""
**Remark.**
For transformations resulting in a ``Y`` of continuous type, the distribution of ``Y`` may be determined by a method known as the **cdf technique**, so named because it involves deriving the cdf of ``Y`` and then obtaining its pdf, if so desired, from the cdf (by differentiation).
To apply the cdf technique, we begin as follows:

$G(y) = P(Y ≤ y) = P[u(X) ≤ y].$

What we do next depends on what additional properties are possessed by the function ``u``.
Before going into further detail, we illustrate the technique with two examples.
"""

# ╔═╡ 81bd086c-84c7-43a2-b88e-9e66ce81e96a
md"""
**Example 5.1-4**
Let ``X`` have a gamma distribution with pdf

$f(x) = \frac{1}{\Gamma(\alpha) \theta^{\alpha}} x^{\alpha - 1} e^{-x / \theta}, \qquad 0 < x < ∞$

where ``\alpha > 0``, ``\theta > 0``.
Let ``Y = e^X``, so that the support of ``Y`` is ``1 < y < ∞``.
For each ``y`` in the support, the cdf of ``Y`` is

$G(y) = P(Y ≤ y) = P(e^X ≤ y) = P(X ≤ \ln{y})$

That is,

$G(y) = ∫_0^{\ln{y}} \frac{1}{\Gamma(\alpha) \theta^{\alpha}} x^{\alpha - 1} e^{-x / \theta} \,dx,$

and thus the pdf ``g(y) = G'(y)`` of ``Y`` is

$g(y) = \frac{1}{\Gamma(\alpha) \theta^{\alpha}} (\ln{y})^{\alpha - 1} e^{-(\ln{y}) / \theta} \left(\frac{1}{y}\right). \qquad 1 < y < ∞.$

Equivalently, we have

$g(y) = \frac{1}{\Gamma(\alpha) \theta^{\alpha}} \frac{(\ln{y})^{\alpha - 1}}{y^{1 + 1 / \theta}}, \qquad 1 < y < ∞,$

which is called a **log-gamma** pdf.
(See Figure 5.1-1 for some graphs.)
Note that ``\alpha \theta`` and ``\alpha \theta^2`` are the mean and the variance, not of ``Y``, but of the original random variable ``X = \ln{Y}``.
For the log-gamma distribution,

$\begin{align*}
\mu &= \frac{1}{(1 - \theta)^\alpha}, \qquad \theta < 1, \\
\sigma^2 &= \frac{1}{(1 - 2\theta)^\alpha} - \frac{1}{(1 - \theta)^{2\alpha}}, \qquad \theta < \frac{1}{2}.
\end{align*}$
"""

# ╔═╡ e72a9c5d-bf04-4470-8d20-f5370bf2f848
md"""
**Remark.**
There is another interesting distribution, this one involving a transformation of a uniform random variable.
"""

# ╔═╡ a6f02478-71f8-4766-9678-cb59ad5f5914
md"""
**Example 5.1-5**
A spinner is mounted at the point (0,1).
Let ``x`` be the smallest angle between the vertical axis and the spinner.
(See Figure 5.1-2.)
Assume that ``x`` is the value of a random variable ``X`` that has a uniform distribution on the interval ``(-\pi / 2, \pi / 2)``.
That is, ``X`` is ``U(-\pi / 2, \pi / 2)``, and the cdf of ``X`` is

$P(X ≤ x) = F(x) = \begin{cases}
0, &-∞ < x < -\frac{\pi}{2}, \\
\left(x + \frac{\pi}{2}\right)\left(\frac{1}{\pi}\right), &-\frac{\pi}{2} ≤ x < \frac{\pi}{2}, \\
1, &\frac{\pi}{2} ≤ x < ∞.
\end{cases}$

The relationship between ``y`` and ``x`` is given by ``y = \tan{x}``.
Note that ``y`` is the point on the horizontal axis that is the intersection of that axis and the linear extension of the spinner.
To find the distribution of the random variable ``Y = \tan{X}``, we note that the cdf of ``Y`` is given by

$\begin{align*}
G(y) &= P(Y ≤ y) = P(\tan{X} ≤ y) = P(X ≤ \arctan{y}) \\
&= F(\arctan{y}) = \left(\arctan{y} + \frac{\pi}{2}\right) \left(\frac{1}{\pi}\right), \qquad -∞ < y < ∞
\end{align*}$

The last equality follows because ``-\pi / 2 < x = \arctan{y} < \pi / 2``.
The pdf of ``Y`` is given by

$g(y) = G'(y) = \frac{1}{\pi (1 + y^2)}, \qquad -∞ < y < ∞.$

Figure 5.1-2 shows the graph of this **Cauchy pdf**.
In Exercise 5.1-14, you will be asked to show that the expectation of the Cauchy distribution does not exist because its tails contain too much probability for the pdf to "balance" at zero.
"""

# ╔═╡ 6c960246-2e3a-489c-9226-091a9a496182
md"""
**Example 5.1-6**
Let ``X`` have the pdf

$f(x) = 3(1 - x)^2, \qquad 0 < x < 1.$

Say ``Y = (1 - X)^3 = u(X)``, a decreasing function of ``X``.
Thus, ``X = 1 - Y^{1/3} = v(Y)`` and ``0 < x < 1`` is mapped onto ``0 < y < 1``.
Because

$v'(y) = -\frac{1}{3y^{2/3}},$

we have

$g(y) = 3[1 - (1 - y^{1/3})]^2 \left|\frac{-1}{3y^{2/3}}\right|, \qquad 0 < y < 1.$

That is,

$g(y) = 3y^{2/3} \left(\frac{1}{3y^{2/3}}\right) = 1, \qquad 0 < y < 1;$

so ``Y = (1 - X)^3`` has the uniform distribution ``U(0,1)``.
"""

# ╔═╡ ce603a4b-d818-4e4b-9c96-b348cd7008d5
md"""
**Theorem 5.1-1**
Let ``Y`` have distribution that is ``U(0,1)``.
Let ``F(x)`` have the properties of a cdf of the continuous type with ``F(a) = 0``, ``F(b) = 1``, and suppose that ``F(x)`` is strictly increasing on the support ``a < x < b``, where ``a`` and ``b`` could be ``-∞`` and ``∞``, respectively.
Then the random variable ``X`` defined by ``X = F^{-1}(Y)`` is a continuous-type random variable with cdf ``F(x)``.
"""

# ╔═╡ 4ceaf207-cef2-471e-a607-953d592177f3
md"""
**Theorem 5.1-2**
Let ``X`` have the cdf ``F(x)`` of the continuous type that is strictly increasing on the support ``a < x < b``.
Then the random variable ``Y``, defined by ``Y = F(X)``, has a distribution that is ``U(0,1)``.
"""

# ╔═╡ 41fe6a4e-dac2-4f1f-b2ec-e4e950250839
md"## Transformations of Two Random Variables"

# ╔═╡ 76d118b7-3f12-4bf5-83bd-046d6e2b19fb
md"""
**Remark.**
In Section 5.1, we considered the transformation of one random variable ``X`` with pdf ``f(x)``.
In particular, in the continuous case, if ``Y = u(X)`` was increasing or decreasing function of ``X``, with inverse ``X = v(Y)``, then the pdf of ``Y`` was

$g(y) = |v'(y)|f[v(y)], \qquad c < y < d,$

where the support ``c < y < d`` corresponds to the support of ``X``, say, ``a < x < b``, through the transformation ``x = v(y)``.
"""

# ╔═╡ 9d429275-9636-498d-85ce-8331e01f2a71
md"""
**Remark.**
There is one note of warning here: If the function ``Y = u(X)`` does not have a single-valued inverse, the determination of the distribution of ``Y`` will not be as simple.
As a matter of fact, we did consider two examples in Section 5.1 in which there were two inverse functions, and we exercised special care in those examples.
Here, we will not consider problems with many inverses; however, such a warning is nonetheless appropriate.
"""

# ╔═╡ 5ac45834-83e1-4fa2-a380-1b27fca5553a
md"""
**Remark.**
When two random variables are involved, many interesting problems can result.
In the case of a single-valued inverse, the rule is about the same as that in the one-variable case, with the derivative being replaced by the Jacobian.
That is, if ``X_1`` and ``X_2`` are two continuous-type random variables with joint pdf ``f(x_1, x_2)``, and if ``Y_1 = u_1(X_1, X_2)``, ``Y_2 = u_2(X_1, X_2)`` has the single-valued inverse ``X_1 = v_1(Y_1, Y_2)``, ``X_2 = v_2(Y_1, Y_2)``, then the joint pdf of ``Y_1`` and ``Y_2`` is

$g(y_1,y_2) = |J| f[v_1(y_1,y_2),v_2(y_1,y_2)], \qquad (y_1,y_2) ∈ S_Y$

where the Jacobian ``J`` is the determinant

$J = \begin{vmatrix} \frac{∂x_1}{∂y_1} & \frac{∂x_1}{∂y_2} \\ \frac{∂x_2}{∂y_1} & \frac{∂x_2}{∂y_2} \end{vmatrix}.$

Of course, we find the support ``S_Y`` of ``Y_1,Y_2`` by considering the mapping of the support ``S_X`` of ``X_1,X_2`` under the transformation ``y_1 = u_1(x_1, x_2), y_2 = u_2(x_1,x_2)``.
This method of finding the distribution of ``Y_1`` and ``Y_2`` is called the **change-of-variables technique**.
"""

# ╔═╡ f28e2dce-c812-4327-aca0-8bbf9e2bb193
md"""
**Remark.**
It is often the mapping of the support ``S_X`` of ``X_1,X_2`` into the support ``S_Y`` of ``Y_1,Y_2`` that causes the biggest challenge.
That is, in most cases, it is easy to solve for ``x_1`` and ``x_2`` in terms of ``y_1`` and ``y_2``, say,

$x_1 = v_1(y_1, y_2), \qquad x_2 = v_2(y_1, y_2),$

and then to compute the Jacobian

$J = \begin{vmatrix} \frac{∂v_1(y_1,y_2)}{∂y_1} & \frac{∂v_1(y_1,y_2)}{∂y_2} \\ \frac{∂v_2(y_1,y_2)}{∂y_1} & \frac{∂v_2(y_1,y_2)}{∂y_2} \end{vmatrix}$

However, the mapping of ``(x_1,x_2) ∈ S_X`` into ``(y_1,y_2) ∈ S_Y`` can be more difficult.
Let us consider two simple examples.
"""

# ╔═╡ 74fc2975-a50e-4a82-a0c8-2354eed57ced
md"""
**Example 5.2-1**
Let ``X_1`` and ``X_2`` have the joint pdf

$f(x_1,x_2) = 2, \qquad 0 < x_1 < x_2 < 1.$

Consider the transformation

$Y_1 = \frac{X_1}{X_2}, \qquad Y_2 = X_2.$

It is certainly easy enough to solve for ``x_1`` and ``x_2``, namely,

$x_1 = y_1 y_2, \qquad x_2 = y_2,$

and compute

$J = \begin{vmatrix} y_2 & y_1 \\ 0 & 1 \end{vmatrix} = y_2.$

Let us now consider ``S_X``, which is depicted in Figure 5.2-1(a).
The boundaries of ``S_X`` are not part of the support, but let us see how they map.
"""

# ╔═╡ 68e975cc-17e7-4307-8052-cc031fe16995
md"""
**Theorem 5.2-1**
Let

$W = \frac{U/r_1}{V/r_2},$

where ``U`` and ``V`` are independent chi-square variables with ``r_1`` and ``r_2`` degrees of freedom, respectively.
Then ``W`` has an ``F`` distribution with ``r_1`` and ``r_2`` degrees of freedom, for which the pdf is

$f(w) = \frac{\Gamma[(r_1 + r_2) / 2](r_1 / r_2)^{r_1 / 2} w^{r_1 / 2 - 1}}{\Gamma(r_1 / 2) \Gamma(r_2 / 2)[1 + (r_1 / r_2)w]^{(r_1 + r_2) / 2}}, \quad w > 0$
"""

# ╔═╡ e2b134ef-b588-4b5f-a0c1-8b410476f4e1
md"## Several Independent Random Variables"

# ╔═╡ cdc9dcf5-a616-46cb-8f13-0deb765cecc9
md"""
**Theorem 5.3-1.**
Say ``X_1,X_2,…,X_n`` are ``n`` independent random variables and ``Y = u_1(X_1) u_2(X_2) ⋯ u_n(X_n)``.
If ``E[u_i(X_i)], \,i = 1,2,…,n``, exist, then

$E(Y) = E[u_1(X_1)u_2(X_2) ⋯ u_n(X_n)] = E[u_1(X_1)] E[u_2(X_2)] ⋯ E[u_n(X_n)].$
"""

# ╔═╡ 1efe6c88-4743-45ea-b1a9-5a680d8b091e
md"""
**Theorem 5.3-2**
If ``X_1, X_2, …, X_n`` are ``n`` random variables with respective means ``\mu_1, \mu_2, …, \mu_n`` and variances ``{\sigma_1}^2, {\sigma_2}^2, …, {\sigma_n}^2``, then the mean of ``Y = \sum_{i = 1}^n a_i X_i``, where ``a_1,a_2,…,a_n`` are real constants, is

$\mu_Y = \sum_{i=1}^n a_i \mu_i.$

If, in addition, ``X_1,X_2,…,X_n`` are independent, then the variance of ``Y`` is

${\sigma_Y}^2 = \sum_{i=1}^n {a_i}^2 {\sigma_i}^2.$
"""

# ╔═╡ 663f5fec-36a5-404d-abd4-67322be47d3a
md"## The Moment-Generating Function Technique"

# ╔═╡ 6121318a-5877-48f8-904a-97cbd065f302
md"""
**Remark.**
The first three sections of this chapter presented several techniques for determining the distribution of a function of random variables with known distributions.
Another technique for this purpose is the moment-generating function technique.
If ``Y = u(X_1, X_2, …, X_n)``, we have noted that we can find ``E(Y)`` by evaluating ``E[u(X_1, X_2, …, X_n)]``.
It is also true that we can find ``E[e^{tY}]`` by evaluating ``E[e^{tu(X_1, X_2, …, X_n)}]``.
We begin with a simple example.
"""

# ╔═╡ dccc93be-3273-429d-8ef0-1ff159cec322
md"""
**Example 5.4-1**
Let ``X_1`` and ``X_2`` be independent random variables with uniform distributions on ``\{1,2,3,4\}``.
Let ``Y = X_1 + X_2``.
For example, ``Y`` could equal the sum when two fair four-sided dice are rolled.
The mgf of ``Y`` is

$M_Y(t) = E(e^{tY}) = E[e^{t(X_1 + X_2)}] = E(e^{tX_1} e^{tX_2}), \qquad -∞ < t < ∞.$

The independence of ``X_1`` and ``X_2`` implies that

$M_Y(t) = E(e^{tX_1}) E(e^{tX_2})$

In this example, ``X_1`` and ``X_2`` have the same pmf, namely,

$f(x) = \frac{1}{4}, \qquad x = 1,2,3,4,$

and thus the same mgf,

$M_X(t) = \frac{1}{4} e^t + \frac{1}{4} e^{2t} + \frac{1}{4} e^{3t} + \frac{1}{4} e^{4t}.$

It then follows ``M_Y(t) = [M_X(t)]^2`` equals

$\frac{1}{16} e^{2t} + \frac{2}{16} e^{3t} + \frac{3}{16} e^{4t} + \frac{4}{16} e^{5t} + \frac{3}{16} e^{6t} + \frac{2}{16} e^{7t} + \frac{1}{16} e^{8t}.$

Note that the coefficient of ``e^{bt}`` is equal to ``P(Y = b);`` for example, ``4/16 = P(Y = 5)``.
Thus, we cann find the distribution of ``Y`` by determining its mgf.
"""

# ╔═╡ 87c9f8cc-89fa-4baa-8007-13f2266bfe04
md"""
**Theorem 5.4-1**
If ``X_1, X_2, …, X_n`` are independent random variables with respective moment generating functions ``M_{x_i}(t)``, ``i = 1,2,3,…,n``, where ``-h_i < t < h_i``, ``i = 1,2,…,n``, for positive numbers ``h_i``, ``i = 1,2,…,n``, then the moment-generating function of ``Y = \sum_{i=1}^n a_i X_i`` is

$M_Y(t) = \prod_{i=1}^n M_{X_i} (a_i t), \quad\text{where}\quad -h_i < a_i t < h_i.$
"""

# ╔═╡ 39e2ca10-37e1-488b-b179-de3584587686
md"""
**Corollary 5.4-1**
If ``X_1, X_2, …, X_n`` are observations of a random sample from a distribution with moment-generating function ``M(t)``, where ``-h < t < h``, then

(a) the moment-generating function of ``Y = \sum_{i = 1}^n X_i`` is

$M_Y(t) = \prod_{i=1}^n M(t) = [M(t)]^n, \quad -h < t < h;$

(b) the moment-generating function of ``\overline{X} = \sum_{i = 1}^n (1 / n) X_i`` is

$M_{\overline{X}}(t) = \prod_{i = 1}^n M \left(\frac{t}{n}\right) = \left[M\left(\frac{t}{n}\right)\right]^n, \quad -h < \frac{t}{n} < h.$
"""

# ╔═╡ a10f9e22-c240-498d-a034-d8d4dacfb394
md"""
**Theorem 5.4-2**
Let ``X_1,X_2,…,X_n`` be independent chi-square random variables with ``r_1,r_2,…,r_n`` degrees of freedom, respectively.
Then ``Y = X_1 + X_2 + ⋯ + X_n`` is ``\chi^2(r_1 + r_2 + ⋯ + r_n)``.
"""

# ╔═╡ 59fe4357-e514-4fd2-bfe8-3000874af5a2
md"""
**Corollary 5.4-2**
Let ``Z_1,Z_2,…,Z_n`` have standard normal distributions, ``N(0,1)``.
If these random variables are independent, then ``W = {Z_1}^2 + {Z_2}^2 + ⋯ + {Z_n}^2`` has a distribution that is ``\chi^2(n)``.
"""

# ╔═╡ 6db7dca8-90d0-4f37-a954-18c174e5576a
md"""
**Corollary 5.4-3**
If ``X_1,X_2,…,X_n`` are independent and have normal distributions ``N(\mu_i,{\sigma_i}^2)``, ``i = 1,2,…,n``, respectively, then the distribution of

$W = \sum_{i=1}^n \frac{(X_i - \mu_i)^2}{{\sigma_i}^2}$

is ``\chi^2(n)``.
"""

# ╔═╡ 5a6dd04f-fe83-4e7f-8702-6f987fca25fc
md"## Random Functions Associated with Normal Distributions"

# ╔═╡ 97743636-e565-4cc9-9e67-0b390ff5cece
md"""
**Remark.**
In statistical applications, it is often assumed that the population from which a sample is taken is normally distributed, ``N(\mu, \sigma^2)``.
There is then interest in estimating the parameters ``\mu`` and ``\sigma^2`` or in testing conjectures about these parameters.
The usual statistics that are used in these activities are the sample mean ``\overline{X}`` and the sample variance ``S^2``; thus, we need to know something about the distribution of these statistics or functions of these statistics.
"""

# ╔═╡ 1dcb45cd-f227-485b-8a30-8d2ac7498b0c
md"""
**Remark.**
We now use the mgf technique of Section 5.4 to prove a theorem that deals with linear functions of independent normally distributed random variables.
"""

# ╔═╡ 4da80bc7-38d5-4b27-9470-dff05e4f625d
md"""
**Theorem 5.5-1**
If ``X_1, X_2, …, X_n`` are ``n`` independent normal variables with means ``\mu_1, \mu_2, …, \mu_n`` and variances ``{\sigma_1}^2, {\sigma_2}^2, …, {\sigma_n}^2``, respectively, then the linear function

$Y = \sum_{i=1}^n c_i X_i$

has the normal distribution

$N \left(\sum_{i=1}^n c_i \mu_i, \sum_{i=1}^n {c_i}^2 {\sigma_i}^2\right).$

*Proof.*
By Theorem 5.4-1, we have, with ``-∞ < c_i t < ∞``, or ``-∞ < t < ∞``,

$M_Y(t) = \prod_{i=1}^n M_{X_i} (c_i t) = \prod_{i=1}^n \exp(\mu_i c_i t + {\sigma_i}^2 {c_i}^2 t^2 / 2)$

because ``M_{X_i}(t) = \exp(\mu_i t + {\sigma_i}^2 t^2 / 2), i = 1, 2, …, n``.
Thus,

$M_Y(t) = \exp{\left[\left(\sum_{i=1}^n c_i \mu_i\right) t + \left(\sum_{i=1}^n {c_i}^2 {\sigma_i}^2\right) \left(\frac{t^2}{2}\right)\right]}.$

This is the mgf of a distribution that is

$N \left(\sum_{i=1}^n c_i \mu_i, \sum_{i=1}^n {c_i}^2 {\sigma_i}^2\right).$

Thus, ``Y`` has this normal distribution.
"""

# ╔═╡ 382583c2-9d5d-47a9-92ca-2957eec06d1f
md"""
**Corollary 5.5-1**
If ``X_1, X_2, …, X_n`` are observations of a random sample of size ``n`` from the normal distribution ``N(\mu, \sigma^2)``, then the distribution of the sample mean ``\overline{X} = (1/n) \sum_{i=1}^n X_i`` is ``N(\mu, \sigma^2 / n)``.

*Proof.*
Let ``c_i = 1 / n``, ``\mu_i = \mu``, and ``{\sigma_i}^2 = \sigma^2`` in Theorem 5.5-1.
"""

# ╔═╡ 23aa82dc-1afd-4e29-bc9f-6f4bea33274f
md"""
**Theorem 5.5-2**
Let ``X_1,X_2,…,X_n`` be observations of a random sample of size ``n`` from the normal distribution ``N(\mu, \sigma^2)``.
Then the sample mean,

$\overline{X} = \frac{1}{n} \sum_{i=1}^n X_i,$

and the sample variance,

$S^2 = \frac{1}{n - 1} \sum_{i=1}^n (X_i - \overline{X})^2,$

are independent and

$\frac{(n - 1) S^2}{\sigma^2} = \frac{\sum_{i=1}^n (X_i - \overline{X})^2}{\sigma^2} \text{ is } \chi^2(n - 1).$

*Proof.*
We are not prepared to prove the independence of ``\overline{X}`` and ``S^2`` at this time (see Section 6.7 for a proof), so we accept it without proof here.
To prove the second part, note that

$\begin{align*}
W = \sum_{i=1}^n \left(\frac{X_i - \mu}{\sigma}\right)^2 &= \sum_{i=1}^n \left[\frac{(X_i - \overline{X}) + (\overline{X} - \mu)}{\sigma}\right]^2 \\
&= \sum_{i=1}^n \left(\frac{X_i - \overline{X}}{\sigma}\right)^2 + \frac{n(\overline{X} - \mu)^2}{\sigma^2} \tag{5.5-1}
\end{align*}$

because the cross-product term is equal to

$2 \sum_{i=1}^n \frac{(\overline{X} - \mu)(X_i - \overline{X})}{\sigma^2} = \frac{2(\overline{X} - \mu)}{\sigma^2} \sum_{i=1}^n (X_i - \overline{X}) = 0.$

But ``Y_i = (X_i - \mu) / \sigma, i = 1,2,…,n``, are standardized normal variables that independent.
Hence, ``W = \sum_{i = 1}^n {Y_i}^2`` is ``\chi^2(n)`` by Corollary 5.4-3.
Moreover, because ``\overline{X}`` is ``N(\mu, \sigma^2/n)``, it follows that

$Z^2 = \left(\frac{\overline{X} - \mu}{\sigma / \sqrt{n}}\right)^2 = \frac{n(\overline{X} - \mu)^2}{\sigma^2}$

is ``\chi^2(1)`` by Theorem 3.3-2.
In this notation, Equation 5.5-1 becomes

$W = \frac{(n - 1) S^2}{\sigma^2} + Z^2.$

However, from the fact that ``\overline{X}`` and ``S^2`` are independent, it follows that ``Z^2`` and ``S^2`` are also independent.
In the mgf of ``W``, this independence permits us to write

$E[e^{tW}] = E[e^{t[(n-1) S^2 / \sigma^2 + Z^2]}] = E[e^{t(n-1)S^2 / \sigma^2} e^{tZ^2}] = E[e^{t(n-1) S^2 / \sigma^2}] E[e^{tZ^2}].$

Because ``W`` and ``Z^2`` have chi-square distributions, we can substitute their mgfs to obtain

$(1 - 2t)^{-n/2} = E[e^{t(n - 1) S^2 / \sigma^2}] (1 - 2t)^{-1/2}, \qquad t < \frac{1}{2}.$

Equivalently, we have

$E[e^{t(n-1) S^2 / \sigma^2}] = (1 - 2t)^{-(n - 1)/2}, \qquad t < \frac{1}{2}.$

This, of course, is the mgf of a ``\chi^2(n - 1)``-variable; accordingly, ``(n - 1)S^2 / \sigma^2`` has that distribution.
"""

# ╔═╡ 30668f76-eff6-4c42-aaee-56d61ae8ebe5
md"""
**Theorem 5.5-3 (Student's ``t`` distribution)**
Let

$T = \frac{Z}{\sqrt{U / r}},$

where ``Z`` is a random variable that is ``N(0,1)``, ``U`` is a random variable that is ``\chi^2(r)`` and ``Z`` and ``U`` are independent.
Then ``T`` has a ``t`` distribution with ``r`` degrees of freedom for which the pdf is

$f(t) = \frac{\Gamma((r + 1) / 2)}{\sqrt{\pi r} \Gamma(r / 2)}\frac{1}{(1 + t^2 / r)^{(r + 1) / 2}}, \qquad -∞ < t < ∞.$
"""

# ╔═╡ d6594feb-95cc-4fa1-acca-a4565b09791b
md"## The Central Limit Theorem"

# ╔═╡ 83dff207-8aad-4450-9684-37514f61a2d8
md"""
**Remark.**
In Section 5.3, we found that the mean ``\overline{X}`` of a random sample of size ``n`` from a distribution with mean ``\mu`` and variance ``\sigma^2 > 0`` is a random variable with the properties that

$E(\overline{X}) = \mu \qquad\text{and}\qquad \text{Var}(\overline{X}) = \frac{\sigma^2}{n}.$

As ``n`` increases, the variance of ``\overline{X}`` decreases.
Consequently, the distribution of ``\overline{X}`` clearly depends on ``n``, and we see that we are dealing with sequences of distributions.
"""

# ╔═╡ 332936c2-60ee-4482-9417-866564b99b15
md"""
**Remark.**
In Theorem 5.5-1, we consider the pdf of ``\overline{X}`` when sampling is from the normal distribution ``N(\mu, \sigma^2)``.
We showed that the distribution of ``\overline{X}`` is ``N(\mu, \sigma^2/n)``, and in Figure 5.5-1, by graphing the pdfs for several values of ``n``, we illustrated the property that as ``n`` increases, ``\overline{X}`` tends to converge to ``\mu``, or ``(\overline{X} - \mu)`` tends to converge to ``0`` in a probability sense.
(See Section 5.8.)
"""

# ╔═╡ 76dba131-e802-43ac-9182-753c85847966
md"""
**Remark.**
In general, if we let

$W = \frac{\sqrt{n}}{\sigma} (\overline{X} - \mu) = \frac{\overline{X} - \mu}{\sigma / \sqrt{n}} = \frac{Y - n \mu}{\sqrt{n} \sigma},$

where ``Y`` is the sum of a random sample of size ``n`` form some distribution with mean ``\mu`` and variance ``\sigma^2``, then, for each positive integer ``n``,

$E(W) = E{\left[\frac{\overline{X} - \mu}{\sigma / \sqrt{n}}\right]} = \frac{E(\overline{X}) - \mu}{\sigma / \sqrt{n}} = \frac{\mu - \mu}{\sigma/\sqrt{n}} = 0$

and

$\text{Var}(W) = E(W^2) = E{\left[\frac{(\overline{X} - \mu)^2}{\sigma^2 / n}\right]} = \frac{E[(\overline{X} - \mu)^2]}{\sigma^2 / n} = \frac{\sigma^2 / n}{\sigma^2 / n} = 1.$
"""

# ╔═╡ 140d557d-46c6-4bed-bbd8-72453c8b2030
md"""
**Theorem 5.6-1 (Central Limit Theorem)**
If ``\overline{X}`` is the mean of a random sample ``X_1,X_2,…,X_n`` of size ``n`` from a distribution with a finite mean ``\mu`` and a finite positive variance ``\sigma^2``, then the distribution of

$W = \frac{\overline{X} - \mu}{\sigma / \sqrt{n}} = \frac{\sum_{i=1}^n X_i - n\mu}{\sqrt{n} \sigma}$

is ``N(0,1)`` in the limit as ``n → ∞``.
"""

# ╔═╡ ac3a5f05-7abe-4e05-8a57-6535593d03d3
md"## Approximations for Discrete Distributions"

# ╔═╡ f701da73-d195-4e4d-97d3-90f893ac40b0
md"""
**Remark.**
In this section, we illustrate how the normal distribution can be used to approximate probabilities for certain discrete-type distributions.
One of the more important distributions is the binomial distribution.
To see how the central limit theorem can be applied, recall that a binomial random variable can be described as the sum of Bernoulli random variables.
That is, let ``X_1,X_2,…,X_n`` be a random sample from a Bernoulli distribution with mean ``\mu = p`` and variance ``\sigma^2 = p(1 - p)``, where ``0 < p < 1``.
Then ``Y = \sum_{i=1}^n X_i`` is ``b(n,p)``.
The central limit theorem states that the distribution of

$W = \frac{Y - np}{\sqrt{np(1 - p)}} = \frac{\overline{X} - p}{\sqrt{p(1 - p) / n}}$

is ``N(0,1)`` in the limit as ``n → ∞``.
Thus, if ``n`` is "sufficiently large," the distribution of ``Y`` is approximately ``N[np,np(1-p)]``, and probabilities for the binomial distribution ``b(n,p)`` can be approximated with this normal distribution.
A rule often stated is that ``n`` is sufficiently large if ``np ≥ 5`` and ``n(1 - p) ≥ 5``.
"""

# ╔═╡ bab0fb94-dd20-4891-8303-d1059f864962
md"""
**Remark.**
Note that we shall be approximating probabilites for a discrete distribution with probabilities for a continuous distribution.
Let us discuss a reasonable procedure in this situation.
If ``V`` is ``N(\mu,\sigma^2)``, then ``P(a < V < b)`` is equivalent to the area bounded by the pdf of ``V``, the ``v``-axis, ``v= a``, and ``v = b``.
Now recall that for a ``Y`` that is ``b(n,p)``, the probability histogram for ``Y`` was defined as follows: For each ``y`` such that ``k - 1/2 < y = k < k + 1/2``, let

$f(k) = \frac{n!}{k!(n-k)!} p^k (1 - p)^{n-k}, \qquad k = 0,1,2,…,n.$

Then ``P(Y = k)`` can be represented by the area of the rectangle with a height of ``P(Y = k)`` and a base of length 1 centered at ``k``.
Figure 5.7-1 shows the graph of the probability histogram for the binomial distribution ``b(4,1/4)``.
In using the normal distribution to approximate probabilities for the binomial distribution, areas under the pdf for the normal distribution will be used to approximate areas of rectangles in the probability histogram for the binomial distribution.
Because these rectangles have unit base centered at the integers, this is called a **half-unit correction for continuity**.
Note that, for an integer ``k``,

$P(Y = k) = P(k - 1/2 < Y < k + 1/2).$
"""

# ╔═╡ 8d79698e-b32f-4c35-8c6d-37b453ffe1f2
md"## Chebyshev's Inequality and Convergence in Probability"

# ╔═╡ d7aa06bf-0b98-4764-b93d-cf24ae6ce582
md"""
**Remark.**
In this section, we use Chebyshev's inequality to show, in another sense, that the sample mean, ``\overline{X}``, is a good statistic to use to estimate a population mean ``\mu``; the relative frequency of success in ``n`` independent Bernoulli trials, ``Y/n``, is a good statistic for estimating ``p``.
We examine the effect of the sample size ``n`` on these estimates.
"""

# ╔═╡ eeaf29fb-7c30-427d-9f4e-ab6f1c9fb852
md"""
**Theorem 5.8-1 (Chebyshev's Inequality)**
If the random variable ``X`` has a mean ``\mu`` and variance ``\sigma^2``, then, for every ``k ≥ 1``,

$P(|X - \mu| ≥ k\sigma) ≤ \frac{1}{k^2}.$
"""

# ╔═╡ 44a92a5e-2c8c-4d56-ae13-40502a3413c8
md"""
**Corollary 5.8-1**
If ``\varepsilon = k \sigma``, then

$P(|X - \mu| ≥ \varepsilon) ≤ \frac{\sigma^2}{\varepsilon^2}.$
"""

# ╔═╡ 1ccf2815-5dcb-49c0-a887-bfcbe6363fa8
md"## Limiting Moment-Generating Functions"

# ╔═╡ 85d7a375-7dd3-421f-afa5-4316565a308f
md"""
**Remark.**
We begin this section by showing that the binomial distribution can be approximated by the Poisson distribution when ``n`` is sufficiently large and ``p`` is fairly small.
Of course, we proved this in Section 2.7 by showing that, under these conditions, the binomial pmf is close to that of the Poisson.
Here, however, we show that the binomial mgf is close to that of the Poisson distribution.
We do so by taking the limit of a mgf.
"""

# ╔═╡ 3e48f5bd-9d1e-4636-a50e-97b542a6b175
md"""
**Remark.**
Consider the mgf of ``Y``, which is ``b(n,p)``.
We shall take the limit of this function as ``n → ∞`` such that ``np = \lambda`` is a constant; thus, ``p → 0``.
The mgf of ``Y`` is

$M(t) = (1 - p + pe^t)^n, \qquad -∞ < t < ∞.$

Because ``p = \lambda / n``, we have

$\begin{align*}
M(t) &= \left[1 - \frac{\lambda}{n} + \frac{\lambda}{n} e^t\right]^n \\
&= \left[1 + \frac{\lambda(e^t - 1)}{n}\right]^n.
\end{align*}$

Because

$\lim_{n→∞} \left(1 + \frac{b}{n}\right)^n = e^b,$

we have

$\lim_{n→∞} M(t) = e^{\lambda(e^t - 1)},$

which exists for all real ``t``.
But this is the mgf of a Poisson random variable with mean ``\lambda``.
Hence, this Poisson distribution seems like a reasonable approximation to the binomial distribution when ``n`` is large and ``p`` is small.
The approximation is usually found to be fairly successful if ``n ≥ 20`` and ``p ≤ 0.05`` and is found to be very successful if ``n ≥ 100`` and ``p ≤ 0.10``, but it is not bad if these bounds are violated somewhat.
That is, the approximation could be used in other situations, too; we only want to stress that it becomes better with larger ``n`` and smaller ``p``.
"""

# ╔═╡ 252e9085-4e3d-4dc1-aef1-78458ee4a7ba
md"""
**Theorem 5.9-1**
If a sequence of mgfs approaches a certain mgf, say, ``M(t)``, then the limit of the corresponding distributions must be the distribution corresponding to ``M(t)``.
"""

# ╔═╡ fd2628e3-9b8e-4b70-86f4-e3983d47d4c7
md"# Point Estimation"

# ╔═╡ a6303496-7aea-4c69-a22b-8d76a1ece3f1
md"## Descriptive Statistics"

# ╔═╡ a1237be1-38cf-4100-a084-38ff97f244ee
md"""
**Remark.**
In Chapter 2, we consider probability distributions of random variables whose space ``S`` contains a countable number of outcomes: either a finite number of outcomes or outcomes that can be put into a one-to-one correspondence with the positive integers.
Such a random variable is said to be of the **discrete type**, and its distribution of probabilities is of the discrete type.
"""

# ╔═╡ 463b4bc4-0614-48a5-9e2f-f6228092e371
md"## Exploratory Data Analysis"

# ╔═╡ 1512723d-6dbf-480c-8c71-522ffafc91ce
md"""
**Remark.**
To explore the other characteristics of an unknown distribution, we need to take a sample of ``n`` observations, ``x_1,x_2,…,x_n``, from that distribution and often need to order them from the smallest to the largest.
One convenient way of doing this is to use a stem-and-leaf display, a method that was started by John W. Tukey.
"""

# ╔═╡ a99a8476-e168-4420-aa02-e29f368c36b2
md"## Order Statistics"

# ╔═╡ f4a6cf01-51b2-4a7a-a294-c402f82b8c5f
md"""
**Remark.**
**Order statistics** are the observations of the random sample, arranged, or ordered, in magnitude from the smallest to the largest.
In recent years the importance of order statistics has increased, owing to the more frequent use of nonparametric inferences and robust procedures.
However, order statistics have always been prominent because, among other things, they are needed to determine rather simple statistics such as the sample median, the sample range, and the empirical cdf.
Recall that in Section 6.2 we discussed  observed order statistics in connection with descriptive and exploratory statistical methods.
We will consider certain interesting aspects about their distributions in this section.
"""

# ╔═╡ 5e95dbab-48de-4735-bf5b-86cb69fee34d
md"## Maximum Likelihood and Method of Moments Estimation"

# ╔═╡ 7da66523-a483-4f0a-8ac6-ae3f78a2751a
md"""
**Remark.**
In earlier chapters, we alluded to estimating characteristics of the distribution from the corresponding ones of the sample, hoping that the latter would be reasonably close to the former.
For example, the sample mean ``\overline{x}`` can be thought of as an estimate of the distribution mean ``\mu``, and the sample variance ``s^2`` can be used as an estimate of the distribution variance ``\sigma^2``.
Even the relative frequency histogram associated with a sample can be taken as an estimate of the pdf of the underlying distribution.
But how good are these estimates?
What makes an estimate good?
Can we say anything about the closeness of an estimate to an unknown parameter?
"""

# ╔═╡ b612ddc9-978e-4bce-8ca2-8889c28c2f75
md"""
**Remark.**
In this section, we consider random variables for which the functional form of the pmf or pdf is known, but the distribution depends on an unknown parameter (say, ``\theta``) that may have any value in a set (say, ``\Omega``) called the **parameter space**.
For example, perhaps it is known that ``f(x;\theta) = (1/\theta) e^{-x/\theta}, \, 0 < x < ∞``, and that ``\theta < Ω = \{\theta : 0 < \theta < ∞\}``.
In certain instances, it might be necessary for the experimenter to select precisely one member of the family ``\{f(x,\theta),\theta ∈ Ω\}`` as the most likely pdf of the random variable.
That is, the experimenter needs a point estimate of the parameter ``\theta``, namely, the value of the parameter that corresponds to the selected pdf.
"""

# ╔═╡ 6758379d-bf72-41a4-8674-8b646c7bacc8
md"""
**Remark.**
In one common estimation scenario, we take a random sample from the distribution to elicit some information about the unknown parameter ``\theta``.
That is, we repeat the experiment ``n`` independent times, observe the sample, ``X_1,X_2,…,X_n``, and try to estimate the value of ``\theta`` by using the observations ``x_1,x_2,…,x_n``.
The function of **estimator** of ``\theta``.
We want it to be such that the computed **estimate** ``u(x_1,x_2,…,x_n)`` is usually close to ``\theta``.
Because we are estimating one member of ``\theta ∈ Ω``, such an estimator is often called a **point estimator**.
"""

# ╔═╡ 518c752d-22b9-422d-b3ff-2fdc1c8d4ccd
md"""
**Remark.**
One principle for finding a point estimate is to choose the value of ``\theta ∈ Ω`` that is most likely to have given rise to the observed data.
The following example should help motivate this principle.
"""

# ╔═╡ 9524bb97-356f-468d-9a14-bf0a26912ce2
md"""
**Example 6.4-1**
Suppose that ``X`` is ``b(1,p)``, so that the pmf of ``X`` is

$f(x;p) = p^x (1 - p)^{1 - x}, \qquad x = 0,1,$

where ``p`` is equal to either ``0.2``, ``0.7``, or ``0.9`` (we don't know which).
That is, ``p ∈ Ω = \{0.2,0.7,0.9\}``.
Given a random sample ``X_1,X_2,…,X_n``, the problem is to find an estimator ``u(X_1,X_2,…,X_n)`` such that ``u(x_1,x_2,…,x_n)`` is a good point estimate of ``p``, where ``x_1,x_2,…,x_n`` are the observed values of the random sample.
Now, the probability that ``X_1,X_2,…,X_n`` takes these particular values is (with ``\sum x_i`` denoting ``\sum_{i=1}^n x_i``)

$P(X_1 = x_1,…, X_n = x_n) = \prod_{i=1}^n p^{x_i} (1 - p)^{1 - x_i} = p^{\sum x_i} (1 - p)^{n - \sum x_i},$

which is the joint pmf of ``X_1,X_2,…,X_n`` evaluated at the observed values.
One reasonable way to proceed toward finding a good estimate of ``p`` is to regard this probability (or joint pmf) as a function of ``p`` and find the value of ``p`` that maximizes it.
That is, we find the ``p`` value most likely to have produced these sample values.
The joint pmf, when regarded as a function of ``p``, is frequently called the **likelihood function**.
Thus, here the likelihood function is

$\begin{align*}
L(p) &= L(p; x_1,x_2,…,x_n) \\
&= f(x_1; p) f(x_2; p) ⋯ f(x_n; p) \\
&= p^{\sum x_i} (1 - p)^{n - \sum x_i}, \qquad p ∈ \{0.2,0.7,0.9\}.
\end{align*}$

To make things more specific, suppose that ``n = 5`` and ``\sum x_i = 3``.
Then the likelihood function may be evaluated as

$L(p) = \begin{cases}
(0.2)^3 (0.8)^2 = 0.00512, \qquad p = 0.2, \\
(0.7)^3 (0.3)^2 = 0.03087, \qquad p = 0.7, \\
(0.9)^3 (0.1)^2 = 0.00727, \qquad p = 0.9.
\end{cases}$

We see that the value of ``p ∈ \{0.2,0.7,0.9\}`` that maximizes the likelihood function is ``0.7``, which we denote by ``\hat{p}`` and call the **maximum likelihood estimate** of ``p``.
"""

# ╔═╡ ae68f221-ae5d-4a61-a98f-26b575b02760
md"## A Simple Regression Problem"

# ╔═╡ b1f0adb6-acb5-4c7e-8952-a4018384f1ed
md"## Asymptotic Distributions of Maximum Likelihood Estimators"

# ╔═╡ c3862456-2e36-4f5f-900d-acd7e3ec770f
md"## Sufficient Statistics"

# ╔═╡ 2aeb27c2-8d3e-481b-8ee2-578708bfdccc
md"## Bayesian Estimation"

# ╔═╡ 39558531-2384-4340-bbbb-613405c4677a
md"""
**Remark.**
We now describe another approach to estimation that is used by a group of statisticians who call themselves Bayesians.
To understand their approach fully would require more text than we can allocate to this topic, but let us begin this brief introduction by considering a simple application of the theorem of the Reverend Thomas Bayes. (See Section 1.5.)
"""

# ╔═╡ 4b0c0943-66ce-4464-86f4-0435d09d3f76
md"""
**Example 6.8-1**
Suppose we know that we are going to select an observation from a Poisson distribution with mean ``\lambda`` equal to either 2 or 4 (but we don't know which).
Moreover, prior to performing the experiment, we believe that ``\lambda = 2`` has about four times as much chance of being the parameter as does ``\lambda = 4``; that is, the prior probabilities are ``P(\lambda = 2) = 0.8`` and ``P(\lambda = 4) = 0.2``.
The experiment is now performed and we observe that ``x = 6``.
At this point, our intuition tells us that ``\lambda = 2`` seems less likely than before, as the observation ``x = 6`` is much more probabile with ``\lambda = 4`` than with ``\lambda = 2`` because, in an obvious notation,

$P(X = 6 ∣ \lambda = 2) = 0.995 - 0.983 = 0.012$

and

$P(X = 6 ∣ \lambda = 4) = 0.889 - 0.785 = 0.104,$

from Table III in Appendix B.
Our intuition can be supported by computing the conditional probability of ``\lambda = 2``, given that ``X = 6``:

$\begin{align*}
P(\lambda = 2 ∣ X = 6) &= \frac{P(\lambda = 2, X = 6)}{P(X = 6)} \\
&= \frac{P(\lambda = 2) P(X = 6 ∣ \lambda = 2)}{P(\lambda = 2) P(X = 6 ∣ \lambda = 2) + P(\lambda = 4) P(X = 6 ∣ \lambda = 4)} \\
&= \frac{(0.8)(0.012)}{(0.8)(0.012) + (0.2)(0.104)} = 0.316
\end{align*}$
"""

# ╔═╡ 0cf175fc-26e0-4f89-83fa-78db01e52a09
md"""
**Remark.**
In a more practical application, the parameter, say, ``\theta`` can take many more than two values as in Example 6.8-1.
Somehow Bayesians must assign prior probabilities to this total parameter space through a **prior pdf** ``h(\theta)``.
They have developed procedures for assessing these prior probabilities, and we simply cannot do justice to these methods here.
Somehow ``h(\theta)`` reflects the prior weights that the Bayesian wants to assign to the various possible values of ``\theta``.
In some instances, if ``h(\theta)`` is a constant and thus ``\theta`` has the uniform prior distribution, we say that the Bayesian has a **noninformative** prior.
If, in fact, some knowledge of ``\theta`` exists in advance of experimentation, noninformative priors should be avoided if at all possible.
"""

# ╔═╡ f07bc9b7-8b64-491d-8a20-67f269e7cc51
md"""
**Remark.**
Also, in more practical examples, we usually take several observations, not just one.
That is, we take a random sample, and there is frequently a good statistics, say, ``Y``, for the parameter ``\theta``.
Suppose we are considering a continuous case and the pdf of ``Y``, say, ``g(y; \theta)``, can be thought of as the conditional pdf of ``Y``, given ``\theta``.
[Henceforth in this section, we write ``g(y;\theta) = g(y ∣ \theta)``.]
Thus, we can treat

$g(y ∣ \theta) h(\theta) = k(y, \theta)$

as the joint pdf of the statistic ``Y`` and the parameter.
Of course, the marginal pdf of ``Y`` is

$k_1(y) = ∫_{-∞}^{∞} h(\theta) g(y ∣ \theta) \,d\theta.$

Consequently,

$\frac{k(y,\theta)}{k_1(y)} = \frac{g(y ∣ \theta) h(\theta)}{k_1(y)} = k(\theta ∣ y)$

would serve as the conditional pdf of the parametr, given that ``Y = y``.
This formula is essentially Bayes' theorem, and ``k(\theta ∣ y)`` is called the **posterior pdf of ``\theta``**., given that ``Y = y``.
"""

# ╔═╡ e9de4281-52b6-41c8-86fb-c10d6cf13991
md"""
**Remark.**
Bayesians believe that everything that needs to be known about the parameter is summarized in this posterior pdf ``k(\theta ∣ y)``.
Suppose, for example, that they were pressed into making a point estimate of the parameter ``\theta``.
They would note that they would be guessing the value of a random variable, here ``\theta``, given its pdf ``k(\theta ∣ y)``.
There are many ways that this could be done: The mean, the median, or the mode of that distribution would be reasonable guesses.
However, in the final analysis, the best guess would clearly depend upon the penalties for various errors created by incorrect guesses.
For instance, if we were penalized by taking the square of the error between the guess, say, ``w(y)``, and the real value of the parameter ``\theta``, clearly we would use the conditional mean

$w(y) = ∫_{-∞}^{∞} \theta k(\theta ∣ y) \,d\theta$

as our Bayes estimate of ``\theta``.
The reason is that, in general, if ``Z`` is a random variable, then the function of ``b``, ``E[(Z - b)^2]``, is minimized by ``b = E(Z)``.
(See Example 2.2-4.)
Likewise, if the penalty (loss) function, is the absolute value of the error, ``|\theta - w(y)|``, then we use the median of the distribution, because with any random variable ``Z``, ``E[|Z - b|]`` is minimized when ``b`` equals the median of the distribution of ``Z``.
(See Exercise 2.2-8.)
"""

# ╔═╡ 66cefe18-52a7-4ae4-8618-e13181cea689
md"""
**Example 6.8-2**
Suppose that ``Y`` has a binomial distribution with parameters ``n`` and ``p = \theta``.
Then the pmf of ``Y``, given ``\theta``, is

$g(y ∣ \theta) = \begin{pmatrix} n \\ y \end{pmatrix} \theta^y (1 - \theta)^{n - y}, \qquad y = 0,1,2,…,n.$

Let us take the prior pdf of the parameter to be the beta pdf:

$h(\theta) = \frac{\Gamma(\alpha + \beta)}{\Gamma(\alpha) \Gamma(\beta)} \theta^{\alpha - 1}(1 - \theta)^{\beta - 1}, \qquad 0 < \theta < 1.$

Such a prior pdf provides a Bayesian a great deal of flexibility through the selection of the parameters ``\alpha`` and ``\beta``.
Thus, the joint probabilities can be described by a product of the binomial pmf with parameters ``n`` and ``\theta`` and this beta pdf, namely,

$k(y, \theta) = \begin{pmatrix} n \\ y \end{pmatrix} \frac{\Gamma(\alpha + \beta)}{\Gamma(\alpha)\Gamma(\beta)} \theta^{y + \alpha - 1} (1 - \theta)^{n - y + \beta - 1},$

on the support given by ``y = 0,1,2,…,n`` and ``0 < \theta < 1``.
We find

$\begin{align*}
k_1(y) &= ∫_0^1 k(y,\theta) \,d\theta \\
&= \begin{pmatrix} n \\ y \end{pmatrix} \frac{\Gamma(\alpha + \beta)}{\Gamma(\alpha) \Gamma(\beta)} \frac{\Gamma(\alpha + y)\Gamma(n + \beta - y)}{\Gamma(n + \alpha + \beta)}
\end{align*}$

on the support ``y = 0,1,2,…,n`` by comparing the integral with one involving a beta pdf with parameters ``y + \alpha`` and ``n - y + \beta``.
Therefore,

$\begin{align*}
k(\theta ∣ y) &= \frac{k(y,\theta)}{k_1(y)} \\
&= \frac{\Gamma(n + \alpha + \beta)}{\Gamma(\alpha + y)\Gamma(n + \beta - y)} \theta^{y + \alpha - 1} (1 - \theta)^{n - y + \beta - 1}, \qquad 0 < \theta < 1,
\end{align*}$

which is a beta pdf with parameters ``y + \alpha`` and ``n - y + \beta``.
With the squared error loss function we must minimize, with respect to ``w(y)``, the integral

$∫_0^1 [\theta - w(y)]^2 k(\theta ∣ y)\,d\theta$

to obtain the Bayes estimator.
But, as noted earlier, if ``Z`` is a random variable with a second moment, then ``E[(Z - b)^2]`` is minimized by ``b = E(Z)``.
In the preceding integration, ``\theta`` is like the ``Z`` with pdf ``k(\theta ∣ y)``, and ``w(y)`` is like the ``b``, so the minimization is accomplished by taking

$w(y) = E(\theta ∣ y) = \frac{\alpha + y}{\alpha + \beta + n},$

which is the mean of the beta distribution with parameters ``y + \alpha`` and ``n - y + \beta``.
(See Exercise 5.2-8.)
It is instructive to note that this Bayes estimator can be written as

$w(y) = \left(\frac{n}{\alpha + \beta + n}\right) \left(\frac{y}{n}\right) + \left(\frac{\alpha + \beta}{\alpha + \beta + n}\right)\left(\frac{\alpha}{\alpha + \beta}\right)$

which is a weighte average of the maximum likelihood estimate ``y/n`` of ``\theta`` and the mean ``\alpha/(\alpha + \beta)`` of the prior pdf of the parameter.
"""

# ╔═╡ fe0a6eb6-ae6d-4921-be52-0dc117d4bcc2
md"# Interval Estimation"

# ╔═╡ 9af82ac6-67be-41ee-be0f-1bab4ad40da5
md"## Confidence Intervals for Means"

# ╔═╡ bd2feece-e5d9-46a2-82d3-6df82fcc4aa7
md"## Confidence Intervals for the Difference of Two Means"

# ╔═╡ daefca69-991f-4d85-a5d2-2014abf7ff74
md"## Confidence Intervals for Proportions"

# ╔═╡ e241634f-91c9-4826-96d8-7c7577a38557
md"## Sample Size"

# ╔═╡ 3aa7b48a-e44a-4585-9db1-d1a8a6e6c0b8
md"## Distribution-Free Confidence Intervals for Percentiles"

# ╔═╡ bc555c83-0898-4661-875e-dc4590bdbe97
md"## More Regression"

# ╔═╡ 8c08edc4-3795-4acb-a141-cecb193d218b
md"## Resampling Methods"

# ╔═╡ 31737899-0b43-4791-9e07-ace1f1d4243d
md"# Tests of Statistical Hypotheses"

# ╔═╡ 3b5a0df3-d3d0-415a-a880-8d2d106899ff
md"## Tests About One Mean"

# ╔═╡ 25392e96-739c-452d-b6ca-e7aee011d1bd
md"## Tests of the Equality of Two Means"

# ╔═╡ 3bfbf5c3-d916-40ff-99a0-319d18e859f8
md"## Tests for Variances"

# ╔═╡ 2e921818-e3ea-40e9-86f5-5fe6a3a7bc9c
md"## Tests About Proportions"

# ╔═╡ 1d131fb8-2626-459d-854d-347ee55db3df
md"## Some Distribution-Free Tests"

# ╔═╡ e434b6a6-54ab-4d92-a317-de9f135ce51f
md"## Some Distribution-Free Tests"

# ╔═╡ 429b8d26-d915-45f0-bf23-56b1630bb327
md"## Power of a Statistical Test"

# ╔═╡ 3b9f652d-3c0d-4902-9851-c02dca6f121e
md"## Best Critical Regions"

# ╔═╡ 286be071-36b7-4ee0-bcd6-a4712b0a900b
md"## Likelihood Ratio Tests"

# ╔═╡ 7b7d2ee6-6591-4415-af54-3d9caeadb880
md"# More Tests"

# ╔═╡ 5e11e212-1d0c-4e77-92f6-8684b9086a02
md"## Chi-Square Goodness-of-Fit Tests"

# ╔═╡ a8a8a615-c101-41c4-8b0c-9f87bc05dd33
md"## Contingency Tables"

# ╔═╡ d388f5f1-537f-4f86-8d71-13ad668f0303
md"## One-Factor Analysis of Variance"

# ╔═╡ cc95ef66-f6cc-4a17-8ff9-e054a52927d9
md"## Two-Way Analysis of Variance"

# ╔═╡ aaaccf4a-6210-4ff8-b93f-3455e7939805
md"## General Factorial and ``2^k`` Factorial Designs"

# ╔═╡ 3655f697-1329-48bb-a6b4-b3bbe359b612
md"## Tests Concerning Regression and Correlation"

# ╔═╡ 408b59b3-aa32-43e3-94ca-1bcf66c4718e
md"## Statistical Quality Control"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Distributions = "31c24e10-a181-5473-b8eb-7969acd0382f"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
QuadGK = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
SpecialFunctions = "276daf66-3868-5448-9aa4-cd146d93841b"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
Distributions = "~0.25.47"
PlutoUI = "~0.7.27"
QuadGK = "~2.4.2"
SpecialFunctions = "~2.1.4"
StatsBase = "~0.33.16"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "f9982ef575e19b0e5c7a98c6e75ee496c0f73a93"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.12.0"

[[ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "bf98fa45a0a4cee295de98d4c1462be26345b9a1"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.2"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "44c37b4636bc54afac5c574d2d02b625349d6582"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.41.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.0+0"

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "3daef5523dd2e769dad2365274f760ff5f282c7d"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.11"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "80c3e8639e3353e5d2912fb3a1916b8455e2494b"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.4.0"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "d6dc7e55eb64d9d2326436df15df9c8e4d8f1cd4"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.47"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "deed294cde3de20ae0b2e0355a6c4e1c6a5ceffc"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.12.8"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "a7254c0acd8e62f1ac75ad24d5db43f5f19f3c65"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.2"

[[IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.81.0+0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "e5718a00af0ab9756305a0392832c8952c7426c1"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.6"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.17+2"

[[OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "ee26b350276c51697c9c2d88a072b339f9f03d73"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.5"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "d7fa6237da8004be601e19bd6666083056649918"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.3"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "fed057115644d04fba7f4d768faeeeff6ad11a60"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.27"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "2cf929d64681236a2e074ffafb8d568733d2e6af"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.3"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "78aadffb3efd2155af139781b8a8df1ef279ea39"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.4.2"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "bf3188feca147ce108c76ad82c2792c57abe7b1f"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.0"

[[Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "68db32dff12bb6127bac73c209881191bf0efbb7"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.3.0+0"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "5ba658aeecaaf96923dce0da9e703bd1fe7666f9"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.4"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
git-tree-sha1 = "d88665adc9bcf45903013af0982e2fd05ae3d0a6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.2.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "8977b17906b0a1cc74ab2e3a05faa16cf08a8291"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.16"

[[StatsFuns]]
deps = ["ChainRulesCore", "InverseFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "f35e1879a71cca95f4826a14cdbf0b9e253ed918"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.15"

[[SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+1"

[[libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.0.1+0"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.41.0+1"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "16.2.1+1"
"""

# ╔═╡ Cell order:
# ╟─9ae2c51e-6bf4-11ec-0f2d-d39ceea4f3ad
# ╠═5f187c11-4e38-46ea-a88e-7023df008678
# ╠═f30d3dc5-b4f3-442a-bcc0-4b48dc0660fb
# ╟─17916bdf-017b-4efa-99f3-cb6f76c1cea3
# ╟─7467c574-4693-456f-9b46-d677724532f7
# ╟─c6d34659-4f43-4c64-883f-b83a88036159
# ╟─d48bbe41-b7ee-41b8-9ece-848f192e3aa2
# ╟─8c1fc2e8-10b9-4b1e-88a5-0fba8cf55000
# ╟─6fdb6d99-52ed-435d-b05e-e8b97333843f
# ╟─65937beb-366c-46ea-8d85-864316ea9abb
# ╟─d4c61e3e-1397-441d-a5c3-26bc26db17e1
# ╟─dd152770-b3ba-4aa3-b247-8e9bb6e9d95a
# ╟─ac9c887d-44a8-47b4-a841-9478a50d8c2f
# ╟─e140b068-926a-4270-8b26-1160ea55d03c
# ╟─f6574308-334e-4b18-ad39-bf7545b4831f
# ╟─82035fc0-d0c6-4875-b728-a74d91483b0b
# ╟─8b76e85b-51b1-477f-b3b9-a4c65db30b70
# ╟─a5c786a2-d377-4521-bce8-3bc93fd86246
# ╟─ba971c85-2ca2-4413-acfe-7f2039e97eca
# ╟─fe145b80-6698-409f-8c4a-ca48d6bceb63
# ╟─2e3e8f68-bae7-4fe9-a688-4b98aa1987a3
# ╟─debe1b3d-6007-450e-9eab-ff69386d68fc
# ╟─87aafbe7-d00b-4135-8ea4-6e6b1f40269e
# ╟─1f18abd2-9962-40f5-a081-bb9c94da727a
# ╟─1a96353b-e731-4c33-b220-53ff8bfc003b
# ╟─ac7893f4-0f1c-4381-837a-43a654178b29
# ╟─59e3ae19-3058-4f6c-9c94-6453aa8d6879
# ╟─93b2c23c-b157-40f5-971b-bb439ae41d54
# ╟─a4d285ff-55ed-431a-a3c2-d2905ba98bae
# ╟─9c6fb31e-5f68-4e37-aaca-773cce98338e
# ╟─b6894d71-7abb-4849-85c6-47d0724f1a50
# ╟─b9a2b325-5aa4-485a-9567-113716b798de
# ╟─4c7bd922-1ad5-4a0d-9549-948f568161cc
# ╟─15f822c9-c562-49ff-921e-6d9d7e8a0d31
# ╟─cf6b18aa-d363-4374-a94d-54b886bc9414
# ╟─2c66e416-b3e5-4374-aca7-ce9ca029bc0b
# ╟─8979a2b2-f723-4917-8687-a8e73e896d0b
# ╟─71bacdb8-a065-4291-a9e2-c10d0c4ad8ef
# ╟─18148d9e-eac8-45fb-abbd-4c14d4297af2
# ╟─da24892d-92f6-4b1a-b176-9458670210ca
# ╟─9563adfc-d1ca-4b3a-9290-da91fa685980
# ╟─9eb5a49b-4279-42f4-b770-15fbb2e069ef
# ╟─3cc52796-4761-45d8-b6c8-01267846a1c3
# ╟─441aa050-2bee-4dff-94b1-661eb7f90082
# ╟─13dedcd7-173b-4c27-bac8-2e78e10aab4f
# ╟─a38baf4d-134d-4e88-8d4e-af001d969ebe
# ╟─e6eeb08d-83d1-4422-9e1f-fbeef4d4de52
# ╟─266dde15-d71a-4838-99ee-7a6447ea1e74
# ╟─a0f5e36a-bafe-4b28-a3ed-c5765fbecf05
# ╟─9a26ac27-de2c-4120-a67f-aaeed3c9866e
# ╟─00f1203c-0553-4e5c-b083-a7c28a07c5f3
# ╟─fd54be4f-050b-4131-9a09-a42acdd3d2ef
# ╟─a8d07de0-ad5c-48d3-aad1-e954c4c8fa5a
# ╟─61091e25-9b51-4c30-843d-c2234102b206
# ╟─2ccbf7c3-4e48-4a48-a21c-9d69b1088cfd
# ╟─97601cd3-323a-4b82-abdf-0091dc1cffce
# ╟─108310b0-28de-4514-a030-9259438478b8
# ╟─d3f8736c-4ebe-4400-b8b9-b2e67f4861e7
# ╟─d90684b0-40de-4cc5-8811-1825f323bb04
# ╟─8f506a76-8228-4c11-8d6d-49e93fa8f5f3
# ╟─ec6c40dc-0837-4ad1-b726-030108cc27d1
# ╟─884ddbf6-bc5b-4b27-9220-18e914ef289f
# ╟─1e045280-10a8-4e16-a5ee-789471c70452
# ╠═63743680-bc86-4bb1-983b-699da0314cc4
# ╟─d3cb4108-f538-46b2-9770-4c0ef88ffd32
# ╟─89a7104f-7939-4204-bf68-80f633966024
# ╟─1a722326-d81e-41e1-afa2-4c682aecd686
# ╟─95d155dc-9b3c-491a-98fd-10a9f08adbad
# ╟─3e2bc715-fa46-48ab-97b8-8ef1639d4f0f
# ╟─3e9f68ab-35ae-4db0-af93-3ab002fc9f1e
# ╟─adcdddb0-4950-4eb8-b66d-e29d3ecaa5d2
# ╟─ec091e32-5f39-4dc3-af98-c30ddeea7a42
# ╟─01d1148f-0e81-4754-8bbd-40833864a797
# ╟─fb8205d9-81bf-4c26-a849-e6affd020401
# ╟─a62cd6eb-3b07-45e3-b983-149353ec4816
# ╟─12dbe67c-54cc-4ab4-b308-26cb1ee1718b
# ╟─b6ffd5ad-34d2-4241-987d-41e6a237cf82
# ╟─f1b4698a-5792-4a35-bb5a-ad54a8bbc0bd
# ╟─bddadb30-0576-4c14-825f-c01eb42d8772
# ╠═2fb55aac-b4f0-4444-aeb0-b16fd3bdd9eb
# ╟─c0440f44-1938-461c-8748-10232739dd6e
# ╟─2157fce2-b092-47d1-b2f9-31a947d7ebca
# ╟─7667564a-7978-4a59-b22c-dec90d4690fb
# ╟─d9c3b398-99b4-4cd9-be2d-955a510eb7d0
# ╟─e8b9ecbf-4fe5-4d60-93d3-26a4fb57fb7a
# ╟─d2d02acc-bdf7-4b54-98c5-39437d864c7c
# ╟─332dc70f-7263-479e-89a8-3cc3f23de326
# ╟─72724aa0-e5b1-4352-8843-66ba11544848
# ╟─cfa859bb-492d-48a9-ab64-a37f65992529
# ╟─d8f0a6ad-9534-4b52-9728-46a62d957919
# ╠═27e87a01-6639-4c3c-83d2-0311b776e8e3
# ╟─ead20df3-851d-40a5-bcf8-805802ac276b
# ╟─ad32ac6f-b606-4a3c-9922-4da0e920aa2f
# ╟─b438c46f-5e42-4697-89f9-73fbfe125401
# ╟─d3bd860f-1dc7-4fc4-a359-ab97e805b492
# ╟─b6784c09-8c0f-4dd7-bd2c-16879a59da43
# ╠═253f2b08-e242-45fa-9f23-4b30fb30c66b
# ╟─3e853a2e-a041-49ba-93e2-d04d00534059
# ╟─ed999075-ae21-4844-8cc8-5f07c48ad0ad
# ╟─6b9a82ab-b1b1-4261-a708-67b299c0201b
# ╟─3dc17679-def0-45fe-864d-5f1e2afd3318
# ╠═56c60823-8f76-4e05-b8e5-dba43de53965
# ╟─50010456-fd50-4694-9626-043e14a36b26
# ╟─7a2c151c-093c-4c3a-a56d-49ae3bd6bd7b
# ╟─4e942931-d05a-49fe-83ba-5b118167a593
# ╠═73a501d5-7e9f-48dc-95c3-2649cff638ea
# ╟─5ee333b3-f382-4fdf-9b79-b21e6345f97e
# ╟─ca4c127a-79a1-43d1-ac6c-61562cf05ad5
# ╟─673138a2-ec3a-4d02-a593-0e16d21a6a14
# ╟─760cd44b-f2db-4a81-97df-39d5221dbf4b
# ╟─b5cd0d95-3898-451a-94e2-03eac9299cb6
# ╟─efffb44d-efee-4bef-a112-d4ce15ab7963
# ╟─080a633d-d5ac-4a3d-b945-2b591848b060
# ╟─dc32a4b6-cc97-4f22-8597-95bbda720ef1
# ╟─2b8628af-356c-4e94-b067-418f7f568a75
# ╟─e385e0a2-e576-4054-9803-5abfcc2384b5
# ╟─3cd28a93-18fd-45b1-93ce-e8a40841ae9f
# ╟─4fb1973a-4778-4307-98ef-bbcfc656c194
# ╟─bae286da-9b75-4088-a18a-d926202c2102
# ╟─a0fd8c71-2e6e-4c99-ba9a-8ba214dfb97c
# ╟─ab33c0c8-067e-4fc6-9dc5-2409bca1b7fa
# ╟─acb9d239-0cef-450a-bb5c-01f75270b575
# ╟─e5efe8d4-8502-47fa-b8d8-05c1a0d0bdef
# ╟─9bb4a037-76e8-41e7-9fd0-dc6a2744633e
# ╟─3f304b71-b329-4f55-b4cf-02177feb4ea0
# ╟─7b595ff1-a863-4fae-a5ad-5f0bcbaf5992
# ╟─f223db10-2c37-4328-a434-52d5ada5573f
# ╟─f303c01e-98e5-4b52-ae42-9e96f00860cc
# ╠═065547c7-1d1a-41df-b0e9-13cc12949020
# ╟─24e93391-8f2f-482c-a2fb-9a61d5359974
# ╟─4b889a29-75ee-4674-8353-7bef532aa1ac
# ╟─12507705-6223-4907-b2f5-9d58e16d9cd5
# ╟─8f9d0785-a424-4d2c-9664-c6a5c1aa17f5
# ╟─fa79639f-d9fd-4302-b207-7cd753a9dd13
# ╟─ddf277be-08ed-4524-b2e1-100842c5f710
# ╟─b6df25b8-002a-4e86-b127-2717e5bb6110
# ╟─8a3f35e2-c23b-47e4-8878-4fd1b91baf7f
# ╟─ca80ecc7-801c-4cfc-950b-9fc21b188786
# ╟─b3f76000-57bd-4263-aa18-9f27d47a71a3
# ╟─81bd086c-84c7-43a2-b88e-9e66ce81e96a
# ╟─e72a9c5d-bf04-4470-8d20-f5370bf2f848
# ╟─a6f02478-71f8-4766-9678-cb59ad5f5914
# ╟─6c960246-2e3a-489c-9226-091a9a496182
# ╟─ce603a4b-d818-4e4b-9c96-b348cd7008d5
# ╟─4ceaf207-cef2-471e-a607-953d592177f3
# ╟─41fe6a4e-dac2-4f1f-b2ec-e4e950250839
# ╟─76d118b7-3f12-4bf5-83bd-046d6e2b19fb
# ╟─9d429275-9636-498d-85ce-8331e01f2a71
# ╟─5ac45834-83e1-4fa2-a380-1b27fca5553a
# ╟─f28e2dce-c812-4327-aca0-8bbf9e2bb193
# ╟─74fc2975-a50e-4a82-a0c8-2354eed57ced
# ╟─68e975cc-17e7-4307-8052-cc031fe16995
# ╟─e2b134ef-b588-4b5f-a0c1-8b410476f4e1
# ╟─cdc9dcf5-a616-46cb-8f13-0deb765cecc9
# ╟─1efe6c88-4743-45ea-b1a9-5a680d8b091e
# ╟─663f5fec-36a5-404d-abd4-67322be47d3a
# ╟─6121318a-5877-48f8-904a-97cbd065f302
# ╟─dccc93be-3273-429d-8ef0-1ff159cec322
# ╟─87c9f8cc-89fa-4baa-8007-13f2266bfe04
# ╟─39e2ca10-37e1-488b-b179-de3584587686
# ╟─a10f9e22-c240-498d-a034-d8d4dacfb394
# ╟─59fe4357-e514-4fd2-bfe8-3000874af5a2
# ╟─6db7dca8-90d0-4f37-a954-18c174e5576a
# ╟─5a6dd04f-fe83-4e7f-8702-6f987fca25fc
# ╟─97743636-e565-4cc9-9e67-0b390ff5cece
# ╟─1dcb45cd-f227-485b-8a30-8d2ac7498b0c
# ╟─4da80bc7-38d5-4b27-9470-dff05e4f625d
# ╟─382583c2-9d5d-47a9-92ca-2957eec06d1f
# ╟─23aa82dc-1afd-4e29-bc9f-6f4bea33274f
# ╟─30668f76-eff6-4c42-aaee-56d61ae8ebe5
# ╟─d6594feb-95cc-4fa1-acca-a4565b09791b
# ╟─83dff207-8aad-4450-9684-37514f61a2d8
# ╟─332936c2-60ee-4482-9417-866564b99b15
# ╟─76dba131-e802-43ac-9182-753c85847966
# ╟─140d557d-46c6-4bed-bbd8-72453c8b2030
# ╟─ac3a5f05-7abe-4e05-8a57-6535593d03d3
# ╟─f701da73-d195-4e4d-97d3-90f893ac40b0
# ╟─bab0fb94-dd20-4891-8303-d1059f864962
# ╟─8d79698e-b32f-4c35-8c6d-37b453ffe1f2
# ╟─d7aa06bf-0b98-4764-b93d-cf24ae6ce582
# ╟─eeaf29fb-7c30-427d-9f4e-ab6f1c9fb852
# ╟─44a92a5e-2c8c-4d56-ae13-40502a3413c8
# ╟─1ccf2815-5dcb-49c0-a887-bfcbe6363fa8
# ╟─85d7a375-7dd3-421f-afa5-4316565a308f
# ╟─3e48f5bd-9d1e-4636-a50e-97b542a6b175
# ╟─252e9085-4e3d-4dc1-aef1-78458ee4a7ba
# ╟─fd2628e3-9b8e-4b70-86f4-e3983d47d4c7
# ╟─a6303496-7aea-4c69-a22b-8d76a1ece3f1
# ╟─a1237be1-38cf-4100-a084-38ff97f244ee
# ╟─463b4bc4-0614-48a5-9e2f-f6228092e371
# ╟─1512723d-6dbf-480c-8c71-522ffafc91ce
# ╟─a99a8476-e168-4420-aa02-e29f368c36b2
# ╟─f4a6cf01-51b2-4a7a-a294-c402f82b8c5f
# ╟─5e95dbab-48de-4735-bf5b-86cb69fee34d
# ╟─7da66523-a483-4f0a-8ac6-ae3f78a2751a
# ╟─b612ddc9-978e-4bce-8ca2-8889c28c2f75
# ╟─6758379d-bf72-41a4-8674-8b646c7bacc8
# ╟─518c752d-22b9-422d-b3ff-2fdc1c8d4ccd
# ╟─9524bb97-356f-468d-9a14-bf0a26912ce2
# ╠═ae68f221-ae5d-4a61-a98f-26b575b02760
# ╠═b1f0adb6-acb5-4c7e-8952-a4018384f1ed
# ╠═c3862456-2e36-4f5f-900d-acd7e3ec770f
# ╟─2aeb27c2-8d3e-481b-8ee2-578708bfdccc
# ╟─39558531-2384-4340-bbbb-613405c4677a
# ╟─4b0c0943-66ce-4464-86f4-0435d09d3f76
# ╟─0cf175fc-26e0-4f89-83fa-78db01e52a09
# ╟─f07bc9b7-8b64-491d-8a20-67f269e7cc51
# ╟─e9de4281-52b6-41c8-86fb-c10d6cf13991
# ╟─66cefe18-52a7-4ae4-8618-e13181cea689
# ╟─fe0a6eb6-ae6d-4921-be52-0dc117d4bcc2
# ╠═9af82ac6-67be-41ee-be0f-1bab4ad40da5
# ╠═bd2feece-e5d9-46a2-82d3-6df82fcc4aa7
# ╠═daefca69-991f-4d85-a5d2-2014abf7ff74
# ╠═e241634f-91c9-4826-96d8-7c7577a38557
# ╠═3aa7b48a-e44a-4585-9db1-d1a8a6e6c0b8
# ╠═bc555c83-0898-4661-875e-dc4590bdbe97
# ╠═8c08edc4-3795-4acb-a141-cecb193d218b
# ╟─31737899-0b43-4791-9e07-ace1f1d4243d
# ╠═3b5a0df3-d3d0-415a-a880-8d2d106899ff
# ╠═25392e96-739c-452d-b6ca-e7aee011d1bd
# ╠═3bfbf5c3-d916-40ff-99a0-319d18e859f8
# ╠═2e921818-e3ea-40e9-86f5-5fe6a3a7bc9c
# ╠═1d131fb8-2626-459d-854d-347ee55db3df
# ╠═e434b6a6-54ab-4d92-a317-de9f135ce51f
# ╠═429b8d26-d915-45f0-bf23-56b1630bb327
# ╠═3b9f652d-3c0d-4902-9851-c02dca6f121e
# ╠═286be071-36b7-4ee0-bcd6-a4712b0a900b
# ╟─7b7d2ee6-6591-4415-af54-3d9caeadb880
# ╠═5e11e212-1d0c-4e77-92f6-8684b9086a02
# ╠═a8a8a615-c101-41c4-8b0c-9f87bc05dd33
# ╠═d388f5f1-537f-4f86-8d71-13ad668f0303
# ╠═cc95ef66-f6cc-4a17-8ff9-e054a52927d9
# ╠═aaaccf4a-6210-4ff8-b93f-3455e7939805
# ╠═3655f697-1329-48bb-a6b4-b3bbe359b612
# ╠═408b59b3-aa32-43e3-94ca-1bcf66c4718e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
