# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string
#  description :text
#  displayed   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :category do
    user nil
name "MyString"
description "MyText"
displayed "MyString"
  end

end
