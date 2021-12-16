class Apply < Sequel::Model
  one_to_one :geek
  one_to_one :job

  def self.read
    where(read: true)
  end

  def self.unread
    where(read: false)
  end

end
