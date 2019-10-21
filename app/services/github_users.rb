class GithubUsers
    def initialize(country)
        @country = country
    end

    def get_users
        @page = 0
        @hackers= []
        loop do
            @page = @page + 1
            @users_resp = Faraday.get("https://api.github.com/search/users?q=location:#{@country}&page=#{@page}&per_page=100")
            @users = JSON.parse(@users_resp.body)
            if @users['items'] == nil
                break
            end
            @temp = @users['items'].map{
                |i| {
                    'login' => i['login'],
                    'repos_url' => i['repos_url'],
                    'repos' => 0,
                    'start' => 0,
                    'collaborations' => 0,
                    'fork' => 0,
                    'score' => 0
                }
            }
            @hackers.concat(@temp) 
        end
        return @hackers
    end
end
