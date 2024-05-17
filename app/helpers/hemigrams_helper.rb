# frozen_string_literal: true

module HemigramsHelper
  def form_url(object, path)
    object.persisted? ? public_send("#{path}_path", object) : public_send("#{path}s_path", parameter: nil)
  end

  def form_method(object)
    object.persisted? ? :patch : :post
  end

  def options_for_chart_units
    Admin::Hemigrams::ParameterMetadata::UNITS.values.flatten.uniq.sort
  end

  # ensures a pretty rendering of the units
  def render_unit(unit)
    case unit
    when '10^3/µL'
      '10<sup>3</sup>/µL'.html_safe
    when '10^6/μL'
      '10<sup>6</sup>/µL'.html_safe
    when '10^9/L'
      '10<sup>9</sup>/L'.html_safe
    when '10^12/L'
      '10<sup>12</sup>/L'.html_safe
    else
      unit
    end
  end

  def encouraging_phrase
    if @number_hemigram_entries.zero?
      [
        'You have no data yet! Ready to get started? Enter your first hemigram data now and begin tracking your health journey!',
        "You have no data yet! Let's begin! Your first step is to record your hemigram data. Start now to take control of your health!"
      ].sample(1).join
    elsif @number_hemigram_entries.between?(1, 10)
      [
        'You are off to a great start! Keep adding more hemigram data to track your progress.',
        'Nice work! Continue adding hemigram data to see how your health progresses over time.',
        'You are doing great! Keep going and add more hemigram data to get a comprehensive view of your health.',
        'Well done! Add more hemigram data to build a complete picture of your health journey.',
        'Off to a great start! Keep adding data to build a comprehensive picture of your health.',
        'You are on your way! Keep adding more data to unlock deeper insights into your health.'
      ].sample(1).join
    elsif @number_hemigram_entries.between?(11, 40)
      [
        'Making strides! Keep adding data to enrich your health insights.',
        'You are on the right track! Keep adding entries to deepen your understanding of your health.',
        'Nice work! Keep up the momentum by adding more entries to your hemigram.',
        'You are doing great! Keep adding data to maintain your progress and improve your health insights.',
        'Progressing well! Keep adding entries to your hemigram to continue uncovering valuable insights.'
      ].sample(1).join
    else
      [
        'Keep up the great work!',
        'Impressive progress! Your dedication to tracking your health is paying off. Keep it up!',
        "Fantastic job! With so much data, you're gaining valuable insights into your health. Keep going!"
      ].sample(1).join
    end

    def color_depending_norm_range(hemigram)
      parameter_metadata = Admin::Hemigrams::ParameterMetadata.find_by(parameter_name: hemigram.parameter)

      if hemigram.chart_value.to_f > parameter_metadata.upper_limit
        'too-high p-1'
      elsif hemigram.chart_value.to_f < parameter_metadata.lower_limit
        'too-low p-1'
      else
        'within-norm p-1'
      end
    end
  end
end
