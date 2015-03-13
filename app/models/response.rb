# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  list       :string(255)
#  quest_id   :integer
#  response   :string(255)
#  author     :string(255)
#  confidence :integer
#  session_id :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
end
