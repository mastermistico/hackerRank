class CalcRank
    def initialize(hackers)
        @hackers = hackers
    end

    def calc_rank
        @repos = ReposHack.new(@hackers).repo_hack
        @event = EventHack.new(@repos).event_hack
        @event.each do |user|
            user[:score] = (
                user[:collaborations] / 0.5 +
                user[:start] / 0.2 +
                user[:fork] / 0.2 +
                user[:repos] / 0.1
            )
        end
        return @event
    end
end