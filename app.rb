require 'sinatra'
require_relative 'controller'

# Defina suas rotas aqui
get '/' do
  dados = MyController.index
  erb :'teste', locals: { dados: dados }
end

get '/testar_conexao' do
    # Tenta estabelecer a conexão
    client = Connection.connect
  
    if client
      # Se a conexão for bem-sucedida, exibe uma mensagem de sucesso
      "Conexão com o banco de dados estabelecida com sucesso!"
    else
      # Se houver um erro ao conectar, exibe uma mensagem de erro
      "Erro ao conectar ao banco de dados. Verifique as configurações de conexão."
    end
  end