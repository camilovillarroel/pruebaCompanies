class AddContentToComplaint < ActiveRecord::Migration[5.2]
  def change
    add_column :complaints, :content, :string
  end
end
