class CreateSupportRequests < ActiveRecord::Migration
  def change
    create_table :support_requests do |t|
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
