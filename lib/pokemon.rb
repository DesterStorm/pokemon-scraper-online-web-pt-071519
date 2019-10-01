 class Pokemon
  
  attr_accessor :name, :type, :id, :db, :hp
  # attr_reader :id

  def initialize(keywords)
  # @name = name 
  # @type = type
  # @db = db 
  # @id = id
  # @hp = hp
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type) 
    VALUES (?, ?)
    SQL
    db.execute(sql ,name, type)
  end

  def self.find(num, db)
    sql = <<-SQL
    SELECT * 
    FROM pokemon 
    WHERE id = ?
    SQL
    pokemon = db.execute(sql, [num])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon.hp = pokemon[0][3]
    return new_pokemon
  end

  def alter_hp(num, db)
    sql = <<-SQL
    UPDATE pokemon 
    SET hp = ? 
    WHERE id = ?
    SQL
    db.execute(sql, [num], [self.id])
    self.hp = num
  end
  
end
