class AddFieldsToChallengeAndUser < ActiveRecord::Migration[5.1]
  def change

    add_column :challenges, :challenger, :integer
    add_column :challenges, :description, :text
    add_column :challenges, :criteria, :text

  end
end
