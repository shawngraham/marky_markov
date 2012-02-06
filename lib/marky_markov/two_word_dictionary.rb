require_relative 'one_word_dictionary'

class TwoWordDictionary < OneWordDictionary
  def parse_source(source, file=true)
    contents = file ? open_source(source) : contents = source.split
    contents.each_cons(3) do |first, second, third|
       self.add_word("#{first} #{second}", third)
    end
    @dictionary[contents.last(2).join(' ')] ||= Hash.new(0)
  end
end
