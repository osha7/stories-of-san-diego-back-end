class ChangeDataTypeForStoriesDate < ActiveRecord::Migration[6.1]
  def change
    change_column :stories, :date, :datetime
  end
end
