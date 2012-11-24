module Base62
	SIXTYTWO = ['p','V','m','3','r','6','G','0','h','U','H','C','A','z','E','2','q','T','Q','Z','N','Y','8','5','D','c','g','I','1','v','w','j','n','J','4','a','b','B','i','R','e','s','X','u','d','x','S','o','M','f','F','P','7','L','k','l','W','y','O','t','9','K']

	def encode( numeric )
		raise ArgumentError unless Numeric === numeric

		return '0' if numeric == 0
		s = ''

		while numeric > 0
			s << Base62::SIXTYTWO[numeric.modulo(62)]
			numeric /= 62
		end
		s.reverse
	end

	def decode( base62 )
		s = base62.to_s.reverse.split('')

		total = 0
		s.each_with_index do |char, index|
			if ord = SIXTYTWO.index(char)
				total += ord * (62 ** index)
			else
				raise ArgumentError, "#{base62} has #{char} which is not valid"
			end
		end
		total.to_s
	end

	module_function :encode, :decode
end