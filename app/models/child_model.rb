class ChildModel < ApplicationRecord
  belongs_to :main_model

  validates :fail, :inclusion => {:in => [false, nil]}
end
