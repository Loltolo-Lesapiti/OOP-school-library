require_relative 'person'
class Teacher < Person
    def initialize(specialization)
        super(age, name)
        @specialization=specialization
    end
    def can_use_services?
        return true
    end
end