class School < ApplicationRecord
  default_scope { order(name: :asc) }
  validates :name, presence: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  before_save :format_lat_lng

  def self.filter(params)
    if params[:status].blank?
      return School.all
    else
      return School.where(['status = ?', params[:status]])
    end
  end

  private

  def format_lat_lng
    self.latitude = latitude.to_f
    self.longitude = longitude.to_f
  end
end
