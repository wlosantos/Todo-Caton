class Task < ApplicationRecord

  validates :description, presence: { message: 'este campo é obrigatório!!!' }

end
