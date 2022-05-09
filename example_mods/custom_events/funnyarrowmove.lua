local noteOffset = 75

function onEvent(name, value1, value2)
	if name == "funnyarrowmove" then

		if value1 == "1" then
			--MoveDad
			if value2 == "1" then
				
				noteTweenX('movedanote1', 0, defaultOpponentStrumX0-(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote2', 1, defaultOpponentStrumX1-(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote3', 2, defaultOpponentStrumX2-(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote4', 3, defaultOpponentStrumX3-(noteOffset), 0.1, "bounceInOut")

				noteTweenAngle('A', 0, -30, 0.15, 'bounceInOut')
				noteTweenAngle('B', 1, -35, 0.15, 'bounceInOut')
				noteTweenAngle('C', 2, -40, 0.15, 'bounceInOut')
				noteTweenAngle('D', 3, -45, 0.15, 'bounceInOut')
			end
			if value2 == "2" then
				
				noteTweenX('movedanote1', 0, defaultOpponentStrumX0+(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote2', 1, defaultOpponentStrumX1+(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote3', 2, defaultOpponentStrumX2+(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote4', 3, defaultOpponentStrumX3+(noteOffset), 0.1, "bounceInOut")

				noteTweenAngle('5A', 0, 30, 0.15, 'bounceInOut')
				noteTweenAngle('5B', 1, 35, 0.15, 'bounceInOut')
				noteTweenAngle('5C', 2, 40, 0.15, 'bounceInOut')
				noteTweenAngle('5D', 3, 45, 0.15, 'bounceInOut')
			end

			if value2 == "3" then
				
				noteTweenX('movedanote1', 0, defaultOpponentStrumX0, 0.1, "bounceInOut")
				noteTweenX('movedanote2', 1, defaultOpponentStrumX1, 0.1, "bounceInOut")
				noteTweenX('movedanote3', 2, defaultOpponentStrumX2, 0.1, "bounceInOut")
				noteTweenX('movedanote4', 3, defaultOpponentStrumX3, 0.1, "bounceInOut")

				noteTweenAngle('3A', 0, 0, 0.15, 'bounceInOut')
				noteTweenAngle('3B', 1, 0, 0.15, 'bounceInOut')
				noteTweenAngle('3C', 2, 0, 0.15, 'bounceInOut')
				noteTweenAngle('3D', 3, 0, 0.15, 'bounceInOut')
			end
		end

		if value1 == "2" then
			--MoveBF
			if value2 == "1" then
				
				noteTweenX('movedanote5', 4, defaultPlayerStrumX0-(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote6', 5, defaultPlayerStrumX1-(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote7', 6, defaultPlayerStrumX2-(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote8', 7, defaultPlayerStrumX3-(noteOffset), 0.1, "bounceInOut")

				noteTweenAngle('2A', 4, -30, 0.15, 'bounceInOut')
				noteTweenAngle('2B', 5, -35, 0.15, 'bounceInOut')
				noteTweenAngle('2C', 6, -40, 0.15, 'bounceInOut')
				noteTweenAngle('2D', 7, -45, 0.15, 'bounceInOut')
			end
			if value2 == "2" then
				
				noteTweenX('movedanote5', 4, defaultPlayerStrumX0+(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote6', 5, defaultPlayerStrumX1+(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote7', 6, defaultPlayerStrumX2+(noteOffset), 0.1, "bounceInOut")
				noteTweenX('movedanote8', 7, defaultPlayerStrumX3+(noteOffset), 0.1, "bounceInOut")

				noteTweenAngle('6A', 4, 30, 0.15, 'bounceInOut')
				noteTweenAngle('6B', 5, 35, 0.15, 'bounceInOut')
				noteTweenAngle('6C', 6, 40, 0.15, 'bounceInOut')
				noteTweenAngle('6D', 7, 45, 0.15, 'bounceInOut')
			end

			if value2 == "3" then
				
				noteTweenX('movedanote5', 4, defaultPlayerStrumX0, 0.1, "bounceInOut")
				noteTweenX('movedanote6', 5, defaultPlayerStrumX1, 0.1, "bounceInOut")
				noteTweenX('movedanote7', 6, defaultPlayerStrumX2, 0.1, "bounceInOut")
				noteTweenX('movedanote8', 7, defaultPlayerStrumX3, 0.1, "bounceInOut")

				noteTweenAngle('4A', 4, 0, 0.15, 'bounceInOut')
				noteTweenAngle('4B', 5, 0, 0.15, 'bounceInOut')
				noteTweenAngle('4C', 6, 0, 0.15, 'bounceInOut')
				noteTweenAngle('4D', 7, 0, 0.15, 'bounceInOut')
			end
		end
	end
end
