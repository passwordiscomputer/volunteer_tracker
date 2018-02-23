class Project
  attr_accessor :title, :details, :id
  def initialize(attributes)
    @title = attributes[:title]
    @details = attributes[:details]
  end

  def save
    @id = DB.exec("INSERT INTO projects (title, details) VALUES ('#{@title}', '#{@details}') RETURNING id;").first["id"].to_i;
  end
end
