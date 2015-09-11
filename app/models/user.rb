# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  reset_password_token       :string
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string
#  last_sign_in_ip            :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  first_name                 :string
#  last_name                  :string
#  middle_name                :string
#  role                       :integer
#  note                       :text
#  about                      :text
#  profile_image_id           :string
#  profile_image_filename     :string
#  profile_image_size         :integer
#  profile_image_content_type :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  has_many :categories

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  attachment :profile_image, type: :image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  translates :first_name, :last_name, :middle_name, :note, :about, :fallbacks_for_empty_translations => true

  def name
    "#{last_name} #{first_name} #{middle_name}"
  end

  # translates :name, :note, :about, :slug
  # include FriendlyId
  # friendly_id :name, use: [:slugged, :finders]
  # User.translation_class.all
  # User.joins(:translations).where('user_translations.locale =?', Globalize.locale)
  # User.joins(:translations).where('user_translations.locale =?', Globalize.locale).pluck(:name)
  # User.joins(:translations).where('user_translations.locale =?', Globalize.locale).to_sql
  # User.joins(:translations).where('user_translations.locale =?', Globalize.locale).map(&:name)
  #
  # p = User.create(name: "a name")
  # User.joins(:translations).pluck(:name)
  #
  # User.joins(:translations).where('user_translations.locale = ?', Globalize.locale).group("user.id").pluck(:name, :id)
  # Globalize::Version
end
