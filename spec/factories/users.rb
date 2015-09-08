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

FactoryGirl.define do
  factory :user do
    first_name "User"
    last_name "Tester"
    middle_name "Factory"
    note "Note"
    about "About"
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

  end
end
