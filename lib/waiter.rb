class Waiter

  attr_accessor :name, :years_of_experience
  @@all = []

  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    @@all << self
  end

  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip)
    meal = Meal.new(self, customer, total, tip)
    @@all << meal
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end
  
  def best_tipper
    Meal.all.select do |meal|
      meal.tip
    end
  end
  
end