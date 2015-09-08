class User < ActiveRecord::Base
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
