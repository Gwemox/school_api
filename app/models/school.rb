class School < ApplicationRecord
  default_scope { order(name: :asc) }

  def self.filter(params)
    if params[:status].blank?
      return School.all
    else
      return School.where(['status = ?', params[:status]])
    end
  end
end
