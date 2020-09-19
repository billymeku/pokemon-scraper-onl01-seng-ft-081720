  class Pokemon

     attr_accessor :name, :type, :db 
     attr_reader :id 
 
  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type 
    @id = id
    @db = db 
  end
  
  def self.save(name, type, db) 
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end
  

  def self.find(id,db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
  
    SQL
    db.execute(sql,id).map do |row|
      Pokemon.new(id: id, name: row[1], type: row[2], db: db)
    end.first 

     attr_accessor :name, :type, :id 
 
  def initialize(name:, grade:, id=nil)
    @name = name
    @type = type 
    @id = id
  end
  
  
  def self.save
    sql = <<-SQL
      INSERT INTO students (name, type) 
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.type)
  end
  
  def self.find
    
  end 
end
