class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} not implemented yet '#{__method__}'"
  end
end
