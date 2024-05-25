class User
    attr_reader :id, :login, :email  
  
    def initialize(attributes = {})
      @id = attributes['id']
      @login = attributes['login']
      @email = attributes['email']
    end
  
    def self.where(conditions)
      begin
        client = Connection.connect
  
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

    def self.update(conditions, set)
        begin
          cliente = Connection.connect
          conditions_str = conditions.map { |key, value| "#{key} = '#{value}'"}.join(' AND ')
          set_str = set.map { |key, value| "#{key} = '#{value}'"}.join(', ')
          sql = "UPDATE users SET #{set_str} WHERE #{conditions_str}"
          puts "SQL de atualização: #{sql}" # Adiciona este puts para debug
          atualizacao = cliente.execute(sql)
          atualizacao.do
        rescue TinyTds::Error => e
          puts "Erro ao atualizar o usuário: #{e.message}"
        ensure
          Connection.disconnect(cliente) if cliente
        end
      end

  end