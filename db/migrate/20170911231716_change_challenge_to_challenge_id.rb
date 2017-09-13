class ChangeChallengeToChallengeId < ActiveRecord::Migration[5.1]
  def change

    remove_column :challenges, :challenger

    add_reference :challenges, :challenger, references: :users, index: true
    add_foreign_key :challenges, :users, column: :challenger_id

  end
end
