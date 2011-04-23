class SurveySuggestsController < ApplicationController
  def index
  end

	def chooseSurvey
		@surveys = Survey.all
	end

end
