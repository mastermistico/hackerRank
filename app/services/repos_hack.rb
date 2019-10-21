class ReposHack
    def initialize(hackers)
        @hackers = hackers
    end
    def repo_hack
        @hackers.each do |hack,lines|
            @hackers[lines][:repos] = JSON.parse(Faraday.get(hack['repos_url'])).length
        end
    end
    return @hackers
end