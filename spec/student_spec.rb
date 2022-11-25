require_relative '../student'
require_relative '../classroom'
describe Student do
    context 'Unit test for Student Class' do
      age = 18
      name = 'Kira'
      classroom = 'Death Note'
      parent_permission = true
      new_student = Student.new(age, name, parent_permission, classroom)
  
      it 'If the student age is correct' do
        expect(new_student.age).to eq(18)
      end
  
      it 'If the student name is correct' do
        expect(new_student.name).to eq('Kira')
      end
  
      it 'If the student classroom is correct' do
        expect(new_student.classroom).to eq('Death Note')
      end
  
      it 'If it creates a new instance of student' do
        expect(new_student).to be_an_instance_of(Student)
      end
    end
  end