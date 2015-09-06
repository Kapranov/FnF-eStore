class TranslateUsers < ActiveRecord::Migration
  def self.up
    User.create_translation_table!({
      name: :string,
      note: :text,
      about: :text
    }, {
      migrate_data: true
    })
  end

  def self.down
    User.drop_translation_table! migrate_data: true
  end
end
