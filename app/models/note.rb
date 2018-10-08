class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :vitamin_blend
end
