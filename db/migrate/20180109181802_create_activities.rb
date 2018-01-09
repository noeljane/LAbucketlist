class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :image_url
      t.string :note
      t.date :date_completed
      t.string :category
      t.string :neighborhood
      t.string :rating
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
