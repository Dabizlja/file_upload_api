class Attachment < ApplicationRecord
  self.table_name = "data_attachments"
  has_one_attached :data
  acts_as_taggable
  validates_presence_of :name
  before_create :filter_tag_list

  def filter_tag_list
    self.tag_list.map do |name|
      if name.include?("+") || name.include?("-")
        name.gsub!(/[+-]/, "")
      end
    end
  end

end
