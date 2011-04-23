class SuggestRatesController < ApplicationController
  def suggest
		@suggests = Suggest.all
	end

	def chart
		require 'gchart'

		great = SuggestRate.count(:all,:conditions => ["rate=?", "great"])
    neutral = SuggestRate.count(:all,:conditions => ["rate=?", "neutral"])
    bad = SuggestRate.count(:all,:conditions => ["rate=?", "bad"])
		@chart_suggest1 = Gchart.bar(:title => "Catherine's Suggestion 1",:title_size => 20, :data => [great, neutral, 
		bad],:bar_width_and_spacing => 75,:bar_colors => 'E8AAF0', :labels => ["great: " + great.to_s, "neutral: " + neutral.to_s, "bad: " + bad.to_s])

		great = SuggestRate.count(:all,:conditions => ["rate=?", "great1"])
    neutral = SuggestRate.count(:all,:conditions => ["rate=?", "neutral1"])
    bad = SuggestRate.count(:all,:conditions => ["rate=?", "bad1"])
		@chart_suggest2 = Gchart.bar(:title => "Catherine's Suggestion 2",:title_size => 20, :data => [great, neutral, bad],:bar_width_and_spacing => 75,:bar_colors => 'E8AAF0', :labels => ["great: " + great.to_s, "neutral: " + neutral.to_s, "bad: " + bad.to_s])
	
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
		suggestion = params[:suggest_rate][:rate1]
		suggestion1 = params[:suggest_rate][:rate2]
		conn = ActiveRecord::Base.connection
		sql1 = "insert into rates(suggest_id,rate) values ('1','" + suggestion + 		"')"
		sql2 = "insert into rates(suggest_id,rate) values ('2','" + suggestion1 + 		"')"
		conn.insert(sql1)
		conn.insert(sql2)
		redirect_to :controller => "pages", :action => "continue"
	end

end