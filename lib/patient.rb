class Patient
  @@patients = []
  attr_accessor :name, :condition

  def initialize(name, condition)
    @name = name
    @condition = condition
  end


  def self.create(name:, condition:)
    patient = Patient.new(name, condition)
    patient.save
  end


  def self.find(id)
    sql = <<-SQL
      SELECT * FROM patients WHERE id = ? LIMIT 1
    SQL
    patients = DB[:conn].execute(sql, id).map { |row| create_from_db(row) }
    patients.first
  end


  # INSERT INTO patients (name, condition) VALUES ("", "")
  def save
    # I NEED TO DYNAMICALLY GIVE MY SQL VALUES
    sql = <<-SQL
      INSERT INTO patients (name, condition) VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.condition)
  end



  def self.all
    sql = <<-SQL
      SELECT * FROM patients
    SQL
    # an array with 3 arrays
    patients = DB[:conn].execute(sql).map { |row| create_from_db(row) }
  end


  def self.create_from_db(row)
    patient = Patient.new(row[1], row[2])
  end


  # CREATE TABLE IF NOT EXISTS patients ()
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS patients (
        id INTEGER PRIMARY KEY,
        name TEXT,
        condition TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end





end
