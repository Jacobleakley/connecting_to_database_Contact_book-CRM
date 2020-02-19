gem 'activerecord', '=4.2.10'
gem 'sqlite3', '=1.3.13'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name, as: :string
  field :email, as: :string
  field :note, as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

end

Contact.auto_upgrade!

# ted = Contact.create(
#   first_name: "Ted",
#   last_name: "Small",
#   email: "tsmall@hotmail.com",
#   note: "confused"
#   )

# ed = Contact.create("Ed", "Coke", "ecoke@gmail.com", "2nd or 3rd contact")


# p Contact.find(2)

# # Contact.find_by(key, value)
# # Contact.find_by("a", "ted")

# print ted.full_name

# Contact.delete_all
# p Contact.all


at_exit do
  ActiveRecord::Base.connection.close
end 

