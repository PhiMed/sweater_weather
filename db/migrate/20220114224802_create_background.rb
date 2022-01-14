class CreateBackground < ActiveRecord::Migration[5.2]
  def change
    create_table :backgrounds do |t|
        t.string :location
        t.string :img_url
        t.string :source
        t.string :author
    end
  end
end
