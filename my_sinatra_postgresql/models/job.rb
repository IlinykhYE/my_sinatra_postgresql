class Job < Sequel::Model
  one_to_one :company
  one_to_many :applies

  def self.by_name(name)
    res = []
    res = where(name: /#{name}/i) if name
    puts "In by_name dataset mod: res = #{res.inspect}"
    # res.empty? ? [].to_json : collection_to_api(res)
    res.empty? ? [] : res
  end

  dataset_module do
    def by_place(place)
      puts 'In by_place dataset mod'
      where(place: /#{place}/i) if place
    end
  end



  def to_api
    {
      id: id.to_s,
      name: name,
      location: place
    }
  end
end
