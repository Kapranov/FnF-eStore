user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# GetText find all translations used
# https://github.com/grosser/gettext_i18n_rails
# rake gettext:find
#
# To parse the database for columns that can be translated
# rake gettext:store_model_attributes
#

# <%= f.file_field :profile_image, id: "area-upload", class: "dropzone dz-clickable dz-default dz-message" do %>
#   <span>Drop files here to upload</span>
# <% end %>
#
# https://github.com/fnando/i18n-js/issues/305
# https://github.com/matthuhiggins/foreigner
# http://stackoverflow.com/questions/7861971/generate-model-using-userreferences-vs-user-idinteger
# https://github.com/globalize/globalize
#
