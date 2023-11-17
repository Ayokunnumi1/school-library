require_relative '../student'
require_relative '../teacher'

def load_people
  file_path = "#{DATA_PATH}/people.json"

  File.write(file_path, '[]') unless File.exist?(file_path)

  json_data = File.read(file_path)
  return if json_data.empty?

  @people = JSON.parse(json_data).map do |data|
    case data['type']
    when 'student'
      student = Student.new(data['age'], data['classroom'], data['name'], parent_permission: data['parent_permission'])
      student.assign_id(data['id'])
      student
    when 'teacher'
      teacher = Teacher.new(data['age'], data['specialization'], data['name'], parent_permission: true)
      teacher.assign_id(data['id'])
      teacher
    end
  end
end
