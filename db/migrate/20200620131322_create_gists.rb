class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true
      t.string :gist_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
