### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ ca7438a4-3e5e-11eb-2104-2f16725ad011
begin
	import Random
	using Plots
	md"Imports"
end

# ╔═╡ d5ff5d1a-3e8c-11eb-1121-47e4fde23c71
md"""
# Demo from ergodicity economics

Ole Peters uses the following example to demonstrate ergodicity vs non-ergodicity in an economic context:

- Start with $x$ dollars
- Flip a coin
- If heads, gain $0.5x$ more dollars
- If tails, lose $0.4x$ dollars
- Repeat several times using this new total as the starting point for the next iteration

The expected value of this game is clearly positive, but, counterintuitively, virtually all players will lose money steadily.

Note that all graphs have a logarithmic y axis.

Here is the simulation:
"""

# ╔═╡ 72f63814-3e60-11eb-15f0-1de23711e73b
function trial(num_flips, wealth=BigFloat(100.0))
	flips = Random.bitrand(num_flips)
	amounts = zeros(BigFloat, num_flips)
	for i in 1:num_flips
		wealth *= flips[i] ? 1.5 : 0.6
		amounts[i] = wealth
	end
	amounts
end

# ╔═╡ b0a1e8ba-3e8e-11eb-342a-7baae634b9c0
md"Using `BigFloat`s just in case."

# ╔═╡ f7ee2c7a-3e60-11eb-05c9-3d7bcef4b813
plot(trial(50), yaxis=:log)

# ╔═╡ 0f261b90-3e8f-11eb-3411-fd81d1fcf6e9
md"Looks pretty random. Let's run multiple trials for a while to get a sense of the behavior:"

# ╔═╡ 0a72447e-3e63-11eb-01c4-576df971fbe5
begin
	long_trial_count = 25
	long_trial_flips = 10_000
	
	long_trials = [trial(long_trial_flips) for _ in 1:long_trial_count]
	
	p = plot(yaxis=:log, legend=false)
	for trial in long_trials
		plot!(p, trial)
	end
	p
end

# ╔═╡ d63c6d68-3e8f-11eb-31ff-4d357226e48b
md"They all tend downward. Now what happens if we average many short trials?"

# ╔═╡ 817d7568-3e61-11eb-28bb-11bd3e21d8a0
begin
	many_trials_count = 50_000
	many_trials_flips = 100
	
	trials = [trial(many_trials_flips) for _ in 1:many_trials_count]
	avgs = sum(trials)/many_trials_count
	
	plot(avgs, yaxis=:log)
end

# ╔═╡ a2216c1e-3e90-11eb-3f37-b92ca1a865d3
md"Increases steadily upwards just like the expected value would predict."

# ╔═╡ Cell order:
# ╟─d5ff5d1a-3e8c-11eb-1121-47e4fde23c71
# ╠═72f63814-3e60-11eb-15f0-1de23711e73b
# ╟─b0a1e8ba-3e8e-11eb-342a-7baae634b9c0
# ╠═f7ee2c7a-3e60-11eb-05c9-3d7bcef4b813
# ╟─0f261b90-3e8f-11eb-3411-fd81d1fcf6e9
# ╠═0a72447e-3e63-11eb-01c4-576df971fbe5
# ╟─d63c6d68-3e8f-11eb-31ff-4d357226e48b
# ╠═817d7568-3e61-11eb-28bb-11bd3e21d8a0
# ╟─a2216c1e-3e90-11eb-3f37-b92ca1a865d3
# ╟─ca7438a4-3e5e-11eb-2104-2f16725ad011
