# == Schema Information
#
# Table name: rates
#
#  id         :integer         not null, primary key
#  suggest_id :integer
#  rate       :text
#

class Rate < ActiveRecord::Base
end
