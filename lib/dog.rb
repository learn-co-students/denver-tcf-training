class Dog
  attr_accessor :name
  attr_reader :id

  # Dog::find_by(hash)
  # Dog::find_or_create_by(hash)

  # Dog#initialize
  def initialize(args)
    @id ||= args["id"]

    args.reject { |k,_| k == "id"  }.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  # Dog#update(hash)
  def update(args)
    args.reject { |k,_| k == "id"  }.each do |key, value|
      self.send("#{key}=", value)
    end

    self.save # update this thing in the database
  end

  # Dog::create(hash)
  def self.create(args)
    self.new(args).save
  end

  # Dog#save
  def save
    if self.id
      # update the record in the database
      query = <<-SQL
        UPDATE dogs SET name = ?
      SQL

      DB.execute(query, self.name)
    else
      # insert the record into the database
      query = <<-SQL
        INSERT INTO dogs (name)
        VALUES (?)
      SQL

      DB.execute(query, self.name)

      @id = DB.execute("SELECT last_insert_rowid()")[0][0]
    end

    self
  end

  # Dog::create_table
  def self.create_table
    query = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    SQL

    DB.execute(query)
  end

  def self.all
    # Step 3: Caching with @@all
    query = <<-SQL
      SELECT * FROM dogs
    SQL

    DB.execute(query).map do |row|
      self.new(row)
    end
  end
end
