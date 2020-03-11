class User < ApplicationRecord
  def to_pleasant_string
    "Name: #{name} Email: #{email} Password: #{password}"
  end
end
