# == Schema Information
#
# Table name: survey_rate_view
#
#  surveyid :integer
#  survey   :text
#  rateid   :integer
#  rate     :text
#

class SurveyRate < ActiveRecord::Base
	set_table_name "survey_rate_view"
end
