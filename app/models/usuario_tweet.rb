class UsuarioTweet < ActiveRecord::Base
  belongs_to :Usuario
  belongs_to :Tweet
end
