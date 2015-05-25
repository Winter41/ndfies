class AddMp3ToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :mp3, :string
  end
end
