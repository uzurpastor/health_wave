class Reception < ApplicationRecord
  
  enum :status, {
    considering:  'considering',
    waiting:      'waiting',
    reply:        'reply'
  }
end
#enum be: considering, waiting, reply
