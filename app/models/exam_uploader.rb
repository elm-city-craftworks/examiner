class ExamUploader
  def self.upload(zipfile, status=UploadStatus.new)
    submission = Submission.new(:exam_zipfile => zipfile)
    submission.code = TokenPhrase.generate(:numbers => false)

    if submission.valid?
      submission.save

      status.successful_upload(submission.code)
    else
      status.failed_upload(submission.errors.full_messages)
    end

    status
  end
end
