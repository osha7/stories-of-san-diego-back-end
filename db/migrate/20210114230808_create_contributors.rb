class CreateContributors < ActiveRecord::Migration[6.1]
  def change
    create_table :contributors do |t|
      t.string :full_name
      t.string :bio
      t.string :image
      t.timestamps
    end
  end
end
