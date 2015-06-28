class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :status
      t.text :description
      t.integer :employment_type

      t.timestamps null: false
    end
  end
end
