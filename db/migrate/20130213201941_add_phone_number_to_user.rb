class AddPhoneNumberToUser < ActiveRecord::Migration
  def change
      add_column :users, :first_contact, :integer
      add_column :users, :second_contact, :integer
  end
end
