class JobTemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :documentation

  has_many :job_steps, serializer: JobStepSerializer
end