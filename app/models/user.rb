class User < ApplicationRecord

    validates :password, length: { minimum: 8, too_long: "Não é permitido menos que #{count} caracteres" }
    validates :name, length: { minimum: 3, maximum: 32 }
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

end