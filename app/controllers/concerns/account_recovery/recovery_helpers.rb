# frozen_string_literal: true

# Helpers for the account recovery
module AccountRecovery
  module RecoveryHelpers
    # checks if the user tries to recover the account with the default answers
    def default_answers?(questions_with_answers)
      answers = questions_with_answers.map(&:second)
      answers.map(&:downcase).map(&:strip).include?('your answer')
    end
  end
end
