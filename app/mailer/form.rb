# frozen_string_literal: true

class Form
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string
  attribute :message, :string
  attribute :workshop, :string
  attribute :role, :string

  validates :first_name, :last_name, :message, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

  CONTACT_REQUEST_ROLE = ["Movie Director", "Fan", "Local Association", "Other"]
  WORKSHOP = ["Launch a VHS", "Promoting a movie"]
end
