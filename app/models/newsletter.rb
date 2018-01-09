# sanitizer:string
class Newsletter < ApplicationRecord
  include Mailer

  self.table_name = 'newsletters'
  self.primary_key = 'id'

  scope :registered, -> { where(status: true) }
  scope :unregistered, -> { where(status: false) }

  def signup
    self.token = SecureRandom.urlsafe_base64
    self.status = true
    self.confirmed_at = Date.today
  end

  def cancel
    self.token = nil
    self.status = false
  end

  validates :name,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 30 }

  validates :email,
            presence: true,
            uniqueness: true,
            allow_blank: false,
            length: { minimum: 3, maxmimum: 245 }

  validates :token, uniqueness: true
end
