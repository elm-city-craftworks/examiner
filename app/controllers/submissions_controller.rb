class SubmissionsController < ApplicationController

  # FIXME: routing, and maybe a wrapper object like ExamStatus.fetch(code)
  def show
    raise Submission.find_by_code(params[:id]).exam_zipfile.read.inspect
  end

  def create
    status = ExamUploader.upload(params[:submission][:exam_zipfile])

    status.on_success do |code|
      redirect_to submission_path(code)
    end

    status.on_failure do |errors|
      redirect_to new_submission_path, :alert => errors.join("\n")
    end
  end
end
