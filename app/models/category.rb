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

class Category < ActiveRecord::Base
  belongs_to :user

  translates :name, :description, fallbacks_for_empty_translations: true

  def to_s
    "#{name}"
  end
end
