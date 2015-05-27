class ChangeMp3ToFile < ActiveRecord::Migration
  def change
    rename_column :tracks, :mp3, :file
  end
end
