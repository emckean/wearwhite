class BirthdayCountdown
  
  # Cache @month, @day and @year on initialization
  def initialize(month, day)
    @birthday_month = month
    @birthday_day = day
    
    # Current date
    @month = Time.now.month
    @day = Time.now.day
    @year = Time.now.year    
  end
  
  # Is it birthday?
  def isit?
    @month == @birthday_month && @day == @birthday_day
  end

  # For the countdown
  def seconds_to_go
    next_birthday.to_i - Time.now.to_i
  end
  
  # Is is the current month after the birthday month?
  def passed_birthday_month?
    @month > @birthday_month
  end
  
  # Is the current month the same month as the birthday month
  # and the day
  def passed_birthday_day?
     @month == @birthday_month && @day > @birthday_day
  end
  
  # Happened this year
  def already_happend?
    passed_birthday_month? || passed_birthday_day?
  end
  
  # Returns the next birthday
  def next_birthday
    if already_happend?
      # Add 1 year if it's already happened
      Time.mktime(@year + 1 , @birthday_month, @birthday_day) 
    else
      # Create this years date
      Time.mktime(@year, @birthday_month, @birthday_day)
    end
  end

  #Returns the view needed for Sinatra to present
  def to_view
      isit? ? :yes : :no
  end
 
end