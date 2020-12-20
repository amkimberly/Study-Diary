class AddFinishedAtToStudyItems < ActiveRecord::Migration[6.0]
  def change
    add_column :study_items, :finished_at, :date
  end
end
