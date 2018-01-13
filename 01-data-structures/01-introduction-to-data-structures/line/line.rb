# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

#Initialized the line of members "array" where the members names "strings" will be placed.
  def initialize
    self.members = []
  end

#Using push on the array to add the member to the back of the line.
  def join(person)
    self.members.push(person)
  end

#Using splice on the array to remove the person we specified from the line.
  def leave(person)
    self.members.slice!(self.members.index(person))
  end

#The very first person in line
  def front
    self.members.first
  end

#The middle person in the array, by dividing the length by two and rounding.
  def middle
    self.members[((members.length/2).round)]
  end

#The person in the back of the line
  def back
    self.members.last
  end

#Searchs the array, to see if that person is included in it.
  def search(person)
    self.members.include?(person) ? person : nil
  end

  private

#Returns the position in the array of the person we are searching for.
  def index(person)
    self.members.index(person)
  end
end
