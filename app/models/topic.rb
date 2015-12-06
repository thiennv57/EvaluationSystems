class Topic < ActiveRecord::Base
  belongs_to :template
  has_many :sub_topics, dependent: :destroy
  accepts_nested_attributes_for :sub_topics, allow_destroy: true,
    reject_if: proc {|attribute| attribute[:name].blank?}
end
