class ImportQuestions
  def initialize(file)
    @file = file
  end

  def import
    CSV.foreach(@file.path, headers: true) do |row|
       role = Role.find_or_create_by(title: row["Role"])
       mapping = Mapping.find_or_create_by(title: row["Mapping"])
       Question.find_or_create_by(question: row["Question"]) do |question|
        question.priority = row["Pri"]
        question.teaming_stages = row["Teaming Stages"]
        question.appears = row["Appears (Day)"]
        question.frequency = row["Frequency"]
        question.type = row["Type"]
        question.required = row["Required?"]
        question.conditions = row["Conditions"]
        question.role = role
        question.mapping = mapping
       end
    end
  end
end