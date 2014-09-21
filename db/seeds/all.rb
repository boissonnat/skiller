#encoding: utf-8
# Define default roles
Role.find_or_create_by(name: Role::DEFAULT)
Role.find_or_create_by(name: Role::ORGANIZATION_ADMIN)
Role.find_or_create_by(name: Role::ADMIN)
