# frozen_string_literal: true

class AbstractStructure
  def add(_log_entry)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def statistics_list
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
