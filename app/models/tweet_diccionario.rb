class TweetDiccionario < ActiveRecord::Base
  belongs_to :Tweet
  belongs_to :Diccionario
end
