class Reclamo < ActiveRecord::Base
  belongs_to :Tweet
  belongs_to :Compania
end
