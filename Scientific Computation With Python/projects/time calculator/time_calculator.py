class Time:
  HOURS_IN_A_DAY = 24
  MINUTES_IN_A_HOUR = 60
  DAYS_IN_A_WEEK = 7

  DAYS_OF_WEEK = [
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
  ]

  def __init__(self, time_string="00:00", day_of_week=None):
    if "AM" in time_string or "PM" in time_string:
      self.am_pm_info = time_string[-2:]
      hours, minutes = time_string[:-3].split(':')
    else:
      self.am_pm_info = ""
      hours, minutes = time_string.split(':')

    self.hours, self.minutes, self.days, self.weekday = int(hours), int(
      minutes), 0, day_of_week

    if self.am_pm_info == "PM":
      self.hours += 12
      self.am_pm_info = ""

  def __add__(self, otherObj):
    temp = Time()
    temp.weekday = self.weekday
    temp.minutes = self.hours * Time.MINUTES_IN_A_HOUR + self.minutes + otherObj.hours * Time.MINUTES_IN_A_HOUR + otherObj.minutes
    return temp

  def __str__(self):
    time_info = f"{self.hours}:{self.minutes:02}{' ' if self.am_pm_info else ''}{self.am_pm_info}"
    if self.weekday is not None:
      weekday = Time.DAYS_OF_WEEK[
        (Time.DAYS_OF_WEEK.index(self.weekday.lower()) + self.days) %
        7].capitalize()
      time_info += f", {weekday}"
    day_info = " (next day)" if self.days == 1 else f"{' ('+str(self.days)+' days later)'+'' if self.days!=0 else ''}"

    return time_info + day_info

  def adjust_time(self):
    self.hours += self.minutes // Time.MINUTES_IN_A_HOUR
    self.days = (self.days + self.hours // Time.HOURS_IN_A_DAY)
    self.hours %= Time.HOURS_IN_A_DAY
    self.minutes %= Time.MINUTES_IN_A_HOUR

    if self.hours < 12:
      self.am_pm_info = "AM"
      self.hours = 12 if self.hours == 0 else self.hours
    else:
      self.am_pm_info = "PM"
      if self.hours > 12:
        self.hours -= 12


def add_time(start, duration, current_day=None):
  start_time = Time(start, current_day)
  time_delta = Time(duration)
  t3 = start_time + time_delta
  t3.adjust_time()
  return str(t3)


# add_time("11:55 AM", "3:12")
