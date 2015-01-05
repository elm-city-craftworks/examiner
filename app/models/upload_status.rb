class UploadStatus
  def successful_upload(code)
    @code = code
    @upload_status = :success
  end

  def failed_upload(errors)
    @errors = errors
    @upload_status = :error
  end

  def on_success
    raise "Not uploaded yet!" unless @upload_status

    yield @code if @upload_status == :success
  end

  def on_failure
    raise "Not uploaded yet!" unless @upload_status

    yield @errors if @upload_status == :error
  end
end
