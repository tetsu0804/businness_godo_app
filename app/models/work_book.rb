class WorkBook < ApplicationRecord
  belongs_to :user
  enum paid: { vacation: true, work: false }
end
