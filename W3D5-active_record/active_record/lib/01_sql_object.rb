require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  
  
  def self.columns
    # ...
    # table = self.table_name
    if @columns
      return @columns
    else 
      
      @columns = DBConnection.execute2(<<-SQL)
        SELECT 
          *
        FROM 
          #{self.table_name}
      SQL
      
      @columns = @columns.first.map {|c| c.to_sym}
    end 
    
    return @columns
  end

  def self.finalize!
    self.columns.each do |column| 
      define_method(column.to_s) do 
        self.attributes[column]
      end 
    
      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end 
    end 
  end

  def self.table_name=(name)
    # ...
    @table_name = name
  end 

  def self.table_name
    # ...
    @table_name ||= "#{self}s".downcase
  end

  def self.all
    # ...
    table = self.table_name
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM 
        #{table}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    # ...
    results.map do |row|
      self.new(row)
    end 
  end

  def self.find(id)
    # ...
    result = DBConnection.execute(<<-SQL)
      SELECT 
        *
      FROM
        #{self.table_name}
      WHERE 
        #{self.table_name}.id = #{id}
      LIMIT
        1
    SQL
    result = result.map! {|row| self.new(row)}.first
    
    return result
  end

  def initialize(params = {})
    params.each do |k,v|
      if self.class.columns.include?(k.to_sym)
        self.send("#{k}=", v)
      else 
        raise "unknown attribute '#{k}'"
      end 
    end
  end

  def attributes
    @attributes ||= {}
    @attributes
  end

  def attribute_values
    self.attributes.values
  end

  def insert
    col_names = self.class.columns.join(",")
    question_marks = Array.new(self.class.columns.count, "?" )  
    question_marks = question_marks.join(",")
    
    p col_names = "(#{col_names})"
    p question_marks = "(#{question_marks})"
     DBConnection.execute(<<-SQL)
      SELECT 
        *
      FROM 
        table 
     
    SQL
    
    DBConnection.last_insert_row_id
    
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
