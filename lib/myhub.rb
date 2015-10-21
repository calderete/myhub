require "sinatra/base"
require "httparty"
require "pry"

require "myhub/version"
require "myhub/github"

module Myhub
  class App < Sinatra::Base
    set :logging, true

    # Your code here ...
    get "/" do
      api = Github.new
      # get stuff from github
      #api.list_issues
      erb :index, locals: { issues: api.list_issues }
    end

    post "/issue/reopen/:id" do
      api = Github.new
      api.reopen_issue(params["id"].to_i)
      "Cool cool cool"
    end

    post "/issue/close/:id" do
      api = Github.new
      api.close_issue(params["id"].to_i)
      "Cool cool cool"
    end

    run! if app_file == $0
  end
end
