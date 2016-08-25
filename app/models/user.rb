# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true

  def self.from_token_request(request)
    username = request.params[:auth] && request.params[:auth][:username]
    find_by(username: username)
  end
end
