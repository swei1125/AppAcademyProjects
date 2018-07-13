class AddColumnTrackType < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :track_type, :string
  end
end
