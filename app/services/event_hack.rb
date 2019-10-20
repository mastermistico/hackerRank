class EventHack
    def initialize(hackers)
        @hackers = hackers
    end
    def event_hack
        @hackers.each do |hack,lines|
            @tmp = JSON.parse(Faraday.get("https://api.github.com/users/#{username}/events"))
            @hackers['collaborations'] = @tmp.length
            @hackers['fork'] = @tmp.select{|item| 'ForkEvent'==item[:type]}.length
            @hackers['start'] = @tmp.select{|item| 'StartEvent'==item[:type]}.length
        end
    end    
end    