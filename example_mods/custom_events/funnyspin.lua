local Spin = 360
local Rest = 0

function onEvent(name, value1, value2)
	if name == "funnyspin" then

		if getProperty('SONG.song' == 'another-one') then
			Rest = 0.5
		else
			Rest = 0
		end

		if value1 == "1" then
			--SpinDad
			noteTweenAngle('spindanote1', 0, Spin, value2, "circInOut");
			noteTweenAngle('spindanote2', 1, Spin, value2, "circInOut");
			noteTweenAngle('spindanote3', 2, Spin, value2, "circInOut");
			noteTweenAngle('spindanote4', 3, Spin, value2, "circInOut");

			--Spin = Spin + 360;
		end
		if value1 == "2" then
			--SpinBF
			noteTweenAngle('spindanote5', 4, Spin, value2, "circInOut");
			noteTweenAngle('spindanote6', 5, Spin, value2, "circInOut");
			noteTweenAngle('spindanote7', 6, Spin, value2, "circInOut");
			noteTweenAngle('spindanote8', 7, Spin, value2, "circInOut");
			--Spin = Spin + 360;
		end

		if value1 == "3" then
			--Spin Both
			runTimer(endme, value2, 1)
			noteTweenAngle('spindanote1', 0, 360, value2-Rest, "circInOut");
			noteTweenAngle('spindanote2', 1, 360, value2-Rest, "circInOut");
			noteTweenAngle('spindanote3', 2, 360, value2-Rest, "circInOut");
			noteTweenAngle('spindanote4', 3, 360, value2-Rest, "circInOut");
			noteTweenAngle('spindanote5', 4, 360, value2-Rest, "circInOut");
			noteTweenAngle('spindanote6', 5, 360, value2-Rest, "circInOut");
			noteTweenAngle('spindanote7', 6, 360, value2-Rest, "circInOut");
			noteTweenAngle('spindanote8', 7, 360, value2-Rest, "circInOut");


			--Spin = Spin + 360;
		end

	end
end

function onTimerCompleted(endme)
	noteTweenAngle('GOBACKDAMMIT', 0, 0, 0.00001, "linear");
	noteTweenAngle('1GOBACKDAMMIT', 1, 0, 0.00001, "linear");
	noteTweenAngle('2GOBACKDAMMIT', 2, 0, 0.00001, "linear");
	noteTweenAngle('3GOBACKDAMMIT', 3, 0, 0.00001, "linear");
	noteTweenAngle('4GOBACKDAMMIT', 4, 0, 0.00001, "linear");
	noteTweenAngle('5GOBACKDAMMIT', 5, 0, 0.00001, "linear");
	noteTweenAngle('6GOBACKDAMMIT', 6, 0, 0.00001, "linear");
	noteTweenAngle('7GOBACKDAMMIT', 7, 0, 0.00001, "linear");
end
