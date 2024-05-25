class User
    attr_reader :id, :login, :email  # Defina os atributos que deseja acessar
  
    def initialize(attributes = {})
      @id = attributes['id']
      @login = attributes['login']
      @email = attributes['email']
      # Adicione outros atributos conforme necessário
    end
  
    def self.where(conditions)
      begin
        client = Connection.connect
  
        # Construir a consulta SQL com base nas condições fornecidas
        conditions_str = conditions.map { |key, value| "#{key} = '#{value}'" }.join(' AND ')
        sql = "SELECT * FROM users WHERE #{conditions_str}"
  
        result = client.execute(sql)
        users = result.map { |row| new(row) }
        return users
      rescue TinyTds::Error => e
        puts "Erro ao executar a consulta: #{e.message}"
        return []
      ensure
        Connection.disconnect(client) if client
      end
    end
  end