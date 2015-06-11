class Event < ActiveRecord::Base
   belongs_to :creator, :class_name => "User"
   has_many :attendees, through: :invites
   has_many :invites, foreign_key: :attended_event_id
   
   scope :past, -> { where('date < ?', Date.today) }
   scope :future, -> { where('date >= ?', Date.today) }
   
  # def self.past
      
   #   self.all.select { |event| event.date < Time.now }
   #end
   
   #def self.future
    #  self.all.select { |event| event.date >= Time.now }
   #end
end

