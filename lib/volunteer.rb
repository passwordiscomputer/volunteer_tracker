class Volunteer
  attr_accessor :name, :id, :project_id
  def initialize(attributes)
    @name = attributes["name"] || attributes[:name]
    @project_id = attributes["project_id"] || attributes[:project_id]
    @id = attributes["id"].to_i || attributes[:id].to_i
    if @id ==  0 then @id = nil end

  end

  def save
    @id = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;").first["id"].to_i;
  end

  def == other_volunteer
    (self.name == other_volunteer.name) && (self.id == other_volunteer.id)
  end

  def self.all
    returned_volunteer = DB.exec("SELECT * FROM volunteers ORDER BY name;")
    volunteers = []
    returned_volunteer.each() do |volunteer|
      volunteers.push(Volunteer.new(volunteer))
      end
    volunteers
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * from volunteers WHERE id = #{id}")
    volunteer = Volunteer.new(volunteer.first)
  end

end
