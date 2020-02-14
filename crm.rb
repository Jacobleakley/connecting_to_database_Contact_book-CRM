require_relative 'contact'

class CRM

  def initialize(name_of_CRM)
    @name = name_of_CRM
  end

  attr_accessor :name

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit!
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp
  
    print 'Enter Last Name: '
    last_name = gets.chomp
  
    print 'Enter Email Address: '
    email = gets.chomp
  
    print 'Enter a Note: '
    note = gets.chomp
  
    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print 'Enter the ID of the contact you want to modify: '
    id = gets.chomp.to_i
    contact_to_modify = Contact.find(id)
      if contact_to_modify == nil
      print 'The ID you provided was not found.'
      main_menu
    else 
    print 'What would you like to modify? '
    puts 'Enter [1] for First Name '
    puts 'Enter [2] for Last Name '
    puts 'Enter [3] for Email '
    puts 'Enter [4] for Note '
    user_input = gets.chomp.to_i
    print 'Enter the new value that will be updated to this Contact: '
    value = gets.chomp
    contact_to_modify.update(user_input, value)
    end 
  end

  def delete_contact
    print 'Enter the ID of the contact you want to delete: '
    id = gets.chomp.to_i
    contact_to_delete = Contact.find(id)
    contact_to_delete.delete
  end

  def display_all_contacts
    return Contact.all
  end

  def search_by_attribute
    print 'Enter the attribute you want to search: '
    puts 'Enter [1] for First Name '
    puts 'Enter [2] for Last Name '
    puts 'Enter [3] for Email '
    puts 'Enter [4] for Note '
    user_input = gets.chomp.to_i
    print 'Enter the value '
    value = gets.chomp
    p Contact.find_by(user_input, value)
  end
end
