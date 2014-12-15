class Submission < ActiveRecord::Base
  validates :code, :uniqueness => true, :presence => true
  attachment :exam_zipfile
end
