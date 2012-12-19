class AddSearchTerm < ActiveRecord::Migration
  def change
    add_column :photos, :search_term, :string
  end
end
