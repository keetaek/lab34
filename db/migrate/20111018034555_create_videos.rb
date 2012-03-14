class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      #t.string :title
      t.string :panda_video_id
      t.integer :user_id
      t.timestamps
    end
  end
end
