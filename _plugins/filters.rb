module Jekyll
  module CustomFilters
    def by_paragraph(input)
      input.to_s.split(/\n\s*\n/)
    end

    def re_split(input)
      input.to_s.split(Regexp.new(input))
    end

    def randoms(input, min, max)
      min = min.to_f
      max = max.to_f
      input = input.to_f

      if input == 1 then
        Random.rand(min..max)
      else
        Array.new(input.to_i) { Random.rand(min..max) }
      end
    end
  end

  class RandomTag < Liquid::Tag
    def initialize(input, args, tokens)
      super
      
      args = args.split(/,\s*/)

      if args.length != 3 then
        raise "expecting \\d+, \\d+, \\d+"
      end
      
      @n = args[0].to_i
      @min = args[1].to_i
      @max = args[2].to_i
    end

    def render(context)
      if @n == 1 then
        Random.rand(@min..@max)
      else
        Array.new(@n) { Random.rand(@min..@max) } 
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)
Liquid::Template.register_tag("random", Jekyll::RandomTag)

