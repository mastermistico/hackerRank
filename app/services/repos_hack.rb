class ReposHack
    def initialize(hackers)
        @hackers = hackers
    end
    
    def repo_hack
        @hackers.each do |hack,lines|
            sleep(10)
            @hackers[lines][:repos] = JSON.parse(Faraday.get(hack['repos_url']).body).length
        end
        return @hackers
    end
end