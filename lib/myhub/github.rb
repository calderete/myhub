module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    # Your code here too!
    def initialize
      @headers = {
        "Authorization"  => "token #{ENV["AUTH_TOKEN"]}",
        "User-Agent"     => "HTTParty"
      }
    end

    def list_issues
      response = Github.get("/user/issues", :header => @headers)
    end

    def reopen_issue(id)
      Github.patch("/repos/calderete/myhub/#{id}", :header => @headers, :body => {state: "open"}.to_json
    end

    def close_issue(id)
      Github.patch("/repos/calderete/myhub/#{id}", :header => @headers, :body => {state: "closed"}.to_json
    end
  end
end
