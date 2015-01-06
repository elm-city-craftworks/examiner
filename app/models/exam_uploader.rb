class ExamUploader
  def self.upload(zipfile, status=UploadStatus.new)
    submission = Submission.new(:exam_zipfile => zipfile)

    submission.code   = TokenPhrase.generate(:numbers => false)
    submission.status = "submitted"
    submission.notes   = "Your submission has been successfully uploaded. "+
                         "We will check to make sure we're able to read your source code within the next 48 hours."

    if submission.valid?
      submission.save

      status.successful_upload(submission.code)
    else
      status.failed_upload(submission.errors.full_messages)
    end

    status
  end
end
