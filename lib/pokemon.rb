class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id,name,type) VALUES(?,?,?)",@id,name,type)
  end

  def self.find(id,db)
     found_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id")
     self.new(id:found_pokemon[0][0],name: found_pokemon[0][1],type: found_pokemon[0][2], db: db, hp:found_pokemon[0][3])
  end

  def alter_hp(new_hp,db)
    @hp = new_hp
    db.execute("UPDATE pokemon SET hp = #{@hp} WHERE id = #{@id}")
  end
end
