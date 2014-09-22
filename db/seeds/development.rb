#encoding: utf-8

################
# Create Users #
################
if User.where(email: 'admin@abnt.fr').blank?
  admin = User.create!({:email => 'admin@abnt.fr', :password => 'password', :password_confirmation => 'password' })
  admin.roles << Role.find_by(:name => Role::ORGANIZATION_ADMIN)
  admin.save
end

############################
# Create Application areas #
############################
ApplicationArea.find_or_create_by(name: 'Java')
ApplicationArea.find_or_create_by(name: 'Php')
ApplicationArea.find_or_create_by(name: 'C#')
ApplicationArea.find_or_create_by(name: 'Agile')
