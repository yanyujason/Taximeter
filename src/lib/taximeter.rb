class Taximeter

  def initialize (kilometer, minute)
    @kilometer = kilometer
    @minute = minute
  end

  def calculate_price
    if @kilometer < 2
      under_two_km @minute
    elsif @kilometer >= 2 && @kilometer < 8
      between_two_and_eight_km @kilometer, @minute
    elsif @kilometer >= 8
      beyond_eight_km @kilometer, @minute
    end
  end

  private
  def under_two_km (minute = 0)
    round (6 + waiting_price(minute))
  end

  def between_two_and_eight_km (kilometer, minute = 0)
    kilometers = roll_up kilometer
    round (6 + ( ( kilometers - 2 ) * 0.8 ) + (waiting_price minute))
  end

  def beyond_eight_km (kilometer, minute = 0)
    kilometers = roll_up kilometer
    round (11.6 + ( ( kilometers - 8 ) * 1.2 ) + (waiting_price minute))
  end

  def roll_up (num)
    if num.class == Fixnum && num != 0
      num + 1
    else
      num.ceil
    end
  end

  def round (price)
    price.round(0)
  end

  def waiting_price (minute)
    minutes = roll_up minute
    minutes * 0.25
  end

end