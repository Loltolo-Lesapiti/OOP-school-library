require_relative '../person'
describe Person do
  context 'Unit Test For Person Class' do
    age = 18
    name = 'Kira'
    person = Person.new(age, name, parent_permission: false)

    it 'If It Has The Correct name' do
      expect(person.name).to eq('Kira')
    end

    it 'If It Has The Correct Age' do
      expect(person.age).to eq(18)
    end

    it 'If It Has The Correct class name' do
      expect(person.class.name) == Person
    end

    it 'If it creates a new instance of person' do
      expect(person).to be_an_instance_of(Person)
    end
  end
end
