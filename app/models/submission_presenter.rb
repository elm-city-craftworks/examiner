class SubmissionPresenter
  def upload_success(code)
    @code = code
    @upload_status = :success
  end

  def upload_failure(errors)
    @errors = errors
    @upload_status = :error
  end

  def on_upload_success
    raise "Not uploaded yet!" unless @upload_status

    yield @code if @upload_status == :success
  end

  def on_upload_failure
    raise "Not uploaded yet!" unless @upload_status

    yield @errors if @upload_status == :error
  end
end
