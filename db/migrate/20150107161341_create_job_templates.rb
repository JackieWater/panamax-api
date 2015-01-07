class CreateJobTemplates < ActiveRecord::Migration
  def change
    create_table :job_templates do |t|
      t.string :name
      t.string :description
      t.text :documentation
      t.string :type

      t.timestamps
    end
  end
end
