class AddEmailToAuditionAdmins < ActiveRecord::Migration
  def change
    add_column :audition_admins, :email, :string
  end
end
