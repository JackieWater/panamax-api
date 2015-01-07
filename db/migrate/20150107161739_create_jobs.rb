class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :job_template, index: true
      t.string :key

      t.timestamps
    end
  end
end
