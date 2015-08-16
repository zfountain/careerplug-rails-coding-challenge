class UpdateJobs < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.belongs_to :user
    end
  end
end
