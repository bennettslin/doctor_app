class PapersTags < ActiveRecord::Base
  belongs_to :paper
  belongs_to :tag
end
