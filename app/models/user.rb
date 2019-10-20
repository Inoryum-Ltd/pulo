class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  extend FriendlyId
  friendly_id :username, use: :slugged
  has_many :articles, dependent: :destroy
  has_many :projects, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :username,  presence: true,
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
             uniqueness: { case_sensitive: false },
            length: {  maximum: 120 },
            format: { with: VALID_EMAIL_REGEX }
  
  validates :bio, length: { maximum: 300}
  before_create :skipp_confirmation
  #after_create :send_admin_mail
  has_one_attached :authorc
  
  def skipp_confirmation
    if !Setting.first.enable_smtp?
      self.skip_confirmation!
    end
  end
  
  #def send_admin_mail
  # if Setting.first.enable_smtp?
  #    AdminMailer.new_user_signed_up(email).deliver
  #  end
  #end
  
  attr_accessor :remove_cover_image

  after_save :purge_cover_image, if: :remove_cover_image

  private def purge_cover_image
    authorc.purge
  end
  
end