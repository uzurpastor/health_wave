class Collector
  def self.group_doctors_by_categories(*args)
    new(*args).group_doctors_by_categories
  end

  def initialize(options)
    @options = options
  end

  def group_doctors_by_categories
    collect = Hash.new 
    Category.all.each do |category|
      doctors_list = collect_doctors_by(category)
      collect["#{category.name}"] = doctors_list
    end
    collect
  end
private

  def collect_doctors_by category
    @options.map do |doctor|
      doctor.name if category.doctors.include?(doctor)
    end.compact
  end
end