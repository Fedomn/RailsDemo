class Todo < ActiveRecord::Base

  belongs_to :user

  include TodoStatus
end
