class User < ActiveRecord::Base
    has_many :events, :foreign_key => :creator_id, class_name: 'Event'
    has_many :invites, :foreign_key => :attendee_id
    has_many :attendend_events, through: :invites
    
    validates :name, presence: true, uniqueness: true
    
    
        
end
