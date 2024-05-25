require_relative 'connection'

class MyController
  def self.index
    begin
      # Conectar ao banco de dados
      client = Connection.connect

      # Executar a consulta SQL para selecionar todos os usuários
      result = client.execute("SELECT * FROM users")

      # Transformar os resultados em uma estrutura de dados adequada
      dados = result.map do |row|
        { id: row['id'], login: row['login'], senha: row['senha'], email: row['email'] }
      end

      return dados
    rescue TinyTds::Error => e
      puts "Erro ao executar a consulta: #{e.message}"
      return []
    ensure
      # Fechar a conexão com o banco de dados
      Connection.disconnect(client) if client
    end
  end
end