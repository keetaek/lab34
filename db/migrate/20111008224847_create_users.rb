class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :firstName
      t.string :lastName
      t.string :type
      #TODO: Maybe these URLs should be in different tables?
      t.string :imdbUrl
      t.string :facebookId
      t.string :twitterId
      t.string :linkedInUrl
      t.string :city
      t.string :thumbnail
      t.text :selfBio

      #Login information
      t.string :auth_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.timestamps
    end
  end
end
