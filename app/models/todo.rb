# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_todos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_d94154aa95  (user_id => users.id)
#

class Todo < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
end
