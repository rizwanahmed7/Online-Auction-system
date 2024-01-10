# frozen_string_literal: true

class AutomateBidJob < ApplicationJob
  queue_as :default
  RUN_EVERY = 30.seconds
end
