# frozen_string_literal: true

class Reception < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  enum :status, {
    considering: 'considering',
    waiting: 'waiting',
    reply: 'reply'
  }
end
# enum be: considering, waiting, reply
