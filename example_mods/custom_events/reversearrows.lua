
function onEvent(name, value1, value2)
	if name == "reversearrows" then

		if value1 == "1" then
			--ChangeMiddles
			if value2 == "1" then
				--MoveDad
				noteTweenX('reversedaarrow1', 0, defaultOpponentStrumX0, 0.2, "circInOut")
				noteTweenX('reversedaarrow2', 1, defaultOpponentStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow3', 2, defaultOpponentStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow4', 3, defaultOpponentStrumX3, 0.2, "circInOut")
			end
			if value2 == "2" then
				--MoveBF
				noteTweenX('reversedaarrow5', 4, defaultPlayerStrumX0, 0.2, "circInOut")
				noteTweenX('reversedaarrow6', 5, defaultPlayerStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow7', 6, defaultPlayerStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow8', 7, defaultPlayerStrumX3, 0.2, "circInOut")
			end
		end


		if value1 == "2" then
			--ChangeSides
			if value2 == "1" then
				--MoveDad
				noteTweenX('reversedaarrow1', 0, defaultOpponentStrumX3, 0.2, "circInOut")
				noteTweenX('reversedaarrow2', 1, defaultOpponentStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow3', 2, defaultOpponentStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow4', 3, defaultOpponentStrumX0, 0.2, "circInOut")
			end
			if value2 == "2" then
				--MoveBF
				noteTweenX('reversedaarrow5', 4, defaultPlayerStrumX3, 0.2, "circInOut")
				noteTweenX('reversedaarrow6', 5, defaultPlayerStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow7', 6, defaultPlayerStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow8', 7, defaultPlayerStrumX0, 0.2, "circInOut")
			end
		end


		if value1 == "3" then
			--ChangeAll
			if value2 == "1" then
				--MoveDad
				noteTweenX('reversedaarrow1', 0, defaultOpponentStrumX3, 0.2, "circInOut")
				noteTweenX('reversedaarrow2', 1, defaultOpponentStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow3', 2, defaultOpponentStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow4', 3, defaultOpponentStrumX0, 0.2, "circInOut")
			end
			if value2 == "2" then
				--MoveBF
				noteTweenX('reversedaarrow5', 4, defaultPlayerStrumX3, 0.2, "circInOut")
				noteTweenX('reversedaarrow6', 5, defaultPlayerStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow7', 6, defaultPlayerStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow8', 7, defaultPlayerStrumX0, 0.2, "circInOut")
			end

			
		end


		if value1 == "4" then
			--BackToNormal
			if value2 == "1" then
				--MoveDad
				noteTweenX('reversedaarrow1', 0, defaultOpponentStrumX0, 0.2, "circInOut")
				noteTweenX('reversedaarrow2', 1, defaultOpponentStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow3', 2, defaultOpponentStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow4', 3, defaultOpponentStrumX3, 0.2, "circInOut")
			end
			if value2 == "2" then
				--MoveBF
				noteTweenX('reversedaarrow5', 4, defaultPlayerStrumX0, 0.2, "circInOut")
				noteTweenX('reversedaarrow6', 5, defaultPlayerStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow7', 6, defaultPlayerStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow8', 7, defaultPlayerStrumX3, 0.2, "circInOut")
			end

			--BACK ALL
			if value2 == "3" then
				--MoveDAD's
				noteTweenX('reversedaarrow1', 0, defaultOpponentStrumX0, 0.2, "circInOut")
				noteTweenX('reversedaarrow2', 1, defaultOpponentStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow3', 2, defaultOpponentStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow4', 3, defaultOpponentStrumX3, 0.2, "circInOut")

				--MoveBF's
				noteTweenX('reversedaarrow5', 4, defaultPlayerStrumX0, 0.2, "circInOut")
				noteTweenX('reversedaarrow6', 5, defaultPlayerStrumX1, 0.2, "circInOut")
				noteTweenX('reversedaarrow7', 6, defaultPlayerStrumX2, 0.2, "circInOut")
				noteTweenX('reversedaarrow8', 7, defaultPlayerStrumX3, 0.2, "circInOut")

			end
		end
		
	end
end
