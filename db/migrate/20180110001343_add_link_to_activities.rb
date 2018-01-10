class AddLinkToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :link, :string
  end
end
