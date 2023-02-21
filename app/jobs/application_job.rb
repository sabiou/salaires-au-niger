class ApplicationJob < ActiveJob::Base
  # Automatically retry simulator that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most simulator are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
