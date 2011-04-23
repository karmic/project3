# == Schema Information
#
# Table name: suggests
#
#  id        :integer         not null, primary key
#  survey_id :integer
#  suggest   :text
#

class Suggest < ActiveRecord::Base
end
