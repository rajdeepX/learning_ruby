require "bcrypt"
require "json"



class Blog
    attr_accessor :users_data
    def initialize
        @users_data = []
        load_user_data()
    end

    def menu
        loop do
            puts "WELCOME TO BLOGSITE"
            puts "\n1. Register\n2. Login\n0. Exit"
            print "Choose an option: "
            choice = gets.chomp.to_i

            case choice
            when 1
            register_user()
            when 2
            login_user()
            when 0
            puts "Exiting!"
            break
            else
            puts "Invalid choice! Try again."
            end
        end
    end
        
    def register_user
        puts "Enter username: "
        user_name = gets.chomp()
        puts "Enter password: "
        user_password = gets.chomp()

        @users_data.each {|x|
            if x["username"] == user_name
            puts "Username already taken!"
            return
            end
        }

        hashed_password = BCrypt::Password.create(user_password)

        user = {
            "username" => user_name,
            "password" => hashed_password,
            "posts" => []
        }
        @users_data << user
        save_user_data()
        puts "\nRegistraion successful\n"
    end
    
    def login_user()
        puts "Enter username: "
        user_name = gets.chomp().to_s
        puts "Enter password: "
        user_password = gets.chomp().to_s
        
        user = @users_data.find {|x| x["username"] == user_name}
        if user
            if BCrypt::Password.new(user["password"]) == user_password
                puts "\nlogin successful!"
                access_user(user)
                puts "----------------"
            else
                puts "incorrect password!"
            end
        else puts "No user found!"
        end
    end


    def access_user(user)
        loop do
            puts "\nUser Menu"
            puts "1. Create Post"
            puts "2. View My Posts"
            puts "3. Edit My Posts"
            puts "4. Delete Post"
            puts "5. Edit Username"
            puts "6. Edit Password"
            puts "0. Logout"
            print "Choose an option: "
            choice = gets.chomp.to_i

            case choice
            when 1
                create_post(user)
            when 2
                view_posts(user)
            when 3
                edit_posts(user)
            when 4
                delete_post(user)
            when 5
                edit_username(user)
            when 6
                edit_password(user)
            when 0
                puts "Logging out..."
                break
                else
                puts "Invalid choice! Please try again."
            end
        end
    end

    def create_post(user)
        puts "Create your post here"
        puts "Provide an unique ID for your post:"
        id = gets.chomp().to_s
        
        user["posts"].each {|x|
            if x["id"] == id
                puts "ID already in use"
                return
            end
        }

        puts "Enter Titile: "
        title = gets.chomp().to_s
        puts "Write your content:"
        content = gets.chomp().to_s
    
        post = {
            "id" => id,
            "title" => title,
            "content" => content
        }
        user["posts"] << post
        save_user_data()
        puts "Your post has been successfully created!"
        puts "----------------------"
    end


    def view_posts(user)
        user["posts"].each {|x|
            puts x["id"]
            puts x["title"]
            puts x["content"]
        }
        puts "---------------"
    end


    def edit_posts(user)
        puts "Enter the exact ID of the post you want to edit."
        id = gets.chomp().to_s

        user["posts"].each {|x|
            if x["id"] == id
                puts "Enter new title:"
                new_title = gets.chomp().to_s
                puts "Enter new content:"
                new_content = gets.chomp().to_s

                x["title"] = new_title
                x["content"] = new_content

                save_user_data()
                puts "Post successfully updated!"
                puts "-------------------"
            else
                puts "ID not matched!"
            end
        }
    end

    def delete_post(user)
        puts "Enter the exact ID of the post you want to delete."
        id = gets.chomp().to_s

        post = user["posts"].find {|x| x["id"] == id}

        user["posts"].delete(post)
        save_user_data()
            puts "Post successfully deleted!"
            puts "-------------------"
    end


    def edit_username(user)
        puts "Enter new username: "
        new_username = gets.chomp().to_s

        user["username"] = new_username

        puts "\nUpdate successful!\n"
        save_user_data()

    end

    def edit_password(user)
        puts "Enter new password: "
        new_password = gets.chomp().to_s

        hashed_password = BCrypt::Password.create(new_password)

        user["password"] = hashed_password

        puts "\nUpdate successful!\n"
        save_user_data()
    end

    private
    def load_user_data

        if File.exist?("./file.json")
            file = File.read("./file.json")
            data = JSON.parse(file)
            @users_data += data
        end

    end

    def save_user_data
        File.open('./file.json', 'w') do |file|
            file.write(JSON.pretty_generate(@users_data))
        end
    end
end




login = Blog.new()
login.menu()



