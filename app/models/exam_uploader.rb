class ExamUploader
  def initialize(observer)
    @observer = observer
  end

  def upload(zipfile)
    submission = Submission.new(:exam_zipfile => zipfile)
    submission.code = TokenPhrase.generate(:numbers => false)

    if submission.valid?
      submission.save

      @observer.upload_success(submission.code)
    else
      @observer.upload_failure(submission.errors.full_messages)
    end
  end
end
