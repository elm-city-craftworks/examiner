class SubmissionsController < ApplicationController
  def create
    @results = ExamUploader.upload(params[:submission][:exam_zipfile])
  end
end
