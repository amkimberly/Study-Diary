class AddCategoryIdToStudyItem < ActiveRecord::Migration[6.0]
  def change
    add_column :study_items, :category_id, :integer
  end
end
