class Bottles
  attr_accessor :current, :remaining

  def current_bottles
    bottles_current = @current == 1 ? "bottle" : "bottles"

    current_prefix = @current == 0 ? "no more" : @current

    "#{current_prefix} #{bottles_current}"
  end

  def remaining_bottles
    bottles_remaining = @remaining == 1 ? "bottle" : "bottles"

    remaining_prefix = @remaining == 0 ? "no more" : @remaining

    "#{remaining_prefix} #{bottles_remaining}"
  end

  def take_num_down
    to_take = @current == 1 ? "it" : "one"

    "Take #{to_take} down"
  end

  def final_action
    return "Go to the store and buy some more" if @current == 0

    "#{take_num_down} and pass it around"
  end

  def verse(num_bottles)
    @current = num_bottles
    @remaining = num_bottles == 0 ? 99 : num_bottles - 1

    [
      "#{current_bottles.capitalize()} of beer on the wall, #{current_bottles} of beer.\n",
      "#{final_action}, #{remaining_bottles} of beer on the wall.\n"
    ].join()
    # TODO: which I could join by newline
  end

  def verses(high, low)
    descending_numbers = [*low..high].reverse()

    verses = descending_numbers.map do |number|
      Bottles.new.verse(number)
    end

    verses.join("\n")
  end

  def song
    verses(99, 0)
  end
end

# Side note: I've song this song so much in my head already