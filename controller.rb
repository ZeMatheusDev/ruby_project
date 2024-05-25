require_relative 'connection'
require_relative 'user'

class MyController
  def self.index
    dados = User.where({login: '060599'})
    return dados
  end
end