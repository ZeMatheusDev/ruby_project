require_relative 'connection'
require_relative 'user'

class MyController
  def self.index
    dados = User.where({login: '060599'})
    User.update({login: '060599'}, {email: 'ovelhoeomar123@gmail.com'})
    return dados
  end
end