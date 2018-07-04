class User < ApplicationRecord

    validates :password, length: { minimum: 8, too_short: "Não é permitido menos que #{count} caracteres" }
    validates :name, length: { minimum: 3, maximum: 32 }
    validates_format_of :email, :with => /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    before_save :convert_password

    def as_json(options = {exclude: [:password, :login_datetime]})
        serializable_hash(options)
    end

    #Method to login a user
    def login(password)
        if is_password_correct?(password)
            self.update(logged: true, login_datetime: Time.now)
        else
            false
        end
    end

    #Logout user
    def logout
        self.update(logged: false, login_datetime: nil)
    end

    private

    # Convert password to encode64 and before save it
    def convert_password
        converted_password = Base64.encode64(self.password)
        self.password = converted_password
    end

    # Check if a password matches
    def is_password_correct?(password)
        converted_real_password = Base64.encode64(self.password)
        converted_parameter_password = Base64.encode64(password)
        converted_parameter_password == converted_real_password
    end

end