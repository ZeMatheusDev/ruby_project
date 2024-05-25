require 'tiny_tds'

class Connection
  def self.connect
    begin
      # Configurações de conexão com o banco de dados SQL Server
      config = {
        :host => 'localhost',
        :username => 'sa',
        :password => '06059922',
        :database => 'ruby'
      }

      # Estabelece a conexão com o banco de dados
      client = TinyTds::Client.new(config)
      puts "Conexão estabelecida com sucesso!"
      return client
    rescue TinyTds::Error => e
      puts "Erro ao conectar ao banco de dados: #{e.message}"
      return nil
    end
  end

  def self.disconnect(client)
    # Fecha a conexão com o banco de dados
    client.close if client
    puts "Conexão fechada."
  end
end