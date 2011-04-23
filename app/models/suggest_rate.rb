# == Schema Information
#
# Table name: suggest_rate_view
#
#  suggestid :integer
#  suggest   :text
#  rateid    :integer
#  rate      :text
#

class SuggestRate < ActiveRecord::Base
	set_table_name "suggest_rate_view"
end
