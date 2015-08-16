# == Schema Information
#
# Table name: jobs
#
#  id              :integer          not null, primary key
#  name            :string
#  status          :integer
#  description     :text
#  employment_type :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Job < ActiveRecord::Base


  # Iclude SanitizeHelper to strip tags from form submissions
  include ActionView::Helpers::SanitizeHelper

  belongs_to :user
  
  enum status: [:active, :inactive]
  enum employment_type: [:full_time, :part_time]

  validates_presence_of :name, :description, :status, :employment_type

  before_save do |job|
    job.name = strip_tags(job.name)
    job.description = strip_tags(job.description)
  end
end
