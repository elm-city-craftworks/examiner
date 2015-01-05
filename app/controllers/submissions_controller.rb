class SubmissionsController < ApplicationController
  def create
    @submission = SubmissionPresenter.new
    
    ExamUploader.new(@submission).upload(params[:submission][:exam_zipfile])
  end
end
