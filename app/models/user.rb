class User < ApplicationRecord

    validates :password, length: { minimum: 8, too_long: "Não é permitido menos que #{count} caracteres" }

end