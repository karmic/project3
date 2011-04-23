class SuggestRatesController < ApplicationController
  def suggest
		@suggests = Suggest.all
	end

	def chart
		require 'gchart'

		great = SuggestRate.count(:all,:conditions => ["rate=?", "great1"])
    neutral = SuggestRate.count(:all,:conditions => ["rate=?", "neutral1"])
    bad = SuggestRate.count(:all,:conditions => ["rate=?", "bad1"])
		@result_suggest1 = Gchart.bar(:title => "Suggestion 1",:title_size => 20, :data => [great, neutral, 
		bad],:bar_width_and_spacing => 75,:bar_colors => 'E8AAF0', :labels => ["great: " + great.to_s, "neutral: " + 
		neutral.to_s, "bad: " + bad.to_s])

		great = SuggestRate.count(:all,:conditions => ["rate=?", "great2"])
    neutral = SuggestRate.count(:all,:conditions => ["rate=?", "neutral2"])
    bad = SuggestRate.count(:all,:conditions => ["rate=?", "bad2"])
		@result_suggest2 = Gchart.bar(:title => "Suggestion 2",:title_size => 20, :data => [great, neutral, 
		bad],:bar_width_and_spacing => 75,:bar_colors => 'E8AAF0', :labels => ["great: " + great.to_s, "neutral: " + 
		neutral.to_s, "bad: " + bad.to_s])

		great = SuggestRate.count(:all,:conditions => ["rate=?", "great3"])
    neutral = SuggestRate.count(:all,:conditions => ["rate=?", "neutral3"])
    bad = SuggestRate.count(:all,:conditions => ["rate=?", "bad3"])
		@result_suggest3 = Gchart.bar(:title => "Suggestion 3",:title_size => 20, :data => [great, neutral, 
		bad],:bar_width_and_spacing => 75,:bar_colors => 'E8AAF0', :labels => ["great: " + great.to_s, "neutral: " + 
		neutral.to_s, "bad: " + bad.to_s])
	
		respond_to do |format|
			format.html     	
			format.pdf do
     		render :pdf => "rated_suggestion_result.pdf"
      end
    end
	end    

	def index
  end

	def create
		suggestion1 = params[:suggest_rate][:rate1]
		suggestion2 = params[:suggest_rate][:rate2]
		suggestion3 = params[:suggest_rate][:rate3]
		conn = ActiveRecord::Base.connection
		sql1 = "insert into rates(suggest_id,rate) values ('1','" + suggestion1 + 		"')"
		sql2 = "insert into rates(suggest_id,rate) values ('2','" + suggestion2 + 		"')"
		sql3 = "insert into rates(suggest_id,rate) values ('3','" + suggestion3 + 		"')"
		conn.insert(sql1)
		conn.insert(sql2)
		conn.insert(sql3)
		redirect_to :controller => "pages", :action => "continue"
	end

end
