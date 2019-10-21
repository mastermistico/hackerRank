class EventHack
    def initialize(hackers)
        @hackers = hackers
    end
    
    def event_hack
        @hackers.each do |hack,lines|
            @tmp = JSON.parse(Faraday.get("https://api.github.com/users/#{hack[:login]}/events"))
            @hackers[lines][:collaborations] = @tmp.length
            @hackers[lines][:fork] = @tmp.select{|item| 'ForkEvent'==item[:type]}.length
            @hackers[lines][:start] = @tmp.select{|item| 'StartEvent'==item[:type]}.length
        end
        return @hackers
    end
end