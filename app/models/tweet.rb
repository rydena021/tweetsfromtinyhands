class Tweet < ApplicationRecord
  default_scope { order(posted_at: :desc) }
end
