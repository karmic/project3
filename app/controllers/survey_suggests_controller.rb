class SurveySuggestsController < ApplicationController
 def index
		@surveysuggests = SurveySuggest.find(:all, :order => 'survey')
  end

	def chooseSurvey
		@surveys = Survey.all
	end

	def editSurvey
		@survey = Survey.find(params[:id])
	end

	def whichSurvey
  	@surveys = Survey.all
	end
	
	def updateSurvey
		@survey = Survey.find(params[:survey][:id])
		if @survey.update_attributes(:survey => params[:survey][:survey])
			redirect_to :controller => "survey_suggests", :action => "index"
		else
			render :action => "editSurvey"			
		end
	end

	def editSuggest
		@suggest = Suggest.find(params[:id])
	end

	def whichSuggest
  	@suggests = Suggest.all
	end
	
	def updateSuggest
		@suggest = Suggest.find(params[:suggest][:id])
		if @suggest.update_attributes(:suggest => params[:suggest][:suggest])
			redirect_to :controller => "survey_suggests", :action => "index"
		else
			render :action => "editSurvey"			
		end
	end
end
