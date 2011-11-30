class CreateApplicationMedia < ActiveRecord::Migration
  def change
    create_table :application_media do |t|

      t.timestamps
    end
  end
end
