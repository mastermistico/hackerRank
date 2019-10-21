class HackersController < ApplicationController

    def hackers_search
        @search_result = GithubUsers.new('colombia').get_users
        @rank_result = CalcRank.new(@search_result)
        @result = @rank_result.calc_rank.sort_by {|obj| obj[:score]}.reverse.first(100)

        element = "<div> <table>\n"
        element += "<thead><th><td>User</td><td>Info</td><td>Followers</td><td>Commits</td><td>Stars</td><td>Repos</td><td>Issues/PR</td></th><thead>\n"
        element += "<tbody>"
        @result.each_with_index do |user, i|
            element += "<tr><td>#{i + 1}</td>"
            element += "<td><b>#{user[:login]}</b></td>"
            element += "<td>#{user[:score]}</td><td>#{user[:collaborations]}</td><td>#{user[:start]}</td><td>#{user[:repos]}</td><td>#{user[:fork]}</td></tr>\n"
        end
        element += "</tbody>"
        element += "</table> </div>\n"
        render inline:  element
    end
end
