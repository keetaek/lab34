class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :firstName, :lastName
  has_secure_password
 
  has_and_belongs_to_many :auditions
  has_one :user_detail
  has_many :audition_admins
  has_many :applications
  has_many :media, :as => :media_resource #polymophic relationship
  
  validates_confirmation_of :password
  validates_presence_of :email, :password, :firstName, :lastName, :on => :create, :message => "Can't be blank"
  validates_uniqueness_of :email

  before_create { generate_token(:auth_token) } # Generating auth_token for each user
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
   # The block below runs while loop trying to assign unique value to each user.
    begin
      logger.debug "KEETAEK Column " + column.to_s
      self[column] = SecureRandom.urlsafe_base64
           logger.debug "KEETAEK Column Random:  " + self[column].to_s
    end while User.exists?(column => self[column])
  end

end
