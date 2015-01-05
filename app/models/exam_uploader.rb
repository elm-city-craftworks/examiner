class ExamUploader
  def self.upload(zipfile)
    submission = Submission.new(:exam_zipfile => zipfile)
    submission.code = TokenPhrase.generate(:numbers => false)

    if submission.valid?
      submission.save
      { :status => :success, :code => submission.code }
    else
      { :status => :error, :errors => submission.errors.full_messages }
    end
  end
end
