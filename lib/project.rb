class Project
  attr_accessor :title, :details, :id
  def initialize(attributes)
    @title = attributes["title"] || attributes[:title]
    @details = attributes["details"] || attributes[:details]
    @id = attributes["id"].to_i || attributes[:id].to_i
    if @id ==  0 then @id = nil end
    if @details = '' then @details = nil end
  end

  def save
    @id = DB.exec("INSERT INTO projects (title, details) VALUES ('#{@title}', '#{@details}') RETURNING id;").first["id"].to_i;
  end

  def == other_project
    (self.title == other_project.title) && (self.id == other_project.id)
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects ORDER BY title;")
    projects = []
    returned_projects.each() do |project|
      projects.push(Project.new(project))
      end
    projects

  end

end
