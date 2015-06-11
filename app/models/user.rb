class User < ActiveRecord::Base
    has_many :events, :foreign_key => :creator_id, class_name: 'Event'
    has_many :invites, :foreign_key => :attendee_id
    has_many :attended_events, through: :invites
    
    validates :name, presence: true, uniqueness: true
    
    
    def previous_events
       self.attended_events.select do |event|
           event.date < Time.now
       end
    end
    
    def future_events
        self.attended_events.select do |event|
            event.date > Time.now
        end
    end
end
