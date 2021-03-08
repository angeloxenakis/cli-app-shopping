require_relative './config/environment.rb'



def welcome
    title = Artii::Base.new(:font => "slant")
    puts "Welcome to:"
    puts title.asciify("The Store")
end

def login
    users = User.all.map {|user| user.name}
    prompt = TTY::Prompt.new
    login_choice = prompt.select("What would you like to do?", ["Login", "Sign Up", "Exit"])
    if (login_choice == "Login")
        current_username = prompt.ask("What is your username?")
        current_password = prompt.ask("What is your password?")
        if users.include?(current_username) && User.all.find_by(password: current_password)
            puts "Let's start shopping"
        else 
            puts "Incorrect username or password"
            exit!
        end
    end
end

def shopping
    items = Item.all.map {|item| item.name }
    prompt = TTY::Prompt.new
    item_choice = prompt.select("Please select an item from our shop:", items)
    puts "You purchased a #{item_choice}!!!!"
    menu_options = prompt.select("What would you like to do next", ["continue shopping", "sign out"])
    if menu_options == "continue shopping"
        shopping
    else
        login
    end
end

welcome
login
shopping
