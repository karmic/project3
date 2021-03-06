class SurveySuggestsController < ApplicationController
 
	def newSurvey
	end

	def createSurvey
		survey = params[:survey][:survey]
		conn = ActiveRecord::Base.connection
		sql1 = "insert into surveys(survey,created_at,updated_at)
		values ('" + survey + "', now(),now())"
		conn.insert(sql1)
		sql2 = "SELECT setval('survey_id_seq', (SELECT MAX(id) FROM surveys)+1)"
		sur_id = conn.select_value(sql2)
		redirect_to :controller => "survey_suggests", :action => "index"
	end

	def newSuggest
	end

	def createSuggest
		survey_id = params[:suggest][:survey_id]
		suggest = params[:suggest][:suggest]
		conn = ActiveRecord::Base.connection
		sql1 = "insert into suggests(survey_id,suggest)
		values (" + survey_id.to_s + ",'" + suggest + "')"
		conn.insert(sql1)
		sql2 = "SELECT setval('suggest_id_seq', (SELECT MAX(id) FROM suggests)+1)"
		sugg_id = conn.select_value(sql2)
		redirect_to :controller => "survey_suggests", :action => "index"
	end

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
