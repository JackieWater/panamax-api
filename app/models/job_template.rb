class JobTemplate < ActiveRecord::Base
  has_many :job_steps, -> { order(:order) }

  scope :cluster_job_templates, -> { where(type: 'ClusterJobTemplate') }
end
