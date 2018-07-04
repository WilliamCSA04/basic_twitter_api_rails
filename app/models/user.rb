class User < ApplicationRecord

    validates :password, length: { minimum: 8, too_long: "Não é permitido menos que #{count} caracteres" }
    validates :name, length: { minimum: 3, maximum: 32 }
    validates_format_of :email, :with => /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    before_save :convert_password

    private

    def convert_password
        converted_password = Base64.encode64(self.password)
        self.password = converted_password
    end

end