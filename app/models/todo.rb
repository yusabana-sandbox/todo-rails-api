# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Todo < ApplicationRecord
  validates :title, presence: true
end
