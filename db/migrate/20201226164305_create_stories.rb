class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.date :date
      t.string :transcriber
      t.string :contributor
      t.string :contact_email
      t.string :contact_phone
      t.string :story
      t.string :image

      t.timestamps
    end
  end
end
