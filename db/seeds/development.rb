#encoding: utf-8

################
# Create Users #
################
if User.where(email: 'admin@abnt.fr').blank?
  admin = User.create!({:email => 'admin@abnt.fr', :password => 'password', :password_confirmation => 'password' })
  admin.roles << Role.find_by(:name => Role::ORGANIZATION_ADMIN)
  admin.save
end