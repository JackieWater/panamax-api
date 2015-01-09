module JobTemplateBuilder
  class FromJson

    attr_reader :params

    def initialize(template_contents)
      @params = YAML.safe_load(template_contents || '')
    end

    def create_template
      job_steps_hash = params.delete('steps')
      JobTemplate.new(params) do |template|
        template.job_steps = create_job_steps(job_steps_hash) if job_steps_hash
        template.save
      end
    end

    private
    def create_job_steps(job_steps_hash)
      job_steps_hash.each_with_index.map do |job_step_hash, i|
        JobStep.new(job_step_hash.merge({order: i}))
      end
    end
  end
end