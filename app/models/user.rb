class User < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessible :email, :password, :password_confirmation, 
  :firstName, :lastName, :thumbnail, :city_list, 
  :pictures_attributes, :videos_attributes, :applications_attributes;
  
  has_secure_password

  has_and_belongs_to_many :auditions
  has_many :applications, through: :auditions

  # This is to add pictures and videos directly to the profile
  has_many :pictures, :dependent => :destroy
  has_many :videos, :dependent => :destroy
  mount_uploader :thumbnail, ThumbnailUploader #Thumbnail image

  # TODO - revive only when necessary. 
  # has_one :user_detail
  # has_many :audition_admins

  #################VALIDATION TODO: Move this logic to separate class#########
  # From the registration page
  validates_presence_of :email, :password, :firstName, :lastName, :on => :create, :message => "The field cannot be blank"
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, :length => { :minimum => MINIMUM_NUM_PASSWORD, :message => "Minimum #{MINIMUM_NUM_PASSWORD} characters" }, :confirmation => true, :on => :create
  validate :email, :uniqueness => { :case_sensitive => false, :message => "not unique" },
    :email => { :message => "Please provide correct email format" },
    :on => :create

  validates_with UserNameValidator #Validating firstName and lastName

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

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    user.authenticate(password) unless user.nil?
      # Note that we are using email as a username
  end
  #Name validator : This is written to consolidate 2 separate error messages for first and last name

   # Exclude password info from json output.
  def as_json(options={})

    options[:only] ||= [:firstName, :lastName, :email, :thumbnail, :city, :imdbUrl, :facebookId, :linkedInUrl, :twitterId]
    json = super(options)
    # Adding Tag list
    json[:tags] = { :city_list => self.city_list, :theater_list => self.theater_list, :dance_list => self.dance_list, :music_list => self.music_list }
    return json
  end

end
