class Template < ActiveRecord::Base
  has_many :topics, dependent: :destroy
  accepts_nested_attributes_for :topics, allow_destroy: true,
    reject_if: proc {|attribute| attribute[:name].blank?}
end
