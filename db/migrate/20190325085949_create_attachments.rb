class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :data_attachments, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
