require "pry"

class Owner

  @@all = []

  attr_accessor :pets, :name
  attr_reader :species

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {fishes: [], cats: [], dogs: []}
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.each do |animal, pets|
      pets.each {|pet| pet.mood = "nervous"}
      pets.clear
    end
  end

  def list_pets
    fishes = "#{self.pets[:fishes].count} fish,"
    dogs = "#{self.pets[:dogs].count} dog(s),"
    cats = "and #{self.pets[:cats].count} cat(s)."
    "I have #{fishes} #{dogs} #{cats}"
  end

end

# Pry.start
