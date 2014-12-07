class TweetFiltro < ActiveRecord::Base
  belongs_to :Tweet
  belongs_to :Filtro
end
