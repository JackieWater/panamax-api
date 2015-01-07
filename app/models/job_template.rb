class JobTemplate < ActiveRecord::Base
  has_many :job_steps, -> { order(:order) }
end
