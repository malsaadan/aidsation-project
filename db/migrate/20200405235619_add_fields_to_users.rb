class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :user_type, :string
  end

  # Initialize first account:
  # User.create! do |u|
  #   u.name = 'tester'
  #   u.user_type = 'recipient'
  #   u.email     = 'test@test.com'
  #   u.password  = 'password'
  # end

end
