class AddUsersToRoadtrips < ActiveRecord::Migration[5.2]
  def change
    add_reference :roadtrips, :user, foreign_key: true
  end
end
