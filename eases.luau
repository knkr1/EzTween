local eases = {
	["easeInSine"] = {
		Get = function(x)
			return 1 - math.cos((x * math.pi) / 2)
		end,
	},
	["easeOutSine"] = {
		Get = function(x)
			return math.sin((x * math.pi) / 2)
		end,
	},
	["easeInOutSine"] = {
		Get = function(x)
			return -(math.cos(math.pi * x) - 1) / 2
		end,
	},
	["easeInCubic"] = {
		Get = function(x)
			return x * x * x
		end,
	},
	["easeOutCubic"] = {
		Get = function(x)
			return 1 - math.pow(1 - x, 3)
		end,
	},
	["easeInOutCubic"] = {
		Get = function(x)
			return x < 0.5 and 4 * x * x * x or 1 - math.pow(-2 * x + 2, 3) / 2
		end,
	},
	["easeInQuint"] = {
		Get = function(x)
			return x * x * x * x * x
		end,
	},
	["easeOutQuint"] = {
		Get = function(x)
			return 1 - math.pow(1 - x, 5)
		end,
	},
	["easeInOutQuint"] = {
		Get = function(x)
			return x < 0.5 and 16 * x * x * x * x * x or 1 - math.pow(-2 * x + 2, 5) / 2
		end,
	},
	["easeInCirc"] = {
		Get = function(x)
			return 1 - math.sqrt(1 - math.pow(x, 2))
		end,
	},
	["easeOutCirc"] = {
		Get = function(x)
			return math.sqrt(1 - math.pow(x - 1, 2))
		end,
	},
	["easeInOutCirc"] = {
		Get = function(x)
			return x < 0.5 and (1 - math.sqrt(1 - math.pow(2 * x, 2))) / 2
				or (math.sqrt(1 - math.pow(-2 * x + 2, 2)) + 1) / 2
		end,
	},
	["easeInElastic"] = {
		Get = function(x)
			local c4 = (2 * math.pi) / 3
			if x == 0 then
				return 0
			elseif x == 1 then
				return 1
			else
				return -math.pow(2, 10 * x - 10) * math.sin((x * 10 - 10.75) * c4)
			end
		end,
	},
	["easeOutElastic"] = {
		Get = function(x)
			local c4 = (2 * math.pi) / 3
			if x == 0 then
				return 0
			elseif x == 1 then
				return 1
			else
				return math.pow(2, -10 * x) * math.sin((x * 10 - 0.75) * c4) + 1
			end
		end,
	},
	["easeInOutElastic"] = {
		Get = function(x)
			local c5 = (2 * math.pi) / 4.5
			if x == 0 then
				return 0
			elseif x == 1 then
				return 1
			elseif x < 0.5 then
				return -(math.pow(2, 20 * x - 10) * math.sin((20 * x - 11.125) * c5)) / 2
			else
				return (math.pow(2, -20 * x + 10) * math.sin((20 * x - 11.125) * c5)) / 2 + 1
			end
		end,
	},
	["easeInQuad"] = {
		Get = function(x)
			return x * x
		end,
	},
	["easeOutQuad"] = {
		Get = function(x)
			return 1 - (1 - x) * (1 - x)
		end,
	},
	["easeInOutQuad"] = {
		Get = function(x)
			return x < 0.5 and 2 * x * x or 1 - math.pow(-2 * x + 2, 2) / 2
		end,
	},
	["easeInQuart"] = {
		Get = function(x)
			return x * x * x * x
		end,
	},
	["easeOutQuart"] = {
		Get = function(x)
			return 1 - math.pow(1 - x, 4)
		end,
	},
	["easeInOutQuart"] = {
		Get = function(x)
			return x < 0.5 and 8 * x * x * x * x or 1 - math.pow(-2 * x + 2, 4) / 2
		end,
	},
	["easeInExpo"] = {
		Get = function(x)
			return x == 0 and 0 or math.pow(2, 10 * x - 10)
		end,
	},
	["easeOutExpo"] = {
		Get = function(x)
			return x == 1 and 1 or 1 - math.pow(2, -10 * x)
		end,
	},
	["easeInOutExpo"] = {
		Get = function(x)
			if x == 0 then
				return 0
			elseif x == 1 then
				return 1
			elseif x < 0.5 then
				return math.pow(2, 20 * x - 10) / 2
			else
				return (2 - math.pow(2, -20 * x + 10)) / 2
			end
		end,
	},
	["easeInBack"] = {
		Get = function(x)
			local c1 = 1.70158
			local c3 = c1 + 1
			return c3 * x * x * x - c1 * x * x
		end,
	},
	["easeOutBack"] = {
		Get = function(x)
			local c1 = 1.70158
			local c3 = c1 + 1
			return 1 + c3 * math.pow(x - 1, 3) + c1 * math.pow(x - 1, 2)
		end,
	},
	["easeInOutBack"] = {
		Get = function(x)
			local c1 = 1.70158
			local c2 = c1 * 1.525
			if x < 0.5 then
				return (math.pow(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) / 2
			else
				return (math.pow(2 * x - 2, 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2
			end
		end,
	},
	["easeOutBounce"] = {
		Get = function(x)
			local n1 = 7.5625
			local d1 = 2.75
			if x < 1 / d1 then
				return n1 * x * x
			elseif x < 2 / d1 then
				return n1 * (x - 1.5 / d1) * x + 0.75
			elseif x < 2.5 / d1 then
				return n1 * (x - 2.25 / d1) * x + 0.9375
			else
				return n1 * (x - 2.625 / d1) * x + 0.984375
			end
		end,
	},
    --Could be false
	["easeInOutBounce"] = {
        Get = function(x)
            local n1 = 7.5625
            local d1 = 2.75
            local x1, x2
            if x < 0.5 then
                x1 = 1 - 2 * x
                return (1 - (function(x)
                    if x < 1 / d1 then
                        return n1 * x * x
                    elseif x < 2 / d1 then
                        return n1 * (x - 1.5 / d1) * x + 0.75
                    elseif x < 2.5 / d1 then
                        return n1 * (x - 2.25 / d1) * x + 0.9375
                    else
                        return n1 * (x - 2.625 / d1) * x + 0.984375
                    end
                end)(x1)) / 2
            else
                x2 = 2 * x - 1
                return (1 + (function(x)
                    if x < 1 / d1 then
                        return n1 * x * x
                    elseif x < 2 / d1 then
                        return n1 * (x - 1.5 / d1) * x + 0.75
                    elseif x < 2.5 / d1 then
                        return n1 * (x - 2.25 / d1) * x + 0.9375
                    else
                        return n1 * (x - 2.625 / d1) * x + 0.984375
                    end
                end)(x2)) / 2
            end
        end
    },
    
}

return eases