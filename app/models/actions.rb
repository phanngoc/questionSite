class Action < ApplicationRecord
  belongs_to :targetable, polymorphic: true
end
