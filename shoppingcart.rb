# Algorithm
# 1. Welcome message
# 2. prompt with option
# 3. get user input
# 4. based on user input perform certain action
#   1. if start
#     1. display message to add item
#     2. enter the item name
#     3. ask for the quantity
#     4. store the entered items in an array
#     4. continue adding stuff
#       1. keep adding items
#       2. else exit
#    2. if print
#       print the stored items from the array
#    3. exit and save a copy and a good bye message

class Shopping
  # instance methods
  # initialize method called each time an object/instance is created

  def initialize(name)
    # instance variable is assigned with the name passed from the object
    @name = name
    # initialize an empty array for each customer
    @shopping_list = Array.new
    # @item_hash = Hash.new
  end
  def start_shopping
    puts "Hi #{@name}, welcome to easy shop,chuck in the the items you run out and we will save a copy for you"

  end

  def menu
    exit_menu = true
    while exit_menu
      puts "Enter an option
      Start - to start Shopping
      Print - to print out the saved items
      Exit - Save a copy and exit the app"
      menu_choice = gets.chomp.capitalize
      if menu_choice == "Start"
        # perform start actions
        exit_start = true
        # loop through the items
        while exit_start
          # reset hash each time a new item is added
          item_hash = Hash.new
          puts "Add item to the cart, enter b to go back to the main menu"
          item = gets.chomp.capitalize
          if item == "B"
            exit_start = false
            # menu # self calling function
          else
            puts "how many #{item}'s would you like"
            quantity = gets.to_i
            # generate a hash of item and quantity : eg: {:banana => 10}
            item_hash[item] = quantity
            # push the item array
            @shopping_list.push(item_hash)
            # puts @shopping_list
          end # end the if case
        end #end the while loop

      elsif menu_choice == "Print"
        # perform print actions
        # print out the array element
        puts "Here is what you have added so far"
        # puts @shopping_list
        # puts @shopping_list
        @shopping_list.each do |ele|
          # puts item_hash
          # puts ele
          ele.each do|k,v|
            puts "you have added #{v} #{k}'s"
          end #hash block ends
        end #array block ends
      elsif menu_choice == "Exit"
        # save the content to the file
        File.open("#{@name}.shopping_list.txt",'a')do |f|
        f.puts(@shopping_list)
        end
        exit_menu = false
        # save the copy and exit
      else
        puts "computer does not understand #{menu_choice}, please enter start, print or finish"
      end #this is the end of if case
    end #end of while for menu
  end # end of menu method
end #end of class method
# create an instance of the class shopping and pass the name attribute
customer1 = Shopping.new("Mary")
# call the methods on the object
customer1.start_shopping
customer1.menu
customer2 = Shopping.new("Haynes")
customer2.start_shopping
customer2.menu
# customer2 = Shopping("Alex")
# Shopping.shopping_list```
