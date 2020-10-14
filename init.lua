minetest.register_chatcommand("vote_day", {
	privs = {
		interact = true
	},
	func = function(name, param)
  		if not minetest.get_player_by_name(name) then
			minetest.chat_send_player(name, "There is no player called '" ..
					param .. "'")
			return
		end

		vote.new_vote(name, {
			description = "Do you want set day" .. param,
			help = "/yes,  /no  or  /abstain",
			name = param,
			duration = 60,
			perc_needed = 0.8,

			on_result = function(self, result, results)
				if result == "yes" then
					minetest.chat_send_all("Vote passed, " ..
							#results.yes .. " to " .. #results.no .. ", " ..
							self.name .. "been changed to day.")
					minetest.set_timeofday((56000 % 24000) / 24000)
				else
					minetest.chat_send_all("Vote failed, " ..
							#results.yes .. " to " .. #results.no .. ", " ..
							self.name .. " remains ingame.")
				end
			end,

			on_vote = function(self, name, value)
				minetest.chat_send_all(name .. " voted " .. value .. " to '" ..
						self.description .. "'")
			end
		})
	end
})

minetest.register_chatcommand("vote_night", {
	privs = {
		interact = true
	},
	func = function(name, param)
		if not minetest.get_player_by_name(name) then
			minetest.chat_send_player(name, "There is no player called '" ..
					param .. "'")
			return
		end

		vote.new_vote(name, {
			description = "Do you want set night" .. param,
			help = "/yes,  /no  or  /abstain",
			name = param,
			duration = 60,
			perc_needed = 0.8,

			on_result = function(self, result, results)
				if result == "yes" then
					minetest.chat_send_all("Vote passed, " ..
							#results.yes .. " to " .. #results.no .. ", " ..
							self.name .. "been changed to night.")
					minetest.set_timeofday((20000 % 24000) / 24000)
				else
					minetest.chat_send_all("Vote failed, " ..
							#results.yes .. " to " .. #results.no .. ", " ..
							self.name .. " remains ingame.")
				end
			end,

			on_vote = function(self, name, value)
				minetest.chat_send_all(name .. " voted " .. value .. " to '" ..
						self.description .. "'")
			end
		})
	end
})

