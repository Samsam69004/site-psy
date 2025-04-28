# app/models/contact.rb
class Contact
  include ActiveModel::Model

  attr_accessor :name, :firstname, :email, :subject, :message

  validates :name, :firstname, :email, :subject, :message, presence: true
end
