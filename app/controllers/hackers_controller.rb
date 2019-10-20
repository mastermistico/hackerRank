class HackersController < ApplicationController

    def hackers_search
        @search_result = GithubUsers.new('colombia').get_users
        render json: 'hola'
    end
end
