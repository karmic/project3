# == Schema Information
#
# Table name: survey_suggest_view
#
#  surveyid   :integer
#  survey     :text
#  created_at :datetime
#  updated_at :datetime
#  suggestid  :integer
#  suggest    :text
#

class SurveySuggest < ActiveRecord::Base
	set_table_name "survey_suggest_view"
end
