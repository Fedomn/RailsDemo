class Todo < ActiveRecord::Base

  belongs_to :user

  module Status
    COMPLETE = 'complete'
    NOT_COMPLETE = 'not_complete'
  end

end
