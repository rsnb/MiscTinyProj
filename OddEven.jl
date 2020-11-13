### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ 63dfaace-247d-11eb-28bc-638c112cbad4
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add("Plots")
	using Plots
	# Pkg.add("UnicodePlots")
	# unicodeplots()
end

# ╔═╡ bbda9cf2-247b-11eb-3adc-a57a35c44931
md"""# A Problem from Spivak's Calculus

### Chapter 3 Problem 13 (a)
"""

# ╔═╡ 123169fa-255a-11eb-046a-a98c310569c9
md"""
> Prove that any function $f$ with domain $\mathbb{R}$ can be written $f = E + O$ where $E$ is even and $O$ is odd.
"""

# ╔═╡ d2422c0a-247b-11eb-2e14-6dccc0b20231
md"An even function is one for which $f(x) = f(-x)$ for all $x \in \mathbb{R}$. These look \"balanced\" about the $y$ axis. A few examples of even functions:"

# ╔═╡ 2059c0ac-255c-11eb-1cb0-ed08f1d7a831
begin
	pFlat = plot(x -> 5)
	pCos = plot(cos)
	pSquare = plot(x->x^2)
	pAbs = plot(x -> abs(x))
	plot(pFlat, pSquare, pCos, pAbs, layout=(2,2))
end

# ╔═╡ e5acfe74-255b-11eb-29a5-b98b57c87eb3
md"An odd function is one for which $f(x) = -f(-x)$ for all $x \in \mathbb{R}$. These look \"rotated\" about the origin. A few examples:"

# ╔═╡ 88a3cfd8-2564-11eb-0ea7-0de9ed658af4
begin
	pId = plot(identity)
	pSin = plot(sin)
	pCube = plot(x->x^3 - 5x)
	pHyp = plot(x -> 1/x, ylim=(-5, 5))
	plot(pId, pSin, pHyp, pCube, layout=(2,2))
end

# ╔═╡ 007c2b5a-2569-11eb-34d1-07deacc120e1
md"""
Many functions are neither even nor odd. One function is both even and odd.
"""

# ╔═╡ 7b3c7dde-2566-11eb-3204-1f5f66f14471
md"""
### The solution:
"""

# ╔═╡ 2bea7b1c-2540-11eb-059f-ff33c81f6252
function evenize(f)
	function(x)
		(f(x) + f(-x))/2
	end
end

# ╔═╡ dfbba234-2541-11eb-3b49-53288345a34a
function oddize(f)
	function(x)
		(f(x) - f(-x))/2
	end
end

# ╔═╡ 33b20f42-256b-11eb-0a3e-3d2f6f5738b3
md"Here's an example function:"

# ╔═╡ 09ee4f78-2542-11eb-3f03-ff6a70c3f588
function strange(x)
	2cos(x^2) - 0.25x^2 + x + log(abs(x)) + 0.001x^5
end

# ╔═╡ c1233c86-2541-11eb-38ef-ddba94c0a640
pp = plot(strange, title="Function")

# ╔═╡ d1190d5e-2542-11eb-2603-0b3677bca779
pOdd = plot(oddize(strange), title="Odd part")

# ╔═╡ d6666f68-2542-11eb-25ca-83c3a760c990
pEven = plot(evenize(strange), title="Even part")

# ╔═╡ e07011fc-2543-11eb-1e1f-07a4f8681666
pSum = plot((x) -> oddize(strange)(x) + evenize(strange)(x), title="Even part + Odd part")

# ╔═╡ 7596b31e-256a-11eb-0dcd-9922d64b941b
md"All together in one plot:"

# ╔═╡ 85d17edc-2568-11eb-0760-c71f5edef23d
plot(pOdd, pEven, pp, pSum, layout=(2, 2))

# ╔═╡ Cell order:
# ╟─bbda9cf2-247b-11eb-3adc-a57a35c44931
# ╟─123169fa-255a-11eb-046a-a98c310569c9
# ╟─d2422c0a-247b-11eb-2e14-6dccc0b20231
# ╟─2059c0ac-255c-11eb-1cb0-ed08f1d7a831
# ╟─e5acfe74-255b-11eb-29a5-b98b57c87eb3
# ╟─88a3cfd8-2564-11eb-0ea7-0de9ed658af4
# ╟─007c2b5a-2569-11eb-34d1-07deacc120e1
# ╟─7b3c7dde-2566-11eb-3204-1f5f66f14471
# ╠═2bea7b1c-2540-11eb-059f-ff33c81f6252
# ╠═dfbba234-2541-11eb-3b49-53288345a34a
# ╟─33b20f42-256b-11eb-0a3e-3d2f6f5738b3
# ╠═09ee4f78-2542-11eb-3f03-ff6a70c3f588
# ╟─c1233c86-2541-11eb-38ef-ddba94c0a640
# ╟─d1190d5e-2542-11eb-2603-0b3677bca779
# ╟─d6666f68-2542-11eb-25ca-83c3a760c990
# ╟─e07011fc-2543-11eb-1e1f-07a4f8681666
# ╟─7596b31e-256a-11eb-0dcd-9922d64b941b
# ╠═85d17edc-2568-11eb-0760-c71f5edef23d
# ╟─63dfaace-247d-11eb-28bc-638c112cbad4
