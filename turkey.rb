require "active_support/time"
require "tzinfo"
require "highline/import"

module Turkey
  def tz
    TZInfo::Timezone.get('America/New_York')
  end

  def weight_to_minutes(weight)
    (weight * 10).minutes
  end

  def turkey_add_in()
    60.minutes
  end

  def turkey_calc(weight)
    duration = weight_to_minutes(weight) + turkey_add_in
    duration
  end

  def done_by(time_string, weight, offset)
    time_to_finish = tz.local_to_utc(Time.parse(time_string))
    time_to_finish = Time.parse(time_string) + offset.to_i.hours
    required = time_to_finish - turkey_calc(weight)
    required
  end

  def t_main
    weight = ask "What is the weight of your turkey?: "
    weight = weight.to_i
    done = ask "When do you need it done by?: "
    done_by(done, weight)
  end
  module_function :done_by, :tz, :turkey_calc, :turkey_add_in, :weight_to_minutes
end
