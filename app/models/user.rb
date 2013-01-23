class User < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessible :email, :password, :password_confirmation, 
  :firstName, :lastName, :thumbnail, :city_list, :user_detail_attributes,
  :pictures_attributes, :videos_attributes, :applications_attributes, :audition_admins;
  has_secure_password

  has_and_belongs_to_many :auditions
  has_one :user_detail
  has_many :audition_admins
  has_many :applications
  #has_many :media, :as => :media_resource #polymophic relationship
  has_many :pictures, :dependent => :destroy
  has_many :videos, :dependent => :destroy
  mount_uploader :thumbnail, ThumbnailUploader #Thumbnail image


  #################VALIDATION TODO: Move this logic to separate class#########
  # From the registration page
  validates_presence_of :email, :password, :on => :create, :message => "The field cannot be blank"
  validates :password, :length => { :minimum => MINIMUM_NUM_PASSWORD, :message => "Minimum #{MINIMUM_NUM_PASSWORD} characters" }, :confirmation => true, :on => :create
  validate :email, :uniqueness => { :case_sensitive => false, :message => "not unique" },
    :email => { :message => "Please provide correct email format" },
    :on => :create
  validates_with UserNameValidator #Validating firstName and lastName


  #not sure if I want to allow destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  accepts_nested_attributes_for :videos, :allow_destroy => true

  acts_as_taggable
  acts_as_taggable_on :cities, :theaters, :movies, :dances, :musics #I know.. that is gramatically wrong

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

  #Name validator : This is written to consolidate 2 separate error messages for first and last name


end
