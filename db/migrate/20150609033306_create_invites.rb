class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      
      t.integer :attendee_id, index: true
      t.integer :attended_event_id, index: true

      t.timestamps
    end
  end
end
