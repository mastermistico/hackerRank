class GithubUsers
    def initialize(country)
        @country = country
    end

    def get_users
        @users = Faraday.get("https://api.github.com/search/users?q=location:#{@country}")
        return "holi #{@users.status}"
    end
end